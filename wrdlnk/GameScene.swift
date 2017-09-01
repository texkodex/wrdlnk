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
    
    var counters = VowelCount()
    
    var statData = StatData.sharedInstance
    
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
            return UserDefaults().bool(forKey: preferenceStartGameEnabledKey)
        }
        set {
            UserDefaults().set(newValue, forKey: preferenceStartGameEnabledKey)
        }
    }

    var playerScore:Int {
        get {
            return UserDefaults().integer(forKey: preferenceCurrentScoreKey)
        }
        set {
            playerScoreLabel?.text = "\(newValue)"
            UserDefaults().set(newValue, forKey: preferenceCurrentScoreKey)
        }
    }
    
    var playerTimer = 0
    
    var levelTime:Int  {
        get {
            return UserDefaults().integer(forKey: preferenceGameTimeKey)
        }
        set {
            UserDefaults().set(newValue, forKey: preferenceGameTimeKey)
        }
    }

    var startTime:Int = 0
    
    struct initialize {
        static var doOnce: Bool = false
    }
    
    deinit {
        print("Entering \(#file):: \(#function) at line \(#line)")
        if counters.match < counters.total {
            wordList.stay()
        }
        
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
        self.playerTimerLabel?.text = timerString()
        countTime()
        
        AppTheme.instance.set(for: self)
    }
    
    func playNotification() {
        let path = Bundle.main.path(forResource: AppDefinition.PlayNotification, ofType: AppDefinition.PropertyList);
        self.contentPlist = NSArray(contentsOfFile:path!) as! [[String:String]]
        
        self.keyPlayNotificationDictionary = self.contentPlist[0]
        
        notificationMessageList.append(keyPlayNotificationDictionary["message_great"]!)
        notificationMessageList.append(keyPlayNotificationDictionary["message_super"]!)
        notificationMessageList.append(keyPlayNotificationDictionary["message_goodwork"]!)
        notificationMessageList.append(keyPlayNotificationDictionary["message_fabulous"]!)

        awardMessageList.append(keyPlayNotificationDictionary["message_amazing"]!)
        awardMessageList.append(keyPlayNotificationDictionary["message_topnotch"]!)
        awardMessageList.append(keyPlayNotificationDictionary["message_yeah"]!)
        awardMessageList.append(keyPlayNotificationDictionary["message_award"]!)

        completedMessageList.append(keyPlayNotificationDictionary["message_goodwork"]!)
        completedMessageList.append(keyPlayNotificationDictionary["message_super"]!)
        completedMessageList.append(keyPlayNotificationDictionary["message_amazing"]!)
        completedMessageList.append(keyPlayNotificationDictionary["message_topnotch"]!)
        completedMessageList.append(keyPlayNotificationDictionary["message_fantastic"]!)

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
            UserDefaults().set(false, forKey: preferenceGameTimeKey)
            UserDefaults().set(0, forKey: preferenceCurrentScoreKey)
            UserDefaults().set(0, forKey: preferenceGameTimeKey)
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
        highScoreLabel?.text = "HighScore: " + UserDefaults().integer(forKey: "highscore").description
    }
    
    override func didChangeSize(_ oldSize: CGSize) {
        for node in self.children{
            let newPosition = CGPoint(x:node.position.x / oldSize.width * self.frame.size.width,y:node.position.y / oldSize.height * self.frame.size.height)
            node.position = newPosition
        }
    }
    
    func initializeScreenButtons() {
        disableButton(button: definitionButton)
        wordList.currentIndex()! > 0  ? enableButton(button: graphButton) : disableButton(button: graphButton)
        enableButton(button: settingsButton)
    }
    
    override func transitionReloadScene(scene: SKScene) {
        transitionToScene(destination: SceneType.GameScene, sendingScene: scene)
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
            params.nodeTile?.setTileTexture(tileElement: TileElement(rawValue: "yellow_tile")!, buttonNode: true)
            params.nodeTile?.addButtonLetter()
            break
        case .control: break
        case .footer: break
        default:
            return
        }
        
    }
        
//    func tileColor(node: SKTileMapNode) {
//        node.getTileColor(completionClosure: { (row, col, color) in
//            print("color: \(color) at row: \(row) col: \(col)")
//        })
//    }
    
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
            if (tileMapNode?.name?.contains(name)) != nil {
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
        }
    }
    
    func inMatchList(list: [SKSpriteNode]) ->Bool {
        var count = 0
        for (index, _) in list.enumerated() {
            if matchList.contains(list[index].name!) {
                count += 1
            }
        }
        return count > 0
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

    func checkForAllMatches() {
        playerScore += matchLetterValue
        if counters.matchComplete() {
            playerScore += bonusPoints()
            playSoundForEvent(soundEvent: .great)
            wordList.setMatchCondition()
            progressSummary()
            enableGraphDisplay()
            readyForInit()
            
            playTextAnimated(fileName: completedMessage())
            delay(2.0) {
                self.stopAudio(delay: 0.2)
                self.transitionReloadScene(scene: self)
            }
            return
        } else {
            playSoundForEvent(soundEvent: .yes)
            //playTextAnimated(fileName: playNotificationMessage())
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
        
        playerScore = UserDefaults().integer(forKey: preferenceCurrentScoreKey)
        let highScore = UserDefaults().integer(forKey: preferenceHighScoreKey)
        if playerScore > highScore {
            UserDefaults().set(playerScore, forKey: preferenceHighScoreKey)
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

