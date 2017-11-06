//
//  GameScene.swift
//  wrdlnk
//
//  Created by sparkle on 6/1/17.
//  Copyright © 2017 teknowsys. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: BaseScene {
    
    // MARK:- Top nodes
    let mark = SKSpriteNode(imageNamed: "pdf/mark")
    
    // MARK:- Nodes
    override var backgroundNodeOne: SKNode? {
        return nil
    }
    
    
    override var backgroundNodeThree: SKNode? {
        return nil
    }
    
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
    override var backgroundNodeFour: SKNode? {
        return nil
    }
    
    var playerScoreLabel: SKLabelNode? {
        return nil
    }
    
    var highScoreLabel: SKLabelNode? {
        return nil
    }
    
    var playerTimerLabel: SKLabelNode? {
        return SKLabelNode()
    }
    
    // MARK:- Data structures
    var wordList: WordListBox {
        get { return WordListBox.sharedInstance }
    }
    
    var lastSpriteClick: SKSpriteNode?
    
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
    
    var spriteNodeList: [SKSpriteNode] = []
    
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
            playerScoreLabel?.text = "\(newValue)"
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
    
    deinit {
        print("Entering \(#file):: \(#function) at line \(#line)")
        preserve()
        readyForInit()
        spriteNodeList.removeAll()
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
    
    override func didMove(to view: SKView) {
        super.didMove(to: view)
        print("Entering \(#file):: \(#function) at line \(#line)")
        placeAssets()
        setupGameSceneResources()
        
        //resizeIfNeeded()
        let tapBoardGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.handleTapFrom(recognizer:)))
        tapBoardGestureRecognizer.numberOfTapsRequired = 1
        view.addGestureRecognizer(tapBoardGestureRecognizer)
        
        playNotification()
        // Start game timer
        setupTimer()
        
        AppTheme.instance.set(for: self)
    }
    
    func setupTimer() {
        if initializeTimer {
            startTime = AppDefinition.defaults.integer(forKey: preferenceGameLevelTimeKey)
            AppDefinition.defaults.set(false, forKey: preferenceSetTimerEnabledKey)
        }
        self.playerTimerLabel?.text = timerString()
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
        initializeScreenButtons()
        
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
        position = CGPoint(x: size.width * 0, y: size.height * 0.4185)
        var scaledWidth = size.width * layoutRatio.markWidthScale
        var scaledHeight = size.height * layoutRatio.makeHeightScale
        
        mark.name = "mark"
        mark.scale(to: CGSize(width: scaledWidth, height: scaledHeight))
        mark.anchorPoint = CGPoint(x: 0.5, y: 1.0)
        mark.position = position
        mark.zPosition = 10
        addChild(mark)
        
        var xPos = size.width * (layoutRatio.xAnchor - layoutRatio.indentForGameButtonFromSideEdge)
        let yPos = size.height * (layoutRatio.yAnchor - layoutRatio.indentForGameButtonFromTopEdge)
        position = CGPoint(x: xPos, y: yPos)
        
        scaledWidth = size.width * layoutRatio.buttonGraphWidthScale
        scaledHeight = size.height * layoutRatio.buttonGraphHeightScale
        graphButton.scale(to: CGSize(width: scaledWidth, height: scaledHeight))
        var buttonParam: SceneButtonParam =
            SceneButtonParam(buttonNode: graphButton, spriteNodeName: "ShowGraph",
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
        let getWords = wordList.getWords()!
        let lettersPerRow = [getWords.prefix.utf8.count, getWords.link.utf8.count, getWords.suffix.utf8.count]
        
        let maxTiles = lettersPerRow.map { $0 }.max()!
        var position: CGPoint!
        var tile: SKSpriteNode!
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
        
        
        
        
        let wordsForRow = [getWords.prefix, getWords.link, getWords.suffix]
        let fontSize = tileHeight * layoutRatio.textSizeToTileHeight
        
        for row in 1...3 {
            // Adjust for less than max row tiles
            let tileAdjustment = (CGFloat(maxAvailableTiles) - CGFloat(lettersPerRow[row - 1])) / CGFloat(2.0)
            let xPosAdjustment = CGFloat(tileAdjustment) * (tileWidth + tileInnerSpace)
            
            for column in 1...lettersPerRow[row - 1] {
                
                
                tile = SKSpriteNode(texture: SKTexture(imageNamed: "pdf/tile"))
                
                position = CGPoint(x: position.x, y: position.y)
                tile.name = "board_tile_\(row)_\(column)"
                tile.scale(to: CGSize(width: tileWidth, height: tileHeight))
                tile.position = CGPoint(x: position.x + xPosAdjustment, y: position.y)
                tile.zPosition = 10
                addChild(tile)
                
                // Add the word letter to board
                let currentWord = wordsForRow[row - 1]
                let index = currentWord.index(currentWord.startIndex, offsetBy: column - 1)
                
                let labelNode = SKLabelNode()
                labelNode.name = "board_letter_\(column)"
                labelNode.position = CGPoint(x: tile.centerRect.midX, y: tile.centerRect.midY)
                labelNode.text = "\(currentWord[index])"
                labelNode.fontSize = fontSize
                labelNode.fontName = fontName
                labelNode.verticalAlignmentMode = .center
                labelNode.horizontalAlignmentMode = .center
                labelNode.zPosition = 10
                tile.addChild(labelNode)
                
                position.x = position.x + tileWidth + tileInnerSpace
            }
            let yOffset = size.height * layoutRatio.spaceBetweenRowsInScreen
            position.x = xPos
            position.y = position.y - yOffset
        }
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
            addChild(tile)
            
            let labelNode = SKLabelNode()
            labelNode.name = "button_label_\(labels[column - 1])"
            labelNode.position = CGPoint(x: tile.centerRect.midX, y: tile.centerRect.midY)
            labelNode.text = "\(labels[column - 1])"
            labelNode.fontSize = fontSize
            labelNode.fontName = fontName
            labelNode.verticalAlignmentMode = .center
            labelNode.horizontalAlignmentMode = .center
            labelNode.zPosition = 10
            tile.addChild(labelNode)
            
            position.x = position.x + tileWidth + tileInnerSpace
        }
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
    
    func initializeScreenButtons() {
        
        disableButton(button: definitionButton)
        
        wordList.currentIndex()! > 0 && !statData.isEmpty()  ? enableButton(button: graphButton) : disableButton(button: graphButton)
        
        enableButton(button: settingsButton)
    }
    
    func replaySelection() {
        if !resetTimer {
            // restore vowelCount
            counters.loadVowelCount()
            // get match count
            for (_, selection) in liveData.allItems().enumerated() {
                if selection.position.lowercased().contains("buttons") { continue }
                showBoardTile(position: selection.position)
                let boardNode: SKNode? = childNode(withName: boardNodePath)
                let matchSprite = boardNode?.childNode(withName: selection.position) as! SKSpriteNode
                let matchLabel = matchSprite.getLabelFromSprite()
                matchLabel?.alpha = CGFloat(1.0)
                counters.restoreMatch()
            }
            
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
    
    func makeVisible (params: MakeVisibleParams){
        print("Entering \(#file):: \(#function) at line \(#line)")
        switch params.viewElement! {
        case .main: break
        case .board:
            params.nodeTile?.setTileTexture(tileElement: TileElement(rawValue: "blue_tile")!)
            let counter = params.nodeTile!.addWords(word: wordList.getWords()!)
            counters.setup(vowelCount: counter)
            break
        case .buttons:
            params.nodeTile?.setTileTexture(tileElement: TileElement(rawValue: "green_tile")!, buttonNode: true)
            params.nodeTile?.addButtonLetter()
            break
        case .control: break
        case .footer: break
        default:
            return
        }
        
    }
    
    func update(_ currentTime: TimeInterval, for scene: SKScene) {
        
    }
    
    // MARK: - Touches
    override func update(_ currentTime: TimeInterval) {
    }
    
    func checkIfNodeProcessed(location: CGPoint, nodesAtPoint: [SKNode]) -> Bool {
        for node in nodesAtPoint {
            let labelNode = node as? SKLabelNode
            guard let _ = labelNode?.contains(location) else { continue }
            if (labelNode?.alpha)! < CGFloat(1) { return false }
        }
        return false
    }
    
    func getTileMap(location: CGPoint, nodesAtPoint: [SKNode]) -> (tilemap: SKTileMapNode?, mapnode: SKNode?, name: String?) {
        for node in nodesAtPoint {
            if debugInfo { print("node in list: \((node.name)!)") }
            guard let tileMapNode = node as? SKTileMapNode else { continue }
            let atPoint = self.atPoint(location)
            if self.contains(location) {
                if debugInfo { print("point found at: \(String(describing: tileMapNode.name))") }
                return (tileMapNode, atPoint, tileMapNode.name)
            }
        }
        return (nil, nil, nil)
    }
    
    func getTileMapByName(nodesAtPoint: [SKNode], name: String) -> SKTileMapNode? {
        for node in nodesAtPoint {
            guard let tileMapNode = node as? SKTileMapNode, let _ = tileMapNode.name?.contains(name) else { continue }
            return tileMapNode
        }
        return nil
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
    
    // MARK: - Gesture recognizer
    @objc func handleTapFrom(recognizer: UITapGestureRecognizer) {
        print("Entering \(#file):: \(#function) at line \(#line)")
        if recognizer.state != .ended {
            return
        }
        
        let recognizorLocation = recognizer.location(in: self.scene?.view)
        let location = self.convertPoint(fromView: recognizorLocation)
        
        let nodesAtPoint = self.nodes(at: location)
        
        let nodeData = getTileMap(location: location, nodesAtPoint: nodesAtPoint)
    
        guard let tileMap = nodeData.tilemap else { return }
        
        guard let tileSprite = tileMap.getSpriteNode(nodesAtPoint: nodesAtPoint) else { return }
        
        if isSameCellClicked(prevSprite: &lastSpriteClick, sprite: tileSprite) { return }
        
        countClick(sprite: tileSprite)
        
        let highlight = processSpriteHighlight(sprite: tileSprite, spriteNodeList: &spriteNodeList)
        if highlight.nodeHighlight {
           processTileSprite(spriteNode: highlight.spriteNode!, spriteNodeName: highlight.spriteNodeName!, wordlist: wordList, spriteNodeList: &spriteNodeList, handler: wordRowSelected(name:wordlist:))
        }
    }
    
    private func processSpriteHighlight(sprite: SKSpriteNode?, spriteNodeList: inout [SKSpriteNode]) -> (nodeHighlight: Bool, spriteNode: SKSpriteNode?, spriteNodeName: String?) {
        guard let spriteNode = sprite, let spriteNodeName = spriteNode.name,
            let parentName = sprite?.parent?.name else {
                return (false, nil, nil)
        }
        
        if let index = uniqueSpriteList(name: parentName, spriteNodeList: spriteNodeList) {
            let lastSprite = spriteNodeList.remove(at: index)
            lastSprite.unhighlight(spriteName: lastSprite.name!)
        }
        
        if (inMatchList(list: spriteNodeList + [spriteNode])) { return (false, nil, nil) }
        
        spriteNode.highlight(spriteName: spriteNodeName)
        
        return (true, spriteNode, spriteNodeName)
    }
    
    private func processTileSprite(spriteNode: SKSpriteNode, spriteNodeName: String, wordlist: WordListBox, spriteNodeList: inout [SKSpriteNode], handler:(String, WordListBox)->Void) {
        
        
        let queue = DispatchQueue(label: "com.teknowsys.processtilesprite.queue")
        queue.sync {
            handler(spriteNodeName, wordlist)
            spriteNodeList.append(spriteNode)
            checkForSpriteMatch(spriteList: &spriteNodeList)
        }
        
        showDefinitionButton()
    }
    
    private func isSameCellClicked(prevSprite: inout SKSpriteNode?, sprite: SKSpriteNode) -> Bool {
        guard let _ = prevSprite else {
            prevSprite = sprite
            return false
        }
        var same = false
        if prevSprite?.name == sprite.name  {
            same = true
        }
        prevSprite = sprite
        return same
    }
    
    func wordRowSelected(name: String, wordlist: WordListBox) {
        print("word row name is: \(name)")
        let parts = name.split{$0 == "_"}.map(String.init)
        let column = Int(parts[parts.count - 1])!
        print("extract column is: \(column)")
        let vowelRow = VowelRow(rawValue: column)!
        wordList.setSelectedRow(row: vowelRow)
        
        if (name.contains(boardTileMap)) {
            counters.boardClickAttempt()
        }
    }
    
    func matchListAdd( matchListItems: inout [String], list: [SKSpriteNode]) {
        let queue = DispatchQueue(label: "com.teknowsys.wrdlnk.matchlistadd")
        queue.sync {
            for (index, _) in list.enumerated() {
                guard let _ = list[index].parent?.name?.hasPrefix("board"), let name = list[index].name else { continue }
                
                if matchListItems.isEmpty || !matchListItems.contains(name) {
                    matchListItems.append(name)
                }

                if liveData.isEmpty() || !liveData.contains(item: LiveData(position: name)) {
                    liveData.addItem(item: LiveData(position: name))
                }
            }
        }
    }
    
    func inMatchList(list: [SKSpriteNode]) ->Bool {
        if liveData.isEmpty() { return false }
        var count = 0
        var lCount = 0
        for (index, _) in list.enumerated() {
            guard let name = list[index].name else { continue }
            if !matchList.isEmpty && matchList.contains(name) {
                count += 1
            }
    
            if !liveData.isEmpty() && liveData.contains(item: LiveData(position: name)) {
                lCount += 1
            }
        }
        return count > 0 || lCount > 0
    }
    
    func uniqueSpriteList(name: String, spriteNodeList: [SKSpriteNode]) -> Int? {
        for (index, spriteNode) in spriteNodeList.enumerated() {
            guard let parentName = spriteNode.parent?.name else { continue }
            if parentName == name { return index }
        }
        return nil
    }
    
    func checkForSpriteMatch(spriteList: inout [SKSpriteNode]) {
        if spriteList.count > 1 {
            if spriteList.first?.getLabelTextForSprite() == spriteList.last?.getLabelTextForSprite() {
                print("Match found between tile map character buttons character")
                if (inMatchList(list: spriteList)) { return }
                matchListAdd(matchListItems: &matchList, list: spriteList)
                counters.clickMatch()
                unhighlightAll(spriteList: &spriteList)
                checkForAllMatches()
            } else {
                playSoundForEvent(soundEvent: .error)
            }
        }
    }
    
    func unhighlightAll(spriteList: inout [SKSpriteNode]) {
        let count = spriteList.count
        for _ in 0..<count {
            removeAndUnhighlightLabel(spriteList: &spriteList)
        }
    }
    
    func removeAndUnhighlightLabel(spriteList: inout [SKSpriteNode]) {
        if spriteList.count > 0 {
            let matchSprite = spriteList.remove(at: 0)
            matchSprite.unhighlight(spriteName: matchSprite.name!)
            let matchLabel = matchSprite.getLabelFromSprite()
            matchLabel?.vowelSet()
        }
    }
    
    func unhighlightLabel(index: Int) {
        if spriteNodeList.count > 0 {
            let matchSprite = spriteNodeList.remove(at: index)
            matchSprite.unhighlight(spriteName: matchSprite.name!)
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
        playerScore += matchLetterValue
        if counters.matchComplete() {
            if (startTime > 0) { playerScore += bonusPoints() }
            playSoundForEvent(soundEvent: .great2)
            wordList.setMatchCondition()
            progressSummary()
            
            preserve()
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
            playerScoreLabel?.isHidden = true
        }
        else {
            playerScoreLabel?.isHidden = false
        }
        
        playerScore = AppDefinition.defaults.integer(forKey: preferenceCurrentScoreKey)
        let highScore = AppDefinition.defaults.integer(forKey: preferenceHighScoreKey)
        if playerScore > highScore {
            AppDefinition.defaults.set(playerScore, forKey: preferenceHighScoreKey)
        }
        playerScoreLabel?.text = "\(playerScore)"
        
    }
    
    // MARK:- Timer
    func playerTimerUpdate() {
        if AppDefinition.defaults.bool(forKey: preferenceTimerEnabledKey) {
            playerTimerLabel?.text = "\(playerTimer)"
        } else {
            playerTimerLabel?.isHidden = true
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
        
        let bgframe = self.childNode(withName: backgroundNodePath)!.frame
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

