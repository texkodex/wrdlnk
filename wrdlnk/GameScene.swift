//
//  GameScene.swift
//  wrdlnk
//
//  Created by sparkle on 6/1/17.
//  Copyright © 2017 teknowsys. All rights reserved.
//

import SpriteKit

/*
 I think there were a couple of things that prevented memory of being deallocated. But I solved this memory issue finally. Changes I made:
 
 SKTexture(image: UIImage(named:) -> SKTexture(image:) (when I can't use an atlas)
 double check all closures and pass weak or unowned self
 remove all actions, delegates, and child-nodes etc. in willMoveFromView function of the scene
 remove all components from GKComponentSystem in willMoveFromView function
 replace all SKAction.playSoundFileNamed with runBlock actions which start AVAudioPlayer
*/

/*
 For my part, the main culprit is the SKTexture(image: UIImage(named:), this loads a texture into memory and doesn't deallocate it even if the node is removed from the scene.
 You have to manually re-remove all nodes from the scene (in whichever function that signals the exit of the actual scene), and then set the scene to nil.
 
 I wrote a small loop-function that just loops through childs and remove every node, after that setting the scene to nil and doing another presentScene: (presenting an empty scene forces the current one to deallocate).
 This solved my memory leak problems.
 
 If you have a predefined number of nodes, you can reset their textures to an empty image as well.
 */

/*
 SKTexture(image: UIImage(named: textureName)!)
 */
enum GameSceneState: Int {
    case before = 0
    case play
    case graph
    case setting
    case stop
    case done
    static let Count = done.rawValue + 1
}

struct  NameCache {
    static var previousName: String? = nil
    static var previousPreviousName: String? = nil
    
    static func reset() {
        NameCache.previousName = nil
        NameCache.previousPreviousName = nil
    }
}

struct CurrentHighlight {
    static var boardHightlight: String? = nil
    static var boardHightlightText: String? = nil
    static var buttonHighlight: String? = nil
    static var buttonHightlightText: String? = nil
    
    static func reset() {
        CurrentHighlight.boardHightlight = nil
        CurrentHighlight.boardHightlightText = nil
        CurrentHighlight.buttonHighlight = nil
        CurrentHighlight.buttonHightlightText = nil
    }
}

struct TileParam {
    var letter: String
    var tileName: String
    var letterName: String
    var condition: Bool
    var fontSize: CGFloat
    var fontColor: SKColor
    var frame: CGRect
    var cornerRadius: CGFloat
    var tilePosition: CGPoint
    var letterPosition: CGPoint
    var zPosition: CGFloat
    var translate: CGPoint
    var fillColor: SKColor
    var lineWidth: CGFloat
    var fillRule: CGPathFillRule
    var strokeColor: SKColor
    var highlightColor: SKColor
    
    init(letter: String, tileName: String, letterName: String, condition: Bool = false,
         fontSize: CGFloat = CGFloat(26), fontColor: SKColor = .white,
         frame: CGRect = CGRect(x: 0, y: 0, width: defaultTileWidth, height: defaultTileHeight),
         cornerRadius: CGFloat = CGFloat(8.0), tilePosition: CGPoint = CGPoint(x: 0, y: 0),
         letterPosition: CGPoint = CGPoint(x: 0, y: 0), zPosition: CGFloat = CGFloat(10),
         translate: CGPoint = CGPoint(x: CGFloat(-568.0), y: CGFloat(359.0)),
         fillColor: SKColor = layoutColor.greenPinkTileFill, lineWidth: CGFloat = CGFloat(2.0),
         fillRule: CGPathFillRule = CGPathFillRule.evenOdd, strokeColor: SKColor = layoutColor.greenPinkTileStroke,
         highlightColor: SKColor = layoutColor.highlightDefault) {
        
        self.letter = letter
        self.tileName = tileName
        self.letterName = letterName
        self.condition = condition
        self.fontSize = fontSize
        self.fontColor = fontColor
        self.frame = frame
        self.cornerRadius = cornerRadius
        self.tilePosition = tilePosition
        self.letterPosition = letterPosition
        self.zPosition = zPosition
        self.translate = translate
        self.fillColor = fillColor
        self.lineWidth = lineWidth
        self.fillRule = fillRule
        self.strokeColor = strokeColor
        self.highlightColor = highlightColor
    }
}

typealias BoardParamType = TileParam
typealias ButtonParamType = TileParam

protocol GameSceneDelegate: class {
    func toggleSetting(settingName: String?)
}

class GameScene: BaseScene, GraphOverlayDelegate, SettingOverlayDelegate, UIGestureRecognizerDelegate, GameSceneDelegate {
    
    var commonGameController: CommonGameController?
    
    // MARK:- Top nodes
    lazy var gameRoot = childNode(withName: "//gameRoot")
    lazy var graphRoot = childNode(withName: "//graphRoot")
    lazy var settingRoot = childNode(withName: "//settingRoot")
    
    let mark = ButtonNode(imageNamed: "pdf/mark")
    
    let graphButton: SKSpriteNode = SKSpriteNode(imageNamed: "pdf/scores")
    let settingsButton: SKSpriteNode = SKSpriteNode(imageNamed: "pdf/settings")
    
    // MARK:- Nodes
    var definitionButton: ButtonNode? {
        return backgroundNodeOne?.childNode(withName: ButtonIdentifier.provideMeaning.rawValue) as? ButtonNode
    }
    
    // Sound effects
    //    private var beepbeepSound: SKAudioNode!
    private var biffSound: SKAudioNode!
    private var yesSound: SKAudioNode!
    private var goodSound: SKAudioNode!
    private var great2Sound: SKAudioNode!
    private var errorSound: SKAudioNode!

    // audio
    private var audioSources = [SKAudioNode](repeatElement(SKAudioNode(), count: SoundEvent.totalCount.rawValue))
    
    // MARK: - Audio
    
    func playSound(_ audioName: SoundEvent) {
        gameRoot?.addChild(audioSources[audioName.rawValue])
    }
    
    private func loadSounds() {
        let beepbeepSound = SKAudioNode(fileNamed: "beepbeep")
        beepbeepSound.isPositional = false
        beepbeepSound.autoplayLooped = false
        self.addChild(beepbeepSound)
        
        biffSound = SKAudioNode(fileNamed: "beep")
        //biffSound.isPositional = false
        //biffSound.autoplayLooped = false
        
        yesSound = SKAudioNode(fileNamed: "yes")
        //yesSound.isPositional = false
        //yesSound.autoplayLooped = false
        
        goodSound = SKAudioNode(fileNamed: "good")
        //goodSound.isPositional = false
        //goodSound.autoplayLooped = false
        
        great2Sound = SKAudioNode(fileNamed: "great2")
        //great2Sound.isPositional = false
        //great2Sound.autoplayLooped = false
        
        errorSound = SKAudioNode(fileNamed: "error")
        //errorSound.isPositional = false
        //errorSound.autoplayLooped = false
    }
    
    // MARK:- End of sound setup
    var definitionOff = false {
        didSet {
            let imageName = definitionOff ? "questionOff" : "questionOn"
            definitionButton?.selectedTexture = SKTexture(image: UIImage(named: imageName)!)
        }
    }
    
    var installObervers: Bool = false {
        didSet {
            print("The value of installObervers changed from \(oldValue) to \(installObervers)")
        }
    }
    
    weak private var graphOverlay: GraphOverlay?
    
    weak private var settingOverlay: SettingOverlay?
    
    // MARK:- SKLabelNode
    let playerScoreLabel = SKLabelNode(text: "0")
    
    var highScoreLabel: SKLabelNode? {
        return nil
    }
    
    var playerTimerLabel = SKLabelNode(text: "%02d:%02d")
    
    // MARK:- Overlay scenes
    var gameState: GameSceneState = .before {
        willSet {
            willShowPopScene(newValue)
        }
    }
    
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
    
    var tileNodeList: [SKShapeNode] = []
    
    var matchList: [String] = []
    
    var keyPlayNotificationDictionary = [String:String]()
    var contentPlist:[[String:String]] = []
    
    var notificationMessageList: [String] = []
    var awardMessageList: [String] = []
    var completedMessageList: [String] = []
    
    // MARK:- delegate
    weak var graphOverlayDelegate: GraphOverlayDelegate?
    
    weak private var settingOverlayDelegate: SettingOverlayDelegate?
    
    weak private var gameSceneDelegate: GameSceneDelegate?
    
    
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
            let value = newValue
            DispatchQueue.main.async() { [value] in
                AppDefinition.defaults.set(value, forKey: preferenceCurrentScoreKey)
            }
            
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
        cleanup()
        self.view?.presentScene(nil)
    }
    
    private func cleanup() {
        print("Entering \(#file):: \(#function) at line \(#line)")
        graphOverlayDelegate = nil
        settingOverlayDelegate = nil
        gameSceneDelegate = nil
        transitionManagerDelegate = nil
        
        preserve()
        
        gameRoot?.removeFromParent()
        gameRoot = nil
        settingRoot?.removeFromParent()
        settingRoot = nil
        graphRoot?.removeFromParent()
        graphRoot = nil
        tileNodeList.removeAll()
        matchList.removeAll()
        
        removeObservers()
        
        self.removeFromParent()
        self.removeAllChildren()
        self.removeAllActions()
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
            //            self.graphOverlayNode?.touchAtPoint(location)
            print("complete case .graph")
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
        self.name = "GameScene"
        
        placeAssets()
        setupCountersAndWords()
        setupGameSceneResources()
        setupHighlight()
        
        loadSounds()
     
        setupGraphOverlay()
        setupSettingOverlay()
        
        
        let tapBoardGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.handleTapFrom(recognizer:)))
        tapBoardGestureRecognizer.numberOfTapsRequired = 1
        view.addGestureRecognizer(tapBoardGestureRecognizer)
        tapBoardGestureRecognizer.delegate = self
        
        let overlayGestureRecognizer = OverlayTapGestureRecognizer(target: self, action: #selector(self.handleOverlayTapFrom(recognizer:)))
        overlayGestureRecognizer.numberOfTapsRequired = 1
        overlayGestureRecognizer.scene = self
        overlayGestureRecognizer.graphOverlayDelegate = graphOverlayDelegate
        overlayGestureRecognizer.settingOverlayDelegate = settingOverlayDelegate
        overlayGestureRecognizer.gameSceneDelegate = gameSceneDelegate
        view.addGestureRecognizer(overlayGestureRecognizer)
        overlayGestureRecognizer.delegate = self
        
        // If overaly service first
        tapBoardGestureRecognizer.require(toFail: overlayGestureRecognizer)
        
        // GameScene delegate
        gameSceneDelegate = self
        
        playNotification()
        // Start game timer
        setupTimer()
        
        setupObservers()
        
        AppTheme.instance.set(for: self, sceneType: "SettingScene")
    }
    
    func setupObservers() {
        UserDefaults.standard.addObserver(self, forKeyPath: preferenceObserverSoundEnabledKey, options: NSKeyValueObservingOptions.new, context: nil)
        UserDefaults.standard.addObserver(self, forKeyPath: preferenceObserverScoreEnabledKey, options: NSKeyValueObservingOptions.new, context: nil)
        UserDefaults.standard.addObserver(self, forKeyPath: preferenceObserverTimerEnabledKey, options: NSKeyValueObservingOptions.new, context: nil)
        installObervers = true
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        
        if keyPath == preferenceObserverSoundEnabledKey {
             print("Toggle sound")
        } else if keyPath == preferenceObserverScoreEnabledKey {
             print("Toggle score")
        } else if keyPath == preferenceObserverTimerEnabledKey {
            print("Toggle timer")
        }
    }
    
    func toggleSetting(settingName: String?) {
        print("Entering \(#file):: \(#function) at line \(#line)")
    }
    
    // MARK:- cleanup in willMoveFromView
    override func willMove(from view: SKView) {
        print("Entering \(#file):: \(#function) at line \(#line)")
        
        // cleanup all objects
        for node in self.children {
            node.removeAllChildren()
            node.removeAllActions()
            node.removeFromParent()
        }
        cleanup()
        sceneCloseNotification()
    
    }
    
    func sceneCloseNotification() {
        let filename = (#file as NSString).deletingPathExtension
        let userInfo = ["SceneClose" : "\(filename)"]
        NotificationCenter.default.post(name: .completedTransitionName, object: userInfo)
    }
    
    func removeObservers() {
        if installObervers {
            if UserDefaults.standard.keyExist(key: preferenceObserverSoundEnabledKey) {
                UserDefaults.standard.removeObserver(self, forKeyPath: preferenceObserverSoundEnabledKey)
            }
            if UserDefaults.standard.keyExist(key: preferenceObserverScoreEnabledKey) {
            UserDefaults.standard.removeObserver(self, forKeyPath: preferenceObserverScoreEnabledKey)
            }
            if UserDefaults.standard.keyExist(key: preferenceObserverTimerEnabledKey) {
                UserDefaults.standard.removeObserver(self, forKeyPath: preferenceObserverTimerEnabledKey)
            }
            installObervers = false
        }
    }
    
    func setupTimer() {
        if initializeTimer {
            startTime = AppDefinition.defaults.integer(forKey: preferenceGameLevelTimeKey)
            AppDefinition.defaults.set(false, forKey: preferenceSetTimerEnabledKey)
        }
        self.playerTimerLabel.name = "playerTimer"
        self.playerTimerLabel.text = timerString()
        self.playerTimerLabel.fontName = UIFont.systemFont(ofSize: 14).fontName
        countTime()
    }
    
    func modePrefixString() -> String {
        #if false
        if currentMode().rawValue.contains("normal") {
            return ""
        }
        else {
            return currentMode().rawValue + "/"
        }
        #endif
        return ""
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
    
    func completedMessage() -> String? {
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
    
    private func setupHighlight() {
        print("Entering \(#file):: \(#function) at line \(#line)")
        if CurrentHighlight.boardHightlight != nil {
            highlightTileNode(labelName: CurrentHighlight.boardHightlight!)
        }
        if CurrentHighlight.buttonHighlight != nil {
            highlightTileNode(labelName: CurrentHighlight.buttonHighlight)
        }
    }
    
    func drawAppTileWith(param: TileParam) -> SKShapeNode {
        do {
            /// greenpinktile
            let greenpinktile = SKShapeNode()
            greenpinktile.name = param.tileName
            greenpinktile.path = UIBezierPath(roundedRect: CGRect(x: 0, y: 0, width: param.frame.width * layoutRatio.currentWidthScaleFactor, height: param.frame.height * layoutRatio.currentHeightScaleFactor), cornerRadius: param.cornerRadius * layoutRatio.currentHeightScaleFactor).cgPath
            greenpinktile.position = param.tilePosition
            greenpinktile.zPosition = param.zPosition
            if param.condition && param.tileName.hasPrefix(boardTileName){
                greenpinktile.fillColor = AppTheme.instance.colorFillAndStrokeBoardAndButton(condition: param.condition).fill!
                greenpinktile.lineWidth = param.lineWidth * layoutRatio.currentWidthScaleFactor
                greenpinktile.strokeColor =
                    AppTheme.instance.colorFillAndStrokeBoardAndButton(condition: param.condition).stroke!
            } else if param.tileName.hasPrefix(boardTileName) {
                greenpinktile.fillColor = AppTheme.instance.colorFillAndStrokeBoardAndButton().fill!
                greenpinktile.lineWidth = param.lineWidth * layoutRatio.currentWidthScaleFactor
                greenpinktile.strokeColor =
                    AppTheme.instance.colorFillAndStrokeBoardAndButton().stroke!
            }
            greenpinktile.userData = [:]
            // If board tile node is a vowel:
            // hide it and make it clickable
            if param.condition {
                greenpinktile.userData = [tileUserDataClickName: true]
            }
            
            if param.tileName.hasPrefix(buttonTileName) {
                greenpinktile.userData = [tileUserDataClickName: true]
                greenpinktile.fillColor = AppTheme.instance.colorFillAndStrokeBoardAndButton(board: false).fill!
            }
            
            let letter = SKLabelNode(text: param.letter)
            letter.name = param.letterName
            letter.fontName = UIFont.systemFont(ofSize: param.fontSize).fontName
            letter.fontSize = param.fontSize * layoutRatio.currentHeightScaleFactor
            letter.fontColor = param.fontColor
            letter.position = letter.convert(CGPoint(x: greenpinktile.frame.midX, y: greenpinktile.frame.midY), to: greenpinktile)
            letter.zPosition = param.zPosition
            if param.condition {
                letter.alpha = CGFloat(0.0)
            }
            letter.horizontalAlignmentMode = .center
            letter.verticalAlignmentMode = .center
            
            greenpinktile.addChild(letter)
            
            // highlight
            let highlightTile = SKShapeNode()
            highlightTile.name = "highlight_\(param.tileName)"
            highlightTile.path = UIBezierPath(arcCenter: CGPoint(x: letter.frame.midX, y: letter.frame.midY), radius: CGFloat(greenpinktile.frame.width * layoutRatio.currentWidthScaleFactor / 2), startAngle: CGFloat(0), endAngle:CGFloat(Double.pi * 2), clockwise: true).cgPath
            highlightTile.position = highlightTile.convert(CGPoint(x: greenpinktile.frame.midX, y: greenpinktile.frame.midY), to: letter)
            highlightTile.zPosition = letter.zPosition + 1
            
            highlightTile.fillColor = AppTheme.instance.colorFillAndStrokeBoardAndButton(board: false, condition: true).fill!
            highlightTile.alpha = CGFloat(0.0)
            greenpinktile.addChild(highlightTile)
            return greenpinktile
            
        }
    }
    
    func placeAssets() {
        var position: CGPoint!
        position = CGPoint(x: size.width * layoutRatio.markPositionSizeWidth, y: size.height * layoutRatio.markPositionSizeHeightFromTop)
        var scaledWidth = size.width * layoutRatio.markWidthScale
        var scaledHeight = size.height * layoutRatio.markHeightScale
        
        mark.name = "mark"
        mark.scale(to: CGSize(width: scaledWidth, height: scaledHeight))
        
        let buttonParam =
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
        graphButton.texture = SKTexture(image: UIImage(named: "pdf/scores")!)
        graphButton.name = "ShowGraph"
        graphButton.position = position
        graphButton.zPosition = 10
        graphButton.anchorPoint = CGPoint(x: 0.5, y: 1.0)
        addChild(graphButton)
        
        xPos = size.width * -(layoutRatio.xAnchor - layoutRatio.indentForGameButtonFromSideEdge)
        position.x = xPos
        
        scaledWidth = size.width * layoutRatio.buttonSettingsWidthScale
        scaledHeight = size.height * layoutRatio.buttonSettingsHeightScale
        settingsButton.scale(to: CGSize(width: scaledWidth, height: scaledHeight))
        settingsButton.texture = SKTexture(image: UIImage(named: "pdf/settings")!)
        settingsButton.name = "GameSettings"
        settingsButton.position = position
        settingsButton.zPosition = 10
        settingsButton.anchorPoint = CGPoint(x: 0.5, y: 1.0)
        addChild(settingsButton)
        
        getWordsAndPlace()
        placeButtons()
        
    }
    
    func getWordsAndPlace() {
        repeat  {
            if placeBoard() == false {
                _ = wordList.skip()
            } else {
                break
            }
        } while(true)
    }
    
    func placeBoard() -> Bool {
        let getWords = wordList.getCurrentWords()!
        let lettersPerRow = [getWords.prefix.utf8.count, getWords.link.utf8.count, getWords.suffix.utf8.count]
        
        let maxTiles = lettersPerRow.map { $0 }.max()!
        var position: CGPoint!
        let tileWidth = CGFloat(size.width * layoutRatio.tileWidthToScreen)
        let tileHeight = CGFloat(size.height * layoutRatio.tileHeightToScreen)
        let tileInnerSpace = CGFloat(size.width * layoutRatio.spaceBetweenInnerTileInRow)
        let maxAvailableTiles = Int(size.width / (tileWidth + tileInnerSpace))
        
        if maxAvailableTiles <= maxTiles {
            print("Cannot display all tiles")
            return false
        }
        
        var param: BoardTileParam = BoardTileParam()
        
        let wordsForRow = [getWords.prefix, getWords.link, getWords.suffix]
        let fontSize = tileHeight * layoutRatio.textSizeToTileHeight
        let yPos = size.height * (layoutRatio.yAnchor - layoutRatio.indentFromTopEdgeFirstBoardRow)
        position = CGPoint(x: CGFloat(0), y: yPos )
        for row in 1...3 {
            
            // Adjust for less than max row tiles
            let lettersOnRow = CGFloat(lettersPerRow[row - 1])
            let totalRowSpaceUsed = (tileWidth * lettersOnRow) + (lettersOnRow - 1) * tileInnerSpace
            let spaceOnEachRowSide = (frame.size.width - totalRowSpaceUsed) / CGFloat(2)
            let xPosAdjustment = CGFloat(0)
            let xPos = size.width * -(layoutRatio.xAnchor) + spaceOnEachRowSide
            position.x = xPos
            
            
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
        return true
    }
    
    func placeBoardTile(param: BoardTileParam) {
        
        let index = param.currentWord.index(param.currentWord.startIndex, offsetBy: param.column - 1)
        let condition =  VowelCharacter(rawValue: param.currentWord[index])?.rawValue == param.currentWord[index]
        
        let tileName = "board_tile_\((param.row)!)_\((param.column)!)"
        let letterName = "board_letter_\((param.row)!)_\((param.column)!)"
      
        gameRoot?.addChild(drawAppTileWith(param: BoardParamType(
            letter: "\(param.currentWord[index])",
            tileName: tileName, letterName: letterName,
            condition: condition,
            tilePosition: param.position,
            fillColor: AppTheme.instance.colorFillAndStrokeBoardAndButton(board: true, condition: condition).fill!,
            strokeColor: AppTheme.instance.colorFillAndStrokeBoardAndButton(board: true, condition: condition).stroke!
            )))
    }
    
    func placeButtons() {
        var position: CGPoint!
        let tileWidth = size.width * layoutRatio.tileWidthToScreen
        let tileInnerSpace = size.width * layoutRatio.spaceBetweenInnerTileInRow
        let lettersOnRow = CGFloat(6)
        let totalRowSpaceUsed = (tileWidth * lettersOnRow) + (lettersOnRow - 1) * tileInnerSpace
        let spaceOnEachRowSide = (frame.size.width - totalRowSpaceUsed) / CGFloat(2)
        let xPos = size.width * -(layoutRatio.xAnchor) + spaceOnEachRowSide
        let yPos = size.height * (layoutRatio.yAnchor - layoutRatio.indentFromTopEdgeToCenterOfButton)
        position = CGPoint(x: xPos, y: yPos)
        
        let labels = ["A", "E", "I", "O", "U", "Y"]
        
        for column in 1...layoutRatio.numberOfVowels {
            let tileName = "button_tile_\(column)"
            let letterName = "button_letter_\(column)"
            
            gameRoot?.addChild(drawAppTileWith(param: BoardParamType(
                letter: "\(labels[column - 1])",
                tileName: tileName, letterName: letterName,
                tilePosition: position,
                fillColor: AppTheme.instance.colorFillAndStrokeBoardAndButton(board: false).fill!,
                strokeColor: AppTheme.instance.colorFillAndStrokeBoardAndButton(board: false).stroke!)))

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
        
        graphButton.isHidden = (wordList.currentIndex()! > 0 && !statData.isEmpty()  ? false :  true)
        
        settingsButton.isHidden = false
        
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
        #if false
        transitionToScene(destination: SceneType.GameScene, sendingScene: scene, continueGame: continueGame)
        #endif
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
    
    // "<SKLabelNode> name:\'board_letter_1_1\' text:\'I\' fontName:\'.SFUIDisplay\' position:{16.23199462890625, 16.206901550292969}"
    // "<SKShapeNode> name:\'highlight_board_tile_1_1\' accumulatedFrame:{{0.98400002717971802, 0.95899999141693115}, {31.496999740600586, 31.496999740600586}}"
    func findAvailableSpriteNode(node: SKNode) -> SKLabelNode? {
        if node.children.count == 0 {
            if (node.name?.contains("board_letter"))! ||
                (node.name?.contains("button_letter"))! {
                return node as? SKLabelNode
            }
        }
        for child in node.children {
            if (child.name?.contains("board_letter"))! ||
                (child.name?.contains("button_letter"))! {
                return child as? SKLabelNode
            }
        }
        return nil
    }
    
    // MARK: - Gesture recognizer
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
    
    func checkIfOverlaySelection(sceneNode: SKNode, nodes: [SKNode]) -> Bool {
        
        if sceneNode.name == "settingOverlay" {
            settingOverlayDelegate?.hideOverlaySetting()
            return true
        } else if sceneNode.name == "graphOverlay" {
            graphOverlayDelegate?.hideOverlayGraph()
            return true
        }
        return false
    }
    
    @objc func handleOverlayTapFrom(recognizer: UITapGestureRecognizer) {
        print("Entering \(#file):: \(#function) at line \(#line)")
        if recognizer.state != .ended {
            return
        }
        
        let recognizorLocation = recognizer.location(in: self.scene?.view)
        let location = self.convertPoint(fromView: recognizorLocation)
        
        let nodeAtScene = scene?.atPoint(location)
        if (nodeAtScene == nil || nodeAtScene?.name == "backgroundBase") {
            return
        } else {
            print("name of overlay node: \(String(describing: nodeAtScene?.name))")
        }
        
        let nodesAtPoint = self.nodes(at: location)
        if nodesAtPoint.count == 0  { return }
        
        if checkIfOverlaySelection(sceneNode: nodeAtScene!, nodes: nodesAtPoint) {
            return
        }
    }
    
    @objc func handleTapFrom(recognizer: UITapGestureRecognizer) {
        print("Entering \(#file):: \(#function) at line \(#line)")
        if recognizer.state != .ended {
            return
        }
        
        let recognizorLocation = recognizer.location(in: self.scene?.view)
        let location = self.convertPoint(fromView: recognizorLocation)
        
        let nodeAtScene = scene?.atPoint(location)
        if (nodeAtScene == nil || nodeAtScene?.name == "backgroundBase" ||  nodeAtScene?.name == "gameScene") {
            return
        } else if nodeAtScene?.name == "titleImage" {
            cleanup()
            return
        } else {
            print("name of node at scene: \(String(describing: nodeAtScene?.name))")
        }
        
        guard let labelNode = findAvailableSpriteNode(node: nodeAtScene!) else { return }
        
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
        print("new tile Node: \(String(describing: labelNode.name!)) selected")
        
        clickCount(labelName: labelNode.name)
        
        highlightSelection(labelNode: labelNode)
        
        processTileSelection(labelName: labelNode.name)
    }
    
    func getTileNamefromLabelName(labelName: String?) -> String? {
        return labelName?.replacingOccurrences(of: "letter", with: "tile")
    }
    
    func selectableNode(labelName: String) -> Bool {
        let tileName = getTileNamefromLabelName(labelName: labelName)
        let node = gameRoot?.childNode(withName: "//" + tileName!)
        if node?.userData?.count == 0 {
            return false
        }
        return true
    }
    
    func getTileNodeFromLabelName(labelName: String) -> SKNode? {
        let tileName = getTileNamefromLabelName(labelName: labelName)
        return gameRoot?.childNode(withName: "//" + tileName!)
    }
   
    func checkHighlightMatch() -> Bool {
        print("Entering \(#file):: \(#function) at line \(#line)")
        // check board highlight
        // check button highlight
        // if equal
        // register match and check for complete match
        if CurrentHighlight.boardHightlight != nil && CurrentHighlight.buttonHighlight != nil {
            print("board highlight: \((CurrentHighlight.boardHightlight)!)")
            print("button highlight: \((CurrentHighlight.buttonHighlight)!)")
            if CurrentHighlight.boardHightlightText == CurrentHighlight.buttonHightlightText {
                return true
            }
        }
        return false
    }
    
    func unhiglightPrevious(previousLabelName: String?) {
        let tileName = getTileNamefromLabelName(labelName: previousLabelName)
        let highlightLabel = gameRoot?.childNode(withName: "//highlight_\((tileName)!)")
        if (highlightLabel?.isKind(of: SKShapeNode.self))! {
            highlightLabel?.alpha = CGFloat(turnOffVisibility)
        }
    }
    
    func processTileSelection(labelName: String?) {
        print("Entering \(#file):: \(#function) at line \(#line)")
        if checkHighlightMatch() {
            print("Match between: \((CurrentHighlight.boardHightlight)!) and \((CurrentHighlight.buttonHighlight)!)")
            
            // reveal matched letter and mark board cell occupied
            let tileNode = gameRoot?.childNode(withName: nameDoubleSlashPrex + CurrentHighlight.boardHightlight!)
            tileNode?.alpha = CGFloat(turnOnVisibility)
            
            // clear highlighted cells
            unhighlightTileNode(labelName: CurrentHighlight.boardHightlight!)
            unhighlightTileNode(labelName: CurrentHighlight.buttonHighlight!)

            // increment match count
            counters.clickMatch()
            
            // record position to restore
            liveData.addItem(item: LiveData(position: CurrentHighlight.boardHightlight!))
            
            // reset CurrentHighlight structure contents
            CurrentHighlight.reset()
            
            // check if completed match
            checkForAllMatches()
        }
    }
    
    // MARK:- overlay views
    func setupGraphOverlay()  {
        print("Entering \(#file):: \(#function) at line \(#line)")
        
        let rootNode: GraphOverlay = GraphOverlay(size: CGSize(width: (self.view?.bounds.size.width)!, height: (self.view?.bounds.size.height)!))
        graphOverlayDelegate = rootNode
        graphRoot?.addChild(rootNode)
    }
    
    func showOverlayGraph() {
        print("Entering \(#file):: \(#function) at line \(#line)")
        self.isUserInteractionEnabled = false
        self.isPaused = true
        graphOverlayDelegate?.showOverlayGraph()
    }
    
    func hideOverlayGraph() {
        print("Entering \(#file):: \(#function) at line \(#line)")
        self.isUserInteractionEnabled = true
        self.isPaused = false
        graphOverlayDelegate?.hideOverlayGraph()
    }
    
    func setupSettingOverlay()  {
        print("Entering \(#file):: \(#function) at line \(#line)")
        
        let rootNode: SettingOverlay = SettingOverlay(size: CGSize(width: (self.view?.bounds.size.width)!, height: (self.view?.bounds.size.height)!))
        settingOverlayDelegate = rootNode
        settingRoot?.addChild(rootNode)
    }
    
    func showOverlaySetting() {
        print("Entering \(#file):: \(#function) at line \(#line)")
        self.isUserInteractionEnabled = false
        self.isPaused = true
        settingOverlayDelegate?.showOverlaySetting()
    }
    
    func hideOverlaySetting() {
        print("Entering \(#file):: \(#function) at line \(#line)")
        self.isUserInteractionEnabled = true
        self.isPaused = false
        settingOverlayDelegate?.hideOverlaySetting()
    }
    
    func clickCount(labelName: String?) {
        if ((labelName?.hasPrefix(boardLetterName))! == true
            || (labelName?.hasPrefix(buttonLetterName))! == true) {
            let tileNode = getTileNodeFromLabelName(labelName: labelName!)
            if (tileNode?.userData?.count != 0 && (tileNode?.userData?.value(forKeyPath: tileUserDataClickName) as? Bool)!)  {
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
        let childrenList = gameRoot?.childNode(withName: (nodeName)!)?.children
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
        let previousNode = gameRoot?.childNode(withName: (name)!)
        let childNodeList = previousNode?.children
        for child in childNodeList! {
            if (child.name?.contains(highlightPrefix))! {
                child.alpha = CGFloat(turnOffVisibility)
            }
        }
    }
    
    func unhighlightAllExcept(tileNameList: [String?]) {
        if localToggle { print("Entering \(#file):: \(#function) at line \(#line)") }
        let buttonList = gameRoot?.children.filter{ ($0.name?.contains(buttonTileName))! }
        for buttonNode in buttonList! {
            let node = gameRoot?.childNode(withName: buttonNode.name!)
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
        let buttonList = gameRoot?.children.filter{ ($0.name?.contains(buttonTileName))! }
        for buttonNode in buttonList! {
            let node = gameRoot?.childNode(withName: buttonNode.name!)
            for child in (node?.children)! {
                if (child.name?.contains(highlightPrefix))! {
                    child.alpha = CGFloat(turnOffVisibility)
                }
            }
        }
    }
    
    func unhighlightBoardTiles() {
        if localToggle { print("Entering \(#file):: \(#function) at line \(#line)") }
        let tileList = gameRoot?.children.filter{ ($0.name?.contains(boardTileName))! }
        for tileNode in tileList! {
            let node = gameRoot?.childNode(withName: tileNode.name!)
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
            let tileNode = gameRoot?.childNode(withName: nameDoubleSlashPrex + tileLetterName!)
            tileNode?.alpha = CGFloat(turnOnVisibility)
        }
    }
    
    func restoreBoardState(liveDataItems: [LiveData]) {
        for (_, selection) in liveDataItems.enumerated() {
            if selection.position.lowercased().contains(boardLetterName) {
                let tileNode = gameRoot?.childNode(withName: nameDoubleSlashPrex + selection.position)
                tileNode?.alpha = CGFloat(turnOnVisibility)
                counters.restoreMatch()
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
            #if false
                playSoundForEvent(soundEvent: .error)
            #endif
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
    
    func unlightOneofThreeNodes(newNode: String?, newNodeText: String?, previousNode: String?, previousPreviousNode: String?) {
        // button button board
        // board board button
        if (newNode?.contains(boardLetterName))!  {
            if (previousNode != nil) && (previousNode?.contains(boardLetterName))! {
                unhighlightTileNode(labelName:previousNode!)
            } else if (previousPreviousNode != nil) && (previousPreviousNode?.contains(boardLetterName))! {
                unhighlightTileNode(labelName:previousPreviousNode!)
                NameCache.previousPreviousName = NameCache.previousName
            }
            unhighlightBoardTiles()
            highlightTileNode(labelName:newNode!)
            CurrentHighlight.boardHightlight = newNode
            CurrentHighlight.boardHightlightText = newNodeText
        } else if (newNode?.contains(buttonLetterName))!  {
            if (previousNode != nil) && (previousNode?.contains(buttonLetterName))! {
                unhighlightTileNode(labelName:previousNode!)
            } else if (previousPreviousNode != nil) && (previousPreviousNode?.contains(buttonLetterName))! {
                unhighlightTileNode(labelName:previousPreviousNode!)
                NameCache.previousPreviousName = NameCache.previousName
            }
            unhighlightButtonTiles()
            highlightTileNode(labelName:newNode!)
            CurrentHighlight.buttonHighlight = newNode
            CurrentHighlight.buttonHightlightText = newNodeText
        }
    }
    
    // MARK:- New Highlighting method
    //        let boardLetterName = "board_letter_" // SKLabelNode
    //        let buttonTileName = "button_tile"  // SKSpriteNode
    //        let buttonLetterName = "button_letter_" // SKLabelNode
    //        let boardTileName = "board_tile"  // SKSpriteNode
    //        let highNodePrefix = "highlight_"
    func highlightSelection(labelNode: SKLabelNode?) {
        if !selectableNode(labelName: (labelNode?.name)!) {
            return
        }
        
        unlightOneofThreeNodes(newNode: labelNode?.name, newNodeText: labelNode?.text, previousNode: NameCache.previousName, previousPreviousNode: NameCache.previousPreviousName)
       
        NameCache.previousName = labelNode?.name
    }
    
    func highlightTileNode(labelName: String?) {
        if (labelName?.contains(boardLetterName))! || (labelName?.contains(buttonLetterName))! {
            let tileName = getTileNamefromLabelName(labelName: labelName!)
            let highlightLabel = gameRoot?.childNode(withName: "//highlight_\((tileName)!)")
            if (highlightLabel?.isKind(of: SKShapeNode.self))! {
                highlightLabel?.alpha = CGFloat(turnOnVisibility)
            }
        }
    }
    
    func unhighlightTileNode(labelName: String?) {
        let tileName = getTileNamefromLabelName(labelName: labelName!)
        let highlightLabel = gameRoot?.childNode(withName: "//highlight_\((tileName)!)")
        if (highlightLabel?.isKind(of: SKShapeNode.self))! {
            highlightLabel?.alpha = CGFloat(turnOffVisibility)
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
        let highlightNode = gameRoot?.childNode(withName: hightlightNodeName)
        highlightNode?.isHidden = hidden
    }
    
    func toggleHighlightButtonTile(nodeName: String, hidden: Bool = true) {
        print("Entering \(#file):: \(#function) at line \(#line)")
        let hightlightNodeName = "//highlight_\(nodeName)"
        let highlightNode = gameRoot?.childNode(withName: hightlightNodeName)
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
            #if false
                playSoundForEvent(soundEvent: .great2)
            #endif
            wordList.setMatchCondition()
            progressSummary()
            
            //preserve()
            enableGraphDisplay()
            readyForInit()
            
            delay(messageFrequency()) {
                self.liveData.deleteLiveData()
                self.counters.deleteVowelCount()
                self.stopAudio(delay: 0.2)
                self.resetTimer = true
                AppDefinition.defaults.set(true, forKey: preferenceContinueGameEnabledKey)
                #if false
                    self.transitionReloadScene(scene: self)
                #endif
            }
            
            #if false
                _ = wordList.getWords()
            #endif
            transitionManagerDelegate?.startedSceneTransition(name: ButtonIdentifier.continueGame.rawValue, destination:  SceneType.GameScene, sendingScene: self)
        } else {
            #if false
                playSoundForEvent(soundEvent: .yes)
            #endif
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
        playerScoreLabel.fontName = UIFont.systemFont(ofSize: 14).fontName
    }
    
    
    // MARK:- Timer
    func playerTimerUpdate() {
        playerTimerVisible()
        
        if resetTimer {
            startTime = AppDefinition.defaults.integer(forKey: preferenceGameLevelTimeKey)
            resetTimer = false
            AppDefinition.defaults.set(false, forKey: preferenceContinueGameEnabledKey)
            wordList.clearMatchCondition()
        } else {
            startTime = AppDefinition.defaults.integer(forKey: preferenceStartTimeKey)
        }
    }
    
    private func playerTimerVisible() {
        if AppDefinition.defaults.bool(forKey: preferenceTimerEnabledKey) {
            playerTimerLabel.text = "\(playerTimer)"
        } else {
            playerTimerLabel.isHidden = true
        }
    }
    
    // MARK:- play progress text
    func playTextAnimated(fileName: String?) {
        guard let _ = fileName else { return }
        
        var positionScale:CGFloat!
        var spriteScale: CGFloat!
        var groupAction:[SKAction] = []
        let texture = SKTexture(image: UIImage(named: fileName!)!)
        let messageNode = SKSpriteNode(texture: texture, size:CGSize(width: texture.size().width, height: texture.size().height))
        messageNode.name = "animatedText"
        messageNode.color = AppTheme.instance.colorFillAndStrokeBoardAndButton(board: false, condition: true).stroke!
        messageNode.colorBlendFactor = 1
        
        messageNode.zPosition = self.playerTimerLabel.zPosition + 1
        
        if UIDevice.isiPad {
            positionScale = 1.3
            spriteScale = 1.5
            messageNode.scale(to: CGSize(width: texture.size().width * layoutRatio.currentWidthScaleFactor,
                                         height: texture.size().height * layoutRatio.currentHeightScaleFactor))
            groupAction = [.scale(to: spriteScale, duration: 0.3)]
        } else {
            positionScale = 0.9
            spriteScale = layoutRatio.currentHeightScaleFactor
            groupAction = [.scale(to: spriteScale, duration: 0.3)]
        }
        
        let bgframe = self.frame
        let moveToArray = [CGPoint(x: bgframe.midX + (1 * tileWidth), y: bgframe.minY * positionScale),
                           CGPoint(x: bgframe.midX - (1 * tileWidth), y: bgframe.minY * positionScale),
                           CGPoint(x: bgframe.midX - (1 * tileWidth), y: bgframe.minY * positionScale) ]
        
        let moveFromArray = [CGPoint(x: bgframe.midX + (1 * tileWidth), y: max(bgframe.midY + (7 * tileHeight), bgframe.maxY - tileHeight)),
                             CGPoint(x: bgframe.midX - (1 * tileWidth), y: bgframe.maxY * positionScale),
                             CGPoint(x: bgframe.midX - (1 * tileWidth), y: bgframe.maxY * positionScale) ]
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

