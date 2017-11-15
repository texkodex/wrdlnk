//
//  GameScene.swift
//  wrdlnk
//
//  Created by sparkle on 6/1/17.
//  Copyright © 2017 teknowsys. All rights reserved.
//

import SpriteKit
import GameplayKit
import GameKit

enum GameSceneState: Int {
    case before = 0
    case play
    case graph
    case setting
    case stop
    case done
    static let Count = done.rawValue + 1
}

class GameScene: BaseScene {
    
    var commonGameController: CommonGameController?
    
    // MARK:- Top nodes
    let mark = ButtonNode(imageNamed: "pdf/mark")
    
    // MARK:- Nodes
    var definitionButton: ButtonNode? {
        return backgroundNodeOne?.childNode(withName: ButtonIdentifier.provideMeaning.rawValue) as? ButtonNode
    }
    
    let graphButton: ButtonNode = ButtonNode(imageNamed: "pdf/scores")
    
    let settingsButton: ButtonNode = ButtonNode(imageNamed: "pdf/settings")
    
    var definitionOff = false {
        didSet {
            let imageName = definitionOff ? "questionOff" : "questionOn"
            definitionButton?.selectedTexture = SKTexture(imageNamed: imageName)
        }
    }
    
    var graphOff = false {
        didSet {
            let imageName = graphOff ? "pdf/scores" : "pdf/scores"
            graphButton.selectedTexture = SKTexture(imageNamed: imageName)
            
            AppDefinition.defaults.set(graphOff, forKey: preferenceShowGraphKey)
        }
    }
    
    // MARK:- SKLabelNode
    let playerScoreLabel = SKLabelNode(text: "0")
    
    var highScoreLabel: SKLabelNode? {
        return nil
    }
    
    var playerTimerLabel = SKLabelNode(text: ". %02d:%02d .")
    
    // MARK:- Overlay scenes
    var gameState: GameSceneState = .before {
        willSet {
            willShowPopScene(newValue)
        }
    }
    
    private var graphOverlayNode: GraphOverlay?
    
    // MARK:- Game state
    private var _gameSceneState: GameSceneState = .stop
    
    // MARK:- Data structures
    var wordList: WordListBox {
        get { return WordListBox.sharedInstance }
    }
    
    var lastlabelNodeClick: SKLabelNode? = nil
    
    var counters : VowelCountBox {
        get { return VowelCountBox.sharedInstance }
    }
    
    var liveData : LiveDataBox {
        get { return LiveDataBox.sharedInstance }
    }
    
    var statData : StatDataBox {
        get { return StatDataBox.sharedInstance }
    }
    
    let nodeMap = [ViewElement.main.rawValue, ViewElement.board.rawValue,
                   ViewElement.control.rawValue, ViewElement.buttons.rawValue]
    
    var tileNodeList: [SKSpriteNode] = []
    
    var matchList: [String] = []
    
    var keyPlayNotificationDictionary = [String:String]()
    var contentPlist:[[String:String]] = []
    
    var notificationMessageList: [String] = []
    var awardMessageList: [String] = []
    var completedMessageList: [String] = []
    
    var resetCounters:Bool {
        get {
            return AppDefinition.defaults.bool(forKey: preferenceStartGameEnabledKey)
        }
        set {
            AppDefinition.defaults.set(newValue, forKey: preferenceStartGameEnabledKey)
        }
    }
    
    var resetTimer:Bool {
        get {
            return AppDefinition.defaults.bool(forKey: preferenceContinueGameEnabledKey)
        }
        set {
            AppDefinition.defaults.set(newValue, forKey: preferenceContinueGameEnabledKey)
        }
    }
    
    var initializeTimer:Bool {
        get {
            return AppDefinition.defaults.bool(forKey: preferenceSetTimerEnabledKey)
        }
    }
    
    
    var playerScore:Int {
        get {
            return AppDefinition.defaults.integer(forKey: preferenceCurrentScoreKey)
        }
        set {
            playerScoreLabel.text = "\(newValue)"
            AppDefinition.defaults.set(newValue, forKey: preferenceCurrentScoreKey)
        }
    }
    
    var playerTimer = 0
    
    var levelTime:Int  {
        get {
            return AppDefinition.defaults.integer(forKey: preferenceGameLevelTimeKey)
        }
    }
    
    var startTime:Int  {
        get {
            return AppDefinition.defaults.integer(forKey: preferenceStartTimeKey)
        }
        set {
            AppDefinition.defaults.set(newValue, forKey: preferenceStartTimeKey)
        }
    }
    
    struct initialize {
        static var doOnce: Bool = false
    }
    
    // MARK:- Common classes
    class func labelWithText(_ text: String, andSize textSize: CGFloat, color: UIColor = foregroundColor) -> SKLabelNode {
        let fontName = UIFont.systemFont(ofSize: textSize).fontName
        let _label = SKLabelNode(fontNamed: fontName)
        
        _label.text = text
        _label.fontSize = textSize
        _label.fontColor = color
        
        return _label
    }
    
    deinit {
        print("Entering \(#file):: \(#function) at line \(#line)")
        preserve()
        tileNodeList.removeAll()
        matchList.removeAll()
        self.removeFromParent()
        self.removeAllChildren()
        self.removeAllActions()
        self.view?.presentScene(nil)
    }
    
    private func preserve() {
        if !counters.matchComplete() {
            wordList.stay()
        }
        wordList.saveWordList()
        statData.saveData()
        liveData.saveLiveData()
        counters.saveVowelCount()
    }
    
    var gameSceneState: GameSceneState {
        get {
            return _gameSceneState
        }
        set(nextState) {
            if _gameSceneState == nextState {
                return
            }
            
            _gameSceneState = nextState
        }
    }
    
    // MARK:- Popover scenes
    private func willShowPopScene(_ gameState: GameSceneState) {
//        self.graphOverlayNode?.removeFromParent()
//
//        switch gameState {
//        case .before:
//            self.hidePopOverUI(true)
//        case .graph:
//            self.graphOverlayNode = GraphOverlay(size: self.frame.size)
//            self.addChild(self.graphOverlayNode!)
//
//        default:
//            return
//        }
        
    }
    
    private func touchAtPoint(_ location: CGPoint) {
        switch gameState {
        case .before:
            self.hidePopOverUI(true)
        case .graph:
            self.graphOverlayNode?.touchAtPoint(location)
        default:
            return
        }
    }
    
    private func hidePopOverUI(_ hide: Bool) {
        print("Hide all popover scenes")
    }
    
    // MARK: End of Popover handling
    
    override func didMove(to view: SKView) {
        super.didMove(to: view)
        print("Entering \(#file):: \(#function) at line \(#line)")
        placeAssets()
        setupCountersAndWords()
        setupGameSceneResources()
        
       
        let tapBoardGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.handleTapFrom(recognizer:)))
        tapBoardGestureRecognizer.numberOfTapsRequired = 1
        view.addGestureRecognizer(tapBoardGestureRecognizer)
        
        playNotification()
        // Start game timer
        setupTimer()
        
        testGraphOverlay()
        
        AppTheme.instance.set(for: self)
    }
    
    func setupTimer() {
        if initializeTimer {
            startTime = AppDefinition.defaults.integer(forKey: preferenceGameLevelTimeKey)
            AppDefinition.defaults.set(false, forKey: preferenceSetTimerEnabledKey)
        }
        self.playerTimerLabel.text = timerString()
        countTime()
    }
    
    func modePrefixString() -> String {
        if currentMode().rawValue.contains("normal") {
            return ""
        }
        else {
            return currentMode().rawValue + "/"
        }
    }
    
    func playNotification() {
        let path = Bundle.main.path(forResource: AppDefinition.PlayNotification, ofType: AppDefinition.PropertyList);
        self.contentPlist = NSArray(contentsOfFile:path!) as! [[String:String]]
        
        self.keyPlayNotificationDictionary = self.contentPlist[0]
        let modePrefix = modePrefixString()
        notificationMessageList.append(modePrefix + keyPlayNotificationDictionary["message_great"]!)
        notificationMessageList.append(modePrefix + keyPlayNotificationDictionary["message_super"]!)
        notificationMessageList.append(modePrefix + keyPlayNotificationDictionary["message_goodwork"]!)
        notificationMessageList.append(modePrefix + keyPlayNotificationDictionary["message_fabulous"]!)
        
        awardMessageList.append(modePrefix + keyPlayNotificationDictionary["message_amazing"]!)
        awardMessageList.append(modePrefix + keyPlayNotificationDictionary["message_topnotch"]!)
        awardMessageList.append(modePrefix + keyPlayNotificationDictionary["message_yeah"]!)
        awardMessageList.append(modePrefix + keyPlayNotificationDictionary["message_award"]!)
        
        completedMessageList.append(modePrefix + keyPlayNotificationDictionary["message_yeah"]!)
        completedMessageList.append(modePrefix + keyPlayNotificationDictionary["message_goodwork"]!)
        completedMessageList.append(modePrefix + keyPlayNotificationDictionary["message_super"]!)
        completedMessageList.append(modePrefix + keyPlayNotificationDictionary["message_amazing"]!)
        completedMessageList.append(modePrefix + keyPlayNotificationDictionary["message_topnotch"]!)
        completedMessageList.append(modePrefix + keyPlayNotificationDictionary["message_fantastic"]!)
        
    }
    
    func playNotificationMessage()->String? {
        let count = notificationMessageList.count
        if count > 0 {
            return notificationMessageList[random(count)]
        }
        return nil
    }
    
    func awardMessage()->String? {
        let count = awardMessageList.count
        if count > 0 {
            return awardMessageList[random(count)]
        }
        return nil
    }
    
    func completedMessage()->String? {
        let count = completedMessageList.count
        if count > 0 {
            return completedMessageList[random(count)]
        }
        return nil
    }
    
    func readyForInit() {
        initialize.doOnce = false
    }
    
    func initComplete() {
        initialize.doOnce = true
    }
    
    func testIfInit() -> Bool {
        return !initialize.doOnce
    }
    
    private func resetForNewGame() {
        if resetCounters {
            wordList.reset()
            statData.purge()
            counters.deleteVowelCount()
            liveData.deleteLiveData()
            AppDefinition.defaults.set(0, forKey: preferenceCurrentScoreKey)
            startTime = AppDefinition.defaults.integer(forKey: preferenceGameLevelTimeKey)
            AppDefinition.defaults.set(true, forKey: preferenceContinueGameEnabledKey)
        }
    }
    
    private func setupGameSceneResources() {
        print("Entering \(#file):: \(#function) at line \(#line)")
        resetForNewGame()
        
        if testIfInit() {
            initComplete()
        }
        
        wordList.setSelectedRow(row: nil)
        
        // Enable buttons if data available
        initializeButtons()
        
        loadSavedSettings()
        
        // Update player score
        playerScoreUpdate()
        playerTimerUpdate()
        // Set the high score
        highScoreLabel?.text = "HighScore: " + AppDefinition.defaults.integer(forKey: "highscore").description
        
        replaySelection()
    }
    
    func placeAssets() {
        var position: CGPoint!
        position = CGPoint(x: size.width * layoutRatio.markPositionSizeWidth, y: size.height * layoutRatio.markPositionSizeHeightFromTop)
        var scaledWidth = size.width * layoutRatio.markWidthScale
        var scaledHeight = size.height * layoutRatio.markHeightScale
        
        mark.name = "mark"
        mark.scale(to: CGSize(width: scaledWidth, height: scaledHeight))

        var buttonParam: SceneButtonParam =
            SceneButtonParam(buttonNode: mark, spriteNodeName: "titleImage",
                             position: position,
                             defaultTexture: "pdf/mark", selectedTexture: "pdf/mark")
        sceneButtonSetup(param: buttonParam)
        
        var xPos = size.width * -(layoutRatio.xAnchor - layoutRatio.indentForScoreLabelFromLeftSideEdge)
        var yPos = size.height * (layoutRatio.yAnchor - layoutRatio.indentForScoreLabelFromTopEdge)

        position = CGPoint(x: xPos, y: yPos)
        var param: SceneLabelParam =
            SceneLabelParam(labelNode: playerScoreLabel, labelNodeName: layoutRatio.gameScoreName, position: position)
        sceneLabelSetup(param: param)
        
        xPos = size.width * (layoutRatio.xAnchor - layoutRatio.indentForTimerLabelFromTopEdge)
        position = CGPoint(x: xPos, y: yPos)
        param =
            SceneLabelParam(labelNode: playerTimerLabel, labelNodeName: layoutRatio.gameTimerName, position: position)
        sceneLabelSetup(param: param)
        
        xPos = size.width * (layoutRatio.xAnchor - layoutRatio.indentForGameButtonFromSideEdge)
        yPos = size.height * (layoutRatio.yAnchor - layoutRatio.indentForGameButtonFromTopEdge)
        position = CGPoint(x: xPos, y: yPos)
        
        scaledWidth = size.width * layoutRatio.buttonGraphWidthScale
        scaledHeight = size.height * layoutRatio.buttonGraphHeightScale
        graphButton.scale(to: CGSize(width: scaledWidth, height: scaledHeight))
        buttonParam = SceneButtonParam(buttonNode: graphButton, spriteNodeName: "ShowGraph",
                             position: position,
                             defaultTexture: "pdf/scores", selectedTexture: "pdf/scores")
        sceneButtonSetup(param: buttonParam)
        
        xPos = size.width * -(layoutRatio.xAnchor - layoutRatio.indentForGameButtonFromSideEdge)
        position.x = xPos
        
        scaledWidth = size.width * layoutRatio.buttonSettingsWidthScale
        scaledHeight = size.height * layoutRatio.buttonSettingsHeightScale
        settingsButton.scale(to: CGSize(width: scaledWidth, height: scaledHeight))
        buttonParam =
        SceneButtonParam(buttonNode: settingsButton, spriteNodeName: "GameSettings",
        position: position,
        defaultTexture: "pdf/settings", selectedTexture: "pdf/settings")
        sceneButtonSetup(param: buttonParam)
        
        placeBoard()
        placeButtons()
    }
    
    func placeBoard() {
        let getWords = wordList.getCurrentWords()!
        let lettersPerRow = [getWords.prefix.utf8.count, getWords.link.utf8.count, getWords.suffix.utf8.count]
        
        let maxTiles = lettersPerRow.map { $0 }.max()!
        var position: CGPoint!
        let tileWidth = size.width * layoutRatio.tileWidthToScreen
        let tileHeight = size.height * layoutRatio.tileHeightToScreen
        let tileInnerSpace = size.width * layoutRatio.spaceBetweenInnerTileInRow
        
        let xPos = size.width * -(layoutRatio.xAnchor - layoutRatio.indentToFirstBoardTile)
        let yPos = size.height * (layoutRatio.yAnchor - layoutRatio.indentFromTopEdgeFirstBoardRow)
        position = CGPoint(x: xPos, y: yPos)
        
        let maxAvailableTiles = Int(size.width / (tileWidth + tileInnerSpace))
        
        if maxAvailableTiles < maxTiles {
            print("Cannot display all tiles")
            return
        }
        
        var param: BoardTileParam = BoardTileParam()
        
        let wordsForRow = [getWords.prefix, getWords.link, getWords.suffix]
        let fontSize = tileHeight * layoutRatio.textSizeToTileHeight
        
        for row in 1...3 {
            // Adjust for less than max row tiles
            let tileAdjustment = (CGFloat(maxAvailableTiles) - CGFloat(lettersPerRow[row - 1])) / CGFloat(2.0)
            let xPosAdjustment = CGFloat(tileAdjustment) * (tileWidth + tileInnerSpace)
            
            for column in 1...lettersPerRow[row - 1] {
                param.row = row
                param.column = column
                
                position = CGPoint(x: position.x, y: position.y)
                param.position = position
                param.tileWidth = tileWidth
                param.tileHeight = tileHeight
                param.xPosAdjustment = xPosAdjustment
                param.zPosition = 10
                param.currentWord = wordsForRow[row - 1]
                param.fontSize = fontSize
                param.fontName = fontName
    
                placeBoardTile(param: param)
                
                position.x = position.x + tileWidth + tileInnerSpace
            }
            let yOffset = size.height * layoutRatio.spaceBetweenRowsInScreen
            position.x = xPos
            position.y = position.y - yOffset
        }
    }
    
    func placeBoardTile(param: BoardTileParam) {
        let index = param.currentWord.index(param.currentWord.startIndex, offsetBy: param.column - 1)
        
        // Create board tile
        let tile = SKSpriteNode(texture: SKTexture(imageNamed: param.textureBlueRedName))
        
        tile.name = "board_tile_\((param.row)!)_\((param.column)!)"
        tile.scale(to: CGSize(width: param.tileWidth, height: param.tileHeight))
        tile.position = CGPoint(x: param.position.x + param.xPosAdjustment, y: param.position.y)
        tile.zPosition = param.zPosition
        tile.userData = [:]
        // If board tile node is a vowel:
        // hide it and make it clickable
        let condition =  VowelCharacter(rawValue: param.currentWord[index])?.rawValue == param.currentWord[index]
        if condition {
            tile.userData = [tileUserDataClickName: true]
            tile.texture = SKTexture(imageNamed: param.textureGreenRedName)
        }
        
        addChild(tile)
        
        // Add the word letter to board
        let labelNode = SKLabelNode(fontNamed: param.fontName)
        labelNode.name = "board_letter_\((param.row)!)_\((param.column)!)"
        labelNode.position = CGPoint(x: tile.centerRect.midX, y: tile.centerRect.midY)
        labelNode.text = "\(param.currentWord[index])"
        if condition {
            labelNode.alpha = CGFloat(0.0)
        }
        labelNode.fontColor = .white
        labelNode.fontSize = param.fontSize
        labelNode.verticalAlignmentMode = .center
        labelNode.horizontalAlignmentMode = .center
        labelNode.zPosition = param.zPosition
        tile.addChild(labelNode)
        
        // Add highlight and set to invisible  for vowel
        if condition {
            addHighlight(tile: tile)
        }
    }
    
    func addHighlight(tile: SKSpriteNode) {
        let texture = SKTexture(imageNamed: super.getControlPadPathName())
        let hightlightNode = SKSpriteNode()
        hightlightNode.name = "highlight_\((tile.name)!)"
        hightlightNode.alpha = CGFloat(0.0)
        hightlightNode.zPosition = 10
        hightlightNode.size = CGSize(width: tile.size.width, height: tile.size.height)
        hightlightNode.run(SKAction.setTexture(texture))
        tile.addChild(hightlightNode)
    }
    
    func placeButtons() {
        var position: CGPoint!
        let tileWidth = size.width * layoutRatio.tileWidthToScreen
        let tileHeight = size.height * layoutRatio.tileHeightToScreen
        let tileInnerSpace = size.width * layoutRatio.spaceBetweenInnerTileInRow
        let fontSize = tileHeight * layoutRatio.textSizeToTileHeight
        let xPos = size.width * -(layoutRatio.xAnchor - layoutRatio.indentToCenterOfFirstButtonTile)
        let yPos = size.height * (layoutRatio.yAnchor - layoutRatio.indentFromTopEdgeToCenterOfButton)
        position = CGPoint(x: xPos, y: yPos)
        
        let labels = ["A", "E", "I", "O", "U", "Y"]
        
        for column in 1...layoutRatio.numberOfVowels {
            let tile = SKSpriteNode(texture: SKTexture(imageNamed: "pdf/tile"))
            
            position = CGPoint(x: position.x, y: position.y)
            tile.name = "button_tile_\(column)"
            tile.scale(to: CGSize(width: tileWidth, height: tileHeight))
            tile.position = position
            tile.zPosition = 10
            tile.userData = [tileUserDataClickName : true ]
            addChild(tile)
            
            let labelNode = SKLabelNode(fontNamed: fontName)
            labelNode.name = "button_letter_\(labels[column - 1])"
            labelNode.position = CGPoint(x: tile.centerRect.midX, y: tile.centerRect.midY)
            labelNode.text = "\(labels[column - 1])"
            labelNode.fontSize = fontSize
            labelNode.verticalAlignmentMode = .center
            labelNode.horizontalAlignmentMode = .center
            labelNode.zPosition = 10
            tile.addChild(labelNode)
            
            addHighlight(tile: tile)
            
            position.x = position.x + tileWidth + tileInnerSpace
        }
    }
    
    
    func addWords(word: Word) -> VowelCount {
        print("Entering \(#file):: \(#function) at line \(#line)")
        let linkWord = word
        
        return VowelCount(
            phrase: linkWord.prefix + phraseSeparator
                + linkWord.link + phraseSeparator + linkWord.suffix,
            prefix: linkWord.prefix.lazy.filter { VowelCharacter(rawValue: $0)?.rawValue == $0 }.count,
            link: linkWord.link.lazy.filter { VowelCharacter(rawValue: $0)?.rawValue == $0 }.count,
            suffix: linkWord.suffix.lazy.filter { VowelCharacter(rawValue: $0)?.rawValue == $0 }.count)
    }
    
    func setupCountersAndWords() {
        let counter = addWords(word: wordList.getCurrentWords()!)
        counters.setup(vowelCount: counter)
    }
    
    private func loadSavedSettings() {
        statData.loadData()
    }
    
    override func didChangeSize(_ oldSize: CGSize) {
        for node in self.children{
            let newPosition = CGPoint(x:node.position.x / oldSize.width * self.frame.size.width,y:node.position.y / oldSize.height * self.frame.size.height)
            node.position = newPosition
        }
    }
    
    func initializeButtons() {
        
        disableButton(button: definitionButton)
        
        wordList.currentIndex()! > 0 && !statData.isEmpty()  ? enableButton(button: graphButton) : disableButton(button: graphButton)
        
        enableButton(button: settingsButton)
        
        enableButton(button: mark)
    }
    
    func replaySelection() {
        if !resetTimer {
            counters.loadVowelCount()
            restoreBoardState(liveDataItems: liveData.allItems())
        } else {
            liveData.deleteLiveData()
            counters.deleteVowelCount()
        }
    }
    
    func showBoardTile(position: String) {
        print(position)
    }
    
    override func transitionReloadScene(scene: SKScene, continueGame: Bool = true) {
        transitionToScene(destination: SceneType.GameScene, sendingScene: scene, continueGame: continueGame)
    }

    
    func update(_ currentTime: TimeInterval, for scene: SKScene) {
        
    }
    
    override func update(_ currentTime: TimeInterval) {
    }
  
    func progressSummary() {
        let diffTime = self.levelTime - self.startTime
        print("Performance for word link")
        print("Word: \(counters.wordphrase())")
        print("Number of click attempts: \(counters.totalClicks())")
        print("Accuracy nearer to 1.0 is: " + String(format:"%.2f", counters.accuracy()))
        print("Percentage is: " + String(format:"%.2f", counters.percentage()))
        print("Time to match: \(diffTime) seconds")
        statData.push(element: Stat(phrase: counters.wordphrase(), accuracy: counters.accuracy(),
                                    minimum: counters.minClicks(), percentage: counters.percentage(),
                                    timeSpan: TimeInterval(diffTime)))
    }
    
    func findAvailableSpriteNode(nodeList: [SKNode]) -> (tileName: String?, tileNode: SKSpriteNode?, labelNode: SKLabelNode?)? {
        for node in nodeList {
            if debugInfo { print("node in list: \((node.name)!)") }
            guard let spriteNode = node as? SKSpriteNode else { continue }
            if ((spriteNode.userData?.value(forKeyPath: tileUserDataClickName)) != nil) {
                print("Found Clickable Node")
                for child in spriteNode.children {
                    if (child.name?.contains("board_letter"))! ||
                        (child.name?.contains("button_letter"))! {
                        return (spriteNode.name, spriteNode, child as? SKLabelNode)
                    }
                }
            }
        }
        print("Not a Clickable Node")
        return (nil, nil, nil)
    }
    
    // MARK: - Gesture recognizer
    @objc func handleTapFrom(recognizer: UITapGestureRecognizer) {
        print("Entering \(#file):: \(#function) at line \(#line)")
        if recognizer.state != .ended {
            return
        }
        
        let recognizorLocation = recognizer.location(in: self.scene?.view)
        let location = self.convertPoint(fromView: recognizorLocation)
        
        let nodesAtPoint = self.nodes(at: location)
        if nodesAtPoint.count == 0  { return }
        print("Node selected")
        
        guard let nodeGroup = findAvailableSpriteNode(nodeList: nodesAtPoint) else { return }
        
        guard let _ = nodeGroup.tileName,  let labelNode = nodeGroup.labelNode, let tileNode = nodeGroup.tileNode else { return }
        
        /*
         if nodes is a vowel from the board that has not been selected before
         count as a valid selection and proceed to match selection.
         
         Check the list for selection and add to list if not already added.
         If all the selections have been matched the process completed game cycle for
         a word link.
         */
        
        print("Have valid element")
        
        if isSameCellClicked(prevLabelNode: &lastlabelNodeClick, labelNode:labelNode) {
            print("node previously selected")
            return
        }
        print("new tile Node: \(String(describing: tileNode.name!)) selected")
        
//        clickCount(tileName: tileNode.name)
//
//        highlightSelection(nodeGroup: nodeGroup)
//
//        processTileSelection(nodeGroup: nodeGroup)
        
        // Test graph overlay
        toggleGraphOverlay()
        
    }
    

    private var graphOverlay: GraphOverlay?
    
    func testGraphOverlay()  {
        
        graphOverlay = GraphOverlay(size: CGSize(width: (self.view?.bounds.size.width)!, height: (self.view?.bounds.size.height)!))
        self.addChild(graphOverlay!)
    }
    
    
    func toggleGraphOverlay() {
       graphOverlay?.toggleGraphOverlay()
    }
    
    func clickCount(tileName: String?) {
        if ((tileName?.hasPrefix(boardTileName))!
            || (tileName?.hasPrefix(boardLetterName))!) {
            let tileNode = childNode(withName: "//" + tileName!)
            if (tileNode?.userData?.value(forKeyPath: tileUserDataClickName) as? Bool)!  {
                    counters.clickAttempt()
                    print("click count: \(counters.totalClicks())")
                }
        }
    }
    
    /*
     (lldb) p spriteNode.children[0].name
     (String?) $R4 = "board_letter_1_2"
     (lldb) p spriteNode.children[0].isHidden = false
     lldb) p childNode(withName:"board_tile_2_2")?.children[0].description
     (String?) $R9 = "<SKLabelNode> name:\'board_letter_2_2\' text:\'O\' fontName:
     */
    
    func foundLetter(nodeName: String?) -> (letter: String?, nodeName: String?) {
        let childrenList = childNode(withName: (nodeName)!)?.children
        for child in childrenList! {
            if (child.name?.contains(boardLetterName))!
                || (child.name?.contains(buttonLetterName))! {
                let letterNode = child as? SKLabelNode
                print("Letter from \((child.name)!) found: \((letterNode?.text)!)")
                return ((letterNode?.text)!, (letterNode?.name)!)
            }
        }
        return (nil, nil)
    }
    
    
    func unhighlightTileNodeByName(name: String?) {
        if localToggle { print("Entering \(#file):: \(#function) at line \(#line)") }
        let previousNode = childNode(withName: (name)!)
        let childNodeList = previousNode?.children
        for child in childNodeList! {
            if (child.name?.contains(highlightPrefix))! {
                child.alpha = CGFloat(turnOffVisibility)
            }
        }
    }
    
    func unhighlightAllExcept(tileNameList: [String?]) {
        if localToggle { print("Entering \(#file):: \(#function) at line \(#line)") }
        let buttonList = children.filter{ ($0.name?.contains(buttonTileName))! }
        for buttonNode in buttonList {
            let node = childNode(withName: buttonNode.name!)
            for child in (node?.children)! {

                var match: Bool!
                for (_, tileName) in tileNameList.enumerated() {
                    match = child.name?.range(of: tileName!) != nil
                }
                
                if match { continue }
                if (child.name?.contains(highlightPrefix))! {
                    child.alpha = CGFloat(turnOffVisibility)
                }
            }
        }
    }
    
    func unhighlightButtonTiles() {
        if localToggle { print("Entering \(#file):: \(#function) at line \(#line)") }
        let buttonList = children.filter{ ($0.name?.contains(buttonTileName))! }
        for buttonNode in buttonList {
            let node = childNode(withName: buttonNode.name!)
            for child in (node?.children)! {
                if (child.name?.contains(highlightPrefix))! {
                    child.alpha = CGFloat(turnOffVisibility)
                }
            }
        }
    }
    
    func unhighlightBoardTiles() {
        if localToggle { print("Entering \(#file):: \(#function) at line \(#line)") }
        let tileList = children.filter{ ($0.name?.contains(boardTileName))! }
        for tileNode in tileList {
            let node = childNode(withName: tileNode.name!)
            for child in (node?.children)! {
                if (child.name?.contains(highlightPrefix))! {
                    child.alpha = CGFloat(turnOffVisibility)
                }
            }
        }
    }
    
    func unhightlighAllTiles() {
        if localToggle { print("Entering \(#file):: \(#function) at line \(#line)") }
        unhighlightBoardTiles()
        unhighlightButtonTiles()
        tileNodeList.removeAll()
    }
    
    func showBoardMatchTileLetter(tileList: [String?]) {
        if localToggle { print("Entering \(#file):: \(#function) at line \(#line)") }
        let tileLetterName = tileList.filter{ ($0?.contains(boardLetterName))! }.first!
        if !((tileLetterName?.isEmpty)!) {
            let tileNode = childNode(withName: nameDoubleSlashPrex + tileLetterName!)
            tileNode?.alpha = CGFloat(turnOnVisibility)
        }
    }
    
    func restoreBoardState(liveDataItems: [LiveData]) {
        for (_, selection) in liveDataItems.enumerated() {
            if selection.position.lowercased().contains(buttonPrefix) { continue }
            if selection.position.lowercased().contains(highlightPrefix) { continue }
            if selection.position.lowercased().contains(tilePrefix) {
                let node = childNode(withName: nameDoubleSlashPrex + selection.position)?.children
                for child in node! {
                    if (child.name?.contains(boardLetterName))! {
                        let letterNode = child as? SKLabelNode
                        print("Restored letter from \((child.name)!) found: \((letterNode?.text)!)")
                        child.alpha = CGFloat(turnOnVisibility)
                        counters.restoreMatch()
                    }
                }
             }
        }
    }
    
    func processTileSelection(nodeGroup: (tileName: String?, tileNode: SKSpriteNode?, labelNode: SKLabelNode?)) {
        
        if tileNodeList.count == 0 {
            tileNodeList.append(nodeGroup.tileNode!)
        } else if tileNodeList.count == 1 {
             print ("Selected label name: \(String(describing: (nodeGroup.labelNode?.name)!)) and previous tile: \(tileNodeList[0].name!)" )
            
            let parentNode = (nodeGroup.labelNode?.name?.split{$0 == "_"}.map(String.init).first)!
           
            let previousParentNode = (tileNodeList[0].name?.split{$0 == "_"}.map(String.init).first)!
            
            print("Comparing parent group: \(String(describing: parentNode)) and tile: \(tileNodeList[0].name!)")
            
            // check if button tile selected - ensure it will be the only
            // button tile highlighted
            
            if (parentNode == previousParentNode) {
                // unhighlight previous and remove all from list
                let previousLabelNode = tileNodeList.last
                tileNodeList.removeAll()
               
                unhighlightTileNodeByName(name: (previousLabelNode?.name)!)
                
                // add most recent to list
                tileNodeList.append(nodeGroup.tileNode!)
            } else  {
                // board selection and button selection comparison
                // check if tile letter and button letter match
                // if match:
                //  reveal letter in board and unhighlight both cells
                //  empty selection list
                // if no match:
                //  remove oldest selection from list.
                //  unhighlight oldest selection
                //  add to list most recent selection
                //  and highlight.
                
                // When all matches found clean and present new initial screen.
                
                /*
                 Button selected: button_tile_2
                 Selected label name: button_letter_E and previous tile: board_tile_1_4
                 Comparing parent group: button and tile: board_tile_1_4
                 */
                var foundLetterList = [String]()
                
                let foundLetterAndNodeName1 = foundLetter(nodeName: (tileNodeList.last?.name)!)
                let foundLetterAndNodeName2 = foundLetter(nodeName: (nodeGroup.tileNode?.name)!)
                foundLetterList.append(foundLetterAndNodeName1.letter!)
                foundLetterList.append(foundLetterAndNodeName2.letter!)
                
                handleTileButtonMatch(foundLetterList: foundLetterList,
                                      foundLetterAndNodeName1: foundLetterAndNodeName1,
                                      foundLetterAndNodeName2: foundLetterAndNodeName2,
                                      previousNodeName: (tileNodeList.last?.name)!,
                                      currentNodeName: (nodeGroup.tileNode?.name)!)
            }
        }
    }
    
    func handleTileButtonMatch(foundLetterList: [String],
                               foundLetterAndNodeName1: (letter: String?, nodeName: String?),
                               foundLetterAndNodeName2: (letter: String?, nodeName: String?),
                               previousNodeName: String,
                               currentNodeName: String
                               ) {
        
        if (foundLetterList.count == 2 && foundLetterList.first == foundLetterList.last) {
            print("Match found, letter: \((foundLetterList.first)!)")
            // When match is found unhiglight both board and button node.
            unhightlighAllTiles()
            //let queue = DispatchQueue(label: "com.teknowsys.wrdlnk.handleTileButtonMatchTrue")
            //queue.sync {
                showBoardMatchTileLetter(tileList: [foundLetterAndNodeName1.nodeName, foundLetterAndNodeName2.nodeName])
                if (inMatchList(list: foundLetterList)) { return }
                matchListAdd(matchListItems: &matchList, list: [previousNodeName, currentNodeName])
                counters.clickMatch()
                checkForAllMatches()
            //}
        } else {
            unhighlightAllExcept(tileNameList: [previousNodeName, currentNodeName])
            playSoundForEvent(soundEvent: .error)
        }
    }
    
    func inMatchList(list: [String?]) -> Bool {
        if localToggle { print("Entering \(#file):: \(#function) at line \(#line)") }
        if liveData.isEmpty() { return false }
        var count = 0
        var lCount = 0
        for (index, _) in list.enumerated() {
            guard let name = list[index] else { continue }
            if !matchList.isEmpty && matchList.contains(name) {
                count += 1
            }
            
            if !liveData.isEmpty() && liveData.contains(item: LiveData(position: name)) {
                lCount += 1
            }
        }
        return count > 0 || lCount > 0
    }
    
    func matchListAdd( matchListItems: inout [String], list: [String?]) {
        if localToggle { print("Entering \(#file):: \(#function) at line \(#line)") }
        //let queue = DispatchQueue(label: "com.teknowsys.wrdlnk.matchlistadd")
        //queue.sync {
            for (index, _) in list.enumerated() {
                guard let _ = list[index]?.hasPrefix(boardPrefix), let name = list[index] else { continue }
                
                if matchListItems.isEmpty || !matchListItems.contains(name) {
                    matchListItems.append(name)
                }
                
                if liveData.isEmpty() || !liveData.contains(item: LiveData(position: name)) {
                    liveData.addItem(item: LiveData(position: name))
                }
            }
        //}
    }
    
    // MARK:- New Highlighting method
    //        let boardLetterName = "board_letter_" // SKLabelNode
    //        let buttonTileName = "button_tile"  // SKSpriteNode
    //        let buttonLetterName = "button_letter_" // SKLabelNode
    //        let boardTileName = "board_tile"  // SKSpriteNode
    //        let highNodePrefix = "highlight_"
    func highlightSelection(nodeGroup: (tileName: String?, tileNode: SKSpriteNode?, labelNode: SKLabelNode?)?) {
        let tileNode = nodeGroup?.tileNode
        let tileName = nodeGroup?.tileName
        if (tileName?.contains(boardTileName))! {
            print("Board selected: \((tileName)!)")
            for child in (tileNode?.children)! {
                if (child.name?.contains("highlight_"))! {
                    child.alpha = CGFloat(turnOnVisibility)
                    break
                }
            }
        }
        else if (tileName?.contains(buttonTileName))! {
            print("Button selected: \((tileName)!)")
            for child in (tileNode?.children)! {
                if (child.name?.contains("highlight_"))! {
                    child.alpha = CGFloat(turnOnVisibility)
                    break
                }
            }
        }
    }
    
    // MARK:- Highlight board or button tile
    func toggleHighlightClickedNode(nodeName: String, hidden: Bool = true) {
        if nodeName.hasPrefix(boardTileName) {
            toggleHighlightBoardTile(nodeName: nodeName, hidden: hidden)
        }
        if nodeName.hasPrefix(buttonTileName) {
            toggleHighlightButtonTile(nodeName: nodeName, hidden: hidden)
        }
    }
    
    func toggleHighlightBoardTile(nodeName: String, hidden: Bool = true) {
        print("Entering \(#file):: \(#function) at line \(#line)")
        let hightlightNodeName = "//highlight_\(nodeName)"
        let highlightNode = childNode(withName: hightlightNodeName)
        highlightNode?.isHidden = hidden
    }
    
    func toggleHighlightButtonTile(nodeName: String, hidden: Bool = true) {
        print("Entering \(#file):: \(#function) at line \(#line)")
        let hightlightNodeName = "//highlight_\(nodeName)"
        let highlightNode = childNode(withName: hightlightNodeName)
        highlightNode?.isHidden = hidden
    }
    
    private func isSameCellClicked(prevLabelNode: inout SKLabelNode?, labelNode: SKLabelNode) -> Bool {
        guard let _ = prevLabelNode else {
            prevLabelNode = labelNode
            return false
        }
        var same = false
        if prevLabelNode?.name == labelNode.name  {
            same = true
        }
        prevLabelNode = labelNode
        return same
    }
 
    func unhighlightAll(tileList: inout [SKSpriteNode]) {
        let count = tileList.count
        for _ in 0..<count {
            removeAndUnhighlightLabel(tileList: &tileList)
        }
    }
    
    func removeAndUnhighlightLabel(tileList: inout [SKSpriteNode]) {
        if tileList.count > 0 {
            let matchSprite = tileList.remove(at: 0)
            matchSprite.unhighlight(spriteName: matchSprite.name!)
            let matchLabel = matchSprite.getLabelFromSprite()
            matchLabel?.vowelSet()
        }
    }
   
    func messageFrequency() -> Double {
        let displayOptional = random(9)
        print("displayOptional is: \(displayOptional)")
        var pause:Double = 0.3
        let condition = displayOptional % 3 == 0
            && counters.accuracy() > Float(MesssageDisplayThreshold)
        if  condition {
            playTextAnimated(fileName: completedMessage())
            pause = 2.0
        }
        return pause
    }
    
    func checkForAllMatches() {
        if localToggle { print("Entering \(#file):: \(#function) at line \(#line)") }
        playerScore += matchLetterValue
        if counters.matchComplete() {
            if (startTime > 0) { playerScore += bonusPoints() }
            playSoundForEvent(soundEvent: .great2)
            wordList.setMatchCondition()
            progressSummary()
            
            //preserve()
            enableGraphDisplay()
            readyForInit()
            
            delay(messageFrequency()) {
                self.liveData.deleteLiveData()
                self.counters.deleteVowelCount()
                self.stopAudio(delay: 0.2)
                self.transitionReloadScene(scene: self)
                self.resetTimer = true
                AppDefinition.defaults.set(true, forKey: preferenceContinueGameEnabledKey)
            }
            _ = wordList.getWords()
            
            return
        } else {
            playSoundForEvent(soundEvent: .yes)
            if !wordList.isEmpty() {
                wordList.clearMatchCondition()
            }
        }
    }
    
    func enableGraphDisplay() {
        if !AppDefinition.defaults.bool(forKey: preferenceShowGraphKey) {
            AppDefinition.defaults.set(true, forKey: preferenceShowGraphKey)
        }
    }
    
    func countClick(sprite: SKSpriteNode) {
        if (sprite.name?.hasPrefix(tileNodeName))!
            && (sprite.userData?.value(forKeyPath: tileUserDataClickName) as? Bool)!  {
            counters.clickAttempt()
            print("click count: \(counters.totalClicks())")
        }
    }
    
    func showDefinitionButton() {
        if counters.totalBoardTileClicks() > minClickToSeeDefinition {
            enableButton(button: definitionButton)
        }
    }
    
    // MARK:- High score
    func playerScoreUpdate() {
        if !AppDefinition.defaults.bool(forKey: preferenceScoreEnabledKey) {
            playerScoreLabel.isHidden = true
        }
        else {
            playerScoreLabel.isHidden = false
        }
        
        playerScore = AppDefinition.defaults.integer(forKey: preferenceCurrentScoreKey)
        let highScore = AppDefinition.defaults.integer(forKey: preferenceHighScoreKey)
        if playerScore > highScore {
            AppDefinition.defaults.set(playerScore, forKey: preferenceHighScoreKey)
        }
        playerScoreLabel.text = "\(playerScore)"
        
    }
    
    // MARK:- Timer
    func playerTimerUpdate() {
        if AppDefinition.defaults.bool(forKey: preferenceTimerEnabledKey) {
            playerTimerLabel.text = "\(playerTimer)"
        } else {
            playerTimerLabel.isHidden = true
        }
        
        if resetTimer {
            startTime = AppDefinition.defaults.integer(forKey: preferenceGameLevelTimeKey)
            resetTimer = false
            AppDefinition.defaults.set(false, forKey: preferenceContinueGameEnabledKey)
            wordList.clearMatchCondition()
        } else {
            startTime = AppDefinition.defaults.integer(forKey: preferenceStartTimeKey)
        }
    }
    
    // MARK:- play progress text
    func playTextAnimated(fileName: String?) {
        guard let _ = fileName else { return }
        
        var positionScale:CGFloat!
        var spriteScale: CGFloat!
        var groupAction:[SKAction] = []
        let texture = SKTexture(imageNamed: fileName!)
        let messageNode = SKSpriteNode(texture: texture, size:CGSize(width: texture.size().width, height: texture.size().height))
        
        if UIDevice.isiPad {
            positionScale = 1.3
            spriteScale = 1.5
            messageNode.scale(to: CGSize(width: texture.size().width * spriteScale,
                                         height: texture.size().height * spriteScale))
            groupAction = [.scale(to: spriteScale, duration: 0.3)]
        } else {
            positionScale = 0.9
            spriteScale = 1.0
            groupAction = [.scale(to: spriteScale, duration: 0.3)]
        }
        
        let bgframe = self.frame
        let moveToArray = [CGPoint(x: bgframe.midX + (2 * tileWidth), y: bgframe.minY * positionScale),
                           CGPoint(x: bgframe.midX - (2 * tileWidth), y: bgframe.minY * positionScale),
                           CGPoint(x: bgframe.midX - (2 * tileWidth), y: bgframe.minY * positionScale) ]
        
        let moveFromArray = [CGPoint(x: bgframe.midX + (2 * tileWidth), y: max(bgframe.midY + (7 * tileHeight), bgframe.maxY - tileHeight)),
                             CGPoint(x: bgframe.midX - (2 * tileWidth), y: bgframe.maxY * positionScale),
                             CGPoint(x: bgframe.midX - (2 * tileWidth), y: bgframe.maxY * positionScale) ]
        let fromPos = moveFromArray[random(3)]
        let toPos = moveToArray[random(3)]
        messageNode.position = fromPos
        
        self.addChild(messageNode)
        let moveText = SKAction.move(to: toPos, duration: 0.9)
        let fadeAway = SKAction.fadeOut(withDuration: 1.3)
        let removeNode = SKAction.removeFromParent()
        
        let sequence = SKAction.sequence([.group(groupAction),
                                          .rotate(byAngle: .pi * 2, duration: 0.6),
                                          moveText,
                                          fadeAway,
                                          removeNode])
        messageNode.run(sequence)
    }
}

