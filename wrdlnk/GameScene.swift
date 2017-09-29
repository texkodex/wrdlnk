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
    
    // MARK:- Nodes
    override var backgroundNodeOne: SKNode? {
        return childNode(withName: meaningNodePath)!
    }
    
    override var backgroundNodeTwo: SKNode? {
        return childNode(withName: graphNodePath)!
    }
    
    override var backgroundNodeThree: SKNode? {
        return childNode(withName: settingsNodePath)!
    }
    
    var definitionButton: ButtonNode? {
        return backgroundNodeOne?.childNode(withName: ButtonIdentifier.provideMeaning.rawValue) as? ButtonNode
    }

    var graphButton: ButtonNode? {
        return backgroundNodeTwo?.childNode(withName: ButtonIdentifier.showGraph.rawValue) as? ButtonNode
    }
    
    var settingsButton: ButtonNode? {
        return backgroundNodeThree?.childNode(withName: ButtonIdentifier.appSettings.rawValue) as? ButtonNode
    }
    
    var definitionOff = false {
        didSet {
            let imageName = definitionOff ? "questionOff" : "questionOn"
            definitionButton?.selectedTexture = SKTexture(imageNamed: imageName)
        }
    }
    
    var graphOff = false {
        didSet {
            let imageName = graphOff ? "graphOff" : "graphOn"
            graphButton?.selectedTexture = SKTexture(imageNamed: imageName)
    
            AppDefinition.defaults.set(graphOff, forKey: preferenceShowGraphKey)

        }
    }
    
    var settingsOff = false {
        didSet {
            let imageName = settingsOff ? "settingsOff" : "settingsOn"
            settingsButton?.selectedTexture = SKTexture(imageNamed: imageName)
        }
    }
    
    // MARK:- SKLabelNode
    override var backgroundNodeFour: SKNode? {
        return childNode(withName: statNodePath)!
    }

    var playerScoreLabel: SKLabelNode? {
        return backgroundNodeFour?.childNode(withName: statScoreNodePath) as? SKLabelNode
    }
    
    var highScoreLabel: SKLabelNode? {
        return backgroundNodeFour?.childNode(withName: statHighScoreNodePath) as? SKLabelNode
    }

    var playerTimerLabel: SKLabelNode? {
        return backgroundNodeFour?.childNode(withName: statTimerNodePath) as? SKLabelNode
    }
    
    // MARK:- Data structures
    var entities = [GKEntity()]
    
    var graphs = [String:GKGraph]()
    
    var wordList = WordList.sharedInstance
    
    var lastSpriteClick: SKSpriteNode? = nil
    
    var counters = VowelCount.sharedInstance
    
    var statData = StatData.sharedInstance
    
    let nodeMap = [ViewElement.main.rawValue, ViewElement.board.rawValue,
                   ViewElement.control.rawValue, ViewElement.buttons.rawValue]
    
    var spriteNodeList: [SKSpriteNode] = []
    
    var matchList: [String] = []

    var liveData = LiveData.sharedInstance
    
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
        if counters.match < counters.total {
            wordList.stay()
        }
        
        liveData.saveLiveData()
        counters.saveVowelCount()
        readyForInit()
        entities.removeAll()
        graphs.removeAll()
        spriteNodeList.removeAll()
        matchList.removeAll()
        self.removeFromParent()
        self.removeAllChildren()
        self.removeAllActions()
        self.view?.presentScene(nil)
    }
    
    override func didMove(to view: SKView) {
        super.didMove(to: view)
        print("Entering \(#file):: \(#function) at line \(#line)")
        resizeIfNeeded()
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
    
    override func sceneDidLoad() {
        super.sceneDidLoad()
        print("Entering \(#file):: \(#function) at line \(#line)")
        
        resetForNewGame()
        
        if testIfInit() {
            setup(nodeMap: nodeMap, completionHandler: makeVisible(params:))
            initComplete()
        }
        
        wordList.setSelectedRow(row: nil)
        
        // Enable buttons if data available
        initializeScreenButtons()
        
        // Update player score
        playerScoreUpdate()
        playerTimerUpdate()
        // Set the high score
        highScoreLabel?.text = "HighScore: " + AppDefinition.defaults.integer(forKey: "highscore").description
        
        replaySelection()
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
            counters = params.nodeTile!.addWords(word: wordList.getWords()!)
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
            if labelNode?.contains(location) != nil {
                if (labelNode?.alpha)! < CGFloat(1) { return false }
            }
        }
        return false
    }
    
    func getTileMap(location: CGPoint, nodesAtPoint: [SKNode]) -> (tilemap: SKTileMapNode?, name: String?) {
        for node in nodesAtPoint {
            if debugInfo { print("node in list: \((node.name)!)") }
            let tileMapNode = node as? SKTileMapNode
            if tileMapNode != nil && (tileMapNode?.contains(location)) != nil {
                if debugInfo { print("point found at: \((tileMapNode?.name)!)") }
                return (tileMapNode, (tileMapNode?.name)!)
            }
        }
        return (nil, nil)
    }
    
    func getTileMapByName(nodesAtPoint: [SKNode], name: String) -> SKTileMapNode? {
        for node in nodesAtPoint {
            let tileMapNode = node as? SKTileMapNode
            if tileMapNode != nil && (tileMapNode?.name?.contains(name)) != nil {
                return tileMapNode
            }
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
    func handleTapFrom(recognizer: UITapGestureRecognizer) {
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
        
        if isSameCellClicked(sprite: tileSprite) { return }
        
        countClick(sprite: tileSprite)
        
        processTileSprite(sprite: tileSprite, handler: wordRowSelected(name:))
    }
    
    func isSameCellClicked(sprite: SKSpriteNode) -> Bool {
        if lastSpriteClick != nil && lastSpriteClick?.name == sprite.name {
            return true
        } else {
            lastSpriteClick = sprite
        }
        return false
    }
    
    func wordRowSelected(name: String) {
        print("word row name is: \(name)")
        let parts = name.characters.split{$0 == "_"}.map(String.init)
        let column = Int(parts[parts.count - 1])!
        print("extract column is: \(column)")
        wordList.setSelectedRow(row: VowelRow(rawValue: column)!)
        
        if (name.contains(boardTileMap)) {
            counters.boardClickAttempt()
        }
    }
    
    func matchListAdd(list: [SKSpriteNode]) {
        for (index, _) in list.enumerated() {
            if !(list[index].parent?.name?.hasPrefix("board"))! { continue }
            if !matchList.contains(list[index].name!) {
                matchList.append(list[index].name!)
            }
            let data = LiveData(position: list[index].name!)
            if !liveData.contains(item: data) {
                liveData.addItem(item: data)
            }
        }
    }
    
    func inMatchList(list: [SKSpriteNode]) ->Bool {
        var count = 0
        var lCount = 0
        for (index, _) in list.enumerated() {
            if matchList.contains(list[index].name!) {
                count += 1
            }
            let data = LiveData(position: list[index].name!)
            if liveData.contains(item: data) {
                lCount += 1
            }
        }
        return count > 0 || lCount > 0
    }
    
    func processTileSprite(sprite: SKSpriteNode?, handler:(String)->Void) {
        let index = uniqueSpriteList(name: (sprite?.parent?.name)!)
        if index != nil {
            let lastSprite = spriteNodeList.remove(at: index!)
            lastSprite.unhighlight(spriteName: lastSprite.name!)
        }
        if (inMatchList(list: spriteNodeList + [sprite!])) { return }
        sprite?.highlight(spriteName: (sprite?.name)!)
        handler((sprite?.name)!)
        spriteNodeList.append(sprite!)
        checkForSpriteMatch()
        showDefinitionButton()
    }
    
    func uniqueSpriteList(name: String) -> Int? {
        for (index, spriteNode) in spriteNodeList.enumerated() {
            if spriteNode.parent?.name == name { return index }
        }
        return nil
    }
    
    func checkForSpriteMatch() {
        if spriteNodeList.count > 1 {
            if spriteNodeList.first?.getLabelTextForSprite() == spriteNodeList.last?.getLabelTextForSprite() {
                print("Match found between tile map character buttons character")
                if (inMatchList(list: spriteNodeList)) { return }
                matchListAdd(list: spriteNodeList)
                counters.clickMatch()
                unhighlightAll()
                checkForAllMatches()
            } else {
                playSoundForEvent(soundEvent: .error)
            }
        }
    }
    
    func unhighlightAll() {
        let count = spriteNodeList.count
        for _ in 0..<count {
            removeAndUnhighlightLabel()
        }
    }
    
    func removeAndUnhighlightLabel() {
        if spriteNodeList.count > 0 {
            let matchSprite = spriteNodeList.remove(at: 0)
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
        if  displayOptional % 3 == 0 {
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
            statData.saveData()
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
            wordList.clearMatchCondition()
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
        guard (fileName != nil) else { return }
        
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

