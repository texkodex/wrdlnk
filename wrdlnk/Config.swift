//
//  Config.swift
//  wrdlnk
//
//  Created by sparkle on 6/8/17.
//  Copyright © 2017 teknowsys. All rights reserved.
//

import Foundation
import UIKit
import SpriteKit

// MARK:- Application Config
struct AppDefinition {
    static let defaults = UserDefaults.standard
    static let MainStoryboard = "Main"
    static let OnboardingStoryboard = "Onboarding"
    static let UserDefaultsTag = "Settings"
    static let PropertyList = "plist"
    static let defaultsTag = "defaults"
    static let InitialDefaults = "initialDefaults"
    static let DefaultBackground = "BackgroundColor"
    static let WalkthroughContent = "WalkThrough"
    static let PlayNotification = "PlayNotification"
}

enum StoryboardName : String {
    case Main = "Main"
    case Onboarding = "Onboarding"
}

// MARK:- Defines
let debugInfo = false

let defaultTileWidth: CGFloat = 42
let defaultTileHeight: CGFloat = 42
let defaultTileInnerWidth: CGFloat = 40.0
let defaultTileInnerHeight: CGFloat = 40.0

let tileWidth: CGFloat = 22
let tileHeight: CGFloat = 22

let tileWidthLess2: CGFloat = 20.0
let tileHeightLess2: CGFloat = 20.0

let VisibleStateCount = 6

let buttonsTileMap = "buttons"
let boardTileMap = "board"
let tileNodeName = "tileNode_"
let tileNodeColRow = "tileNode_%d_%d"
let tileNodeNameColRow = "tileNode_%@_%d_%d"
let tileUserDataClickName = "clickable"
let letterNodeName = "letter_"
let letterNodeColRow = "letter_%d_%d"

let remoteWordListSite = "http://www.wrdlnk.com/wlva01a/api/data/wlink_default.json"

let backgroundNodePath = "//world/backgroundNode"
let titleNodePath = "//world/top"
let statNodePath = "//world/stat"
let meaningNodePath = "//world/meaning"
let graphNodePath = "//world/change"
let settingsNodePath = "//world/config"

let soundNodePath = "//world/switches/sound"
let scoreNodePath = "//world/switches/score"
let timerNodePath = "//world/switches/timer"

let nightModeNodePath = "//world/switches/mode"
let pastelNodePath = "//world/switches/pastel"
let colorBlindNodePath = "//world/switches/colorblind"

let purchaseOneNodePath = "//world/switches/purchaseOne"
let purchaseTwoNodePath = "//world/switches/purchaseTwo"
let purchaseThreeNodePath = "//world/switches/purchaseThree"

let enterNodePath = "//world/enter"

let startNodePath = "//world/switches/start"
let continueNodePath = "//world/switches/continue"
let settingsMainNodePath = "//world/switches/settings"
let awardNodePath = "//world/switches/award"
let purchaseNodePath = "//world/switches/purchase"

let statHighScoreNodePath = "//world/stat/highScore"
let statScoreNodePath = "//world/stat/score"
let statTimerNodePath = "//world/stat/timer"

let awardCountNodePath = "//world/award"
let awardDescriptionLabelNodePath = "//world/top/levelDescription"
let accuracyGoldCountNodePath = "//world/award/accuracy/accuracyGoldCount"
let accuracySilverCountNodePath = "//world/award/accuracy/accuracySilverCount"
let accuracyBronzeCountNodePath = "//world/award/accuracy/accuracyBronzeCount"

let timeGoldCountNodePath = "//world/award/time/timeGoldCount"
let timeSilverCountNodePath = "//world/award/time/timeSilverCount"
let timeBronzeCountNodePath = "//world/award/time/timeBronzeCount"
let timeSpeedGoldMultiple = 1.1
let timeSpeedSilverMultiple = 1.5
let timeSpeedBronzeMultiple = 2.0

let commonDelaySetting = 0.5

let focusRingName = "focusRing"

let preferenceWordListKey = "preference_wordlist_index"
let preferenceWordListShuffledKey = "preference_wordlist_shuffled"
let preferenceShowGraphKey = "preference_graph"
let preferenceGameStatKey = "preference_game_stat"
let preferenceGameTextDescriptionKey = "preference_game_text_description"

let preferenceSoundEnabledKey = "preference_sound_enabled"
let preferenceScoreEnabledKey = "preference_score_enabled"
let preferenceTimerEnabledKey = "preference_timer_enabled"

let preferenceNightModeEnabledKey = "preference_night_mode_enabled"
let preferencePastelEnabledKey = "preference_pastel_enabled"
let preferenceColorBlindEnabledKey = "preference_color_blind_enabled"

let preferencePurchaseDescriptionEnabledKey = "preference_purchase_description_enabled"
let preferencePurchaseOneEnabledKey = "preference_purchase_one_enabled"
let preferencePurchaseTwoEnabledKey = "preference_purchase_two_enabled"
let preferencePurchaseThreeEnabledKey = "preference_purchase_three_enabled"

let preferenceContinueGameEnabledKey = "preference_continue_game_enabled"
let preferenceStartGameEnabledKey = "preference_start_game_enabled"
let preferenceSettingsMainEnabledKey = "preference_settings_main_enabled"
let preferenceGameAwardEnabledKey = "preference_game_award_enabled"
let preferenceInAppPurchaseEnabledKey = "preference_inapp_purchase_enabled"
let preferenceInstructionsEnabledKey = "preference_instructions_enabled"

let preferenceCurrentScoreKey = "preference_current_score"
let preferenceHighScoreKey = "preference_high_score"

let preferenceGameTimeKey = "preference_game_time"

let preferenceRemoteDataSiteKey = "preference_remote_data_site"

let preferenceMemoryDataFileKey = "preference_memory_data_file"

let awardDescriptionPrefixDefaultString = "with default: "
let awardDescriptionPrefixString = "with group: "
let awardDescriptionFormat = "%@%@"
let preferenceAwardDescriptionInfoKey = "preference_award_description_info"

let preferenceAccuracyLowerBoundDataKey = "preference_accuracy_lower_bound_data"
let preferenceTimeLowerBoundDataKey = "preference_time_lower_bound_data"

let preferenceAccuracyGoldCountKey = "preference_accuracy_gold_count"
let preferenceAccuracySilverCountKey = "preference_accuracy_silver_count"
let preferenceAccuracyBronzeCountKey = "preference_accuracy_bronze_count"

let preferenceTimeGoldCountKey = "preference_time_gold_count"
let preferenceTimeSilverCountKey = "preference_time_silver_count"
let preferenceTimeBronzeCountKey = "preference_time_bronze_count"

let minClickToSeeDefinition = 100

let matchLetterValue = 2
let maxMatchingTimeSec = 180

let grayTile = UIColor(colorLiteralRed: 192 / 255, green: 192 / 255, blue: 192 / 255, alpha: 1)
let blueTile = UIColor(colorLiteralRed: 77 / 255, green: 146 / 255, blue: 223 / 255, alpha: 1)
let yellowTile = UIColor(colorLiteralRed: 241 / 255, green: 224 / 255, blue: 95 / 255, alpha: 1)
let greenTileOld = UIColor(colorLiteralRed: 129 / 255, green: 209 / 255, blue: 53 / 255, alpha: 1)
let greenTile = UIColor(colorLiteralRed: 182 / 255, green: 220 / 255, blue: 138 / 255, alpha: 1)
let redTile = UIColor(colorLiteralRed: 252 / 255, green: 13 / 255, blue: 27 / 255, alpha: 1)

// Mode colors
let grayCanvas = UIColor(colorLiteralRed: 230 / 255, green: 230 / 255, blue: 230 / 255, alpha: 1)
let whiteCanvas = UIColor(colorLiteralRed: 255 / 255, green: 255 / 255, blue: 255 / 255, alpha: 1)

struct viewNode {
    let name: String
    let node: SKNode
    let visible: Bool
}

// MARK:- Enums
enum ViewElement:String {
    case titleImage = "titleImage"
    case main = "main"
    case board = "board"
    case control = "control"
    case buttons = "buttons"
    case footer = "footer"
    case meaning = "meaning"
    case change = "change"
    case prefixMeaning = "prefixMeaning"
    case linkMeaning = "linkMeaning"
    case suffixMeaning = "suffixMeaning"
    case graph = "graph"
    case progressGraph = "progressGraph"
    
    case switches = "switches"
    case sound = "sound"
    case soundSwitch = "SoundSwitch"
    case score = "score"
    case scoreSwitch = "ScoreSwitch"
    case timer = "timer"
    case timerSwitch = "TimerSwitch"
    case mode = "mode"
    case nightModeSwitch = "NightModeSwitch"
    case pastel = "pastel"
    case pastelSwitch = "PastelSwitch"
    case colorblind = "colorblind"
    case colorBlindSwitch = "ColorBlindSwitch"
    case enter = "enter"
    case enterGame = "EnterGame"
    
    
    case start = "start"
    case startNewGame = "StartNewGame"
    case continueTag = "continue"
    case continueGame = "ContinueGame"
    case settings = "settings"
    case gameSettings = "GameSettings"
    case purchase = "purchase"
    case inAppPurchase = "InAppPurchase"
    case guide = "guide"
    case instructions = "Instructions"
    case award = "award"
    case gameAward = "GameAward"
    case accuracy = "accuracy"
    case time = "time"
    
    case purchaseOne = "purchaseOne"
    case purchaseOneSwitch = "PurchaseOneSwitch"
    case purchaseTwo = "purchaseTwo"
    case purchaseTwoSwitch = "PurchaseTwoSwitch"
    case purchaseThree = "purchaseThree"
    case purchaseThreeSwitch = "PurchaseThreeSwitch"
    
    
    case awardDetail = "awardDetail"
    
    static let types = [ titleImage, main, board, control, buttons, footer,
                         meaning, change,
                         prefixMeaning, linkMeaning, suffixMeaning,
                         graph, progressGraph,
                         switches,
                         sound,         soundSwitch,
                         score,         scoreSwitch,
                         timer,         timerSwitch,
                         mode,          nightModeSwitch,
                         pastel,        pastelSwitch,
                         colorblind,    colorBlindSwitch,
                         enter,         enterGame,
                         
                         start,         startNewGame,
                         continueTag,   continueGame,
                         settings,      gameSettings,
                         award,         gameAward,
                         accuracy,      time,
                         purchase,      inAppPurchase,
                         guide,         instructions,
                         
                         purchaseOne,   purchaseOneSwitch,
                         purchaseTwo,   purchaseTwoSwitch,
                         purchaseThree,   purchaseThreeSwitch,
                         awardDetail
                        ]
}

enum TileElement:String {
    case grayTile = "gray_tile"
    case blueTile = "blue_tile"
    case yellowTile = "yellow_tile"
    case greenTile = "green_tile"
    case redTile = "red_tile"
    
    static let types = [grayTile, blueTile, yellowTile, greenTile, redTile]
}

enum VowelCharacter: Character {
    case A = "A"
    case E = "E"
    case I = "I"
    case O = "O"
    case U = "U"
    case Y = "Y"
    
    static let types = [A, E, I, O, U, Y]
}

let TileColor = [grayTile, blueTile, yellowTile, greenTile, redTile]

// TileMap cell (0,0) in lower left hand corner
enum VowelRow: Int {
    case prefix = 4
    case link = 2
    case suffix = 0
    
    static let types = [prefix, link, suffix]
}

enum SoundEvent:String {
    case awake = "awake"
    case beep = "beep"
    case beepbeep = "beepbeep"
    case bang = "bang"
    case biff = "biff"
    case yes = "yes"
    case no = "no"
    case error = "error"
    case warning = "warning"
    case great = "great"
    case good = "good"
    case again = "again"
    case end = "end"
    case upgrade = "upgrade"
    
    static let types = [awake, beep, beepbeep, bang, biff, yes, no, error,
                        warning, great, good, again,
                        end, upgrade]
}

// MARK:- Structs
struct VowelData {
    let id : Int
    var count : Int = 0
}

protocol VowelCountData {
    static var prefix: VowelData { get set }
    static var link: VowelData { get set }
    static var suffix: VowelData { get set }
}

let phraseSeparator = "|"

struct VowelCount {
    let phrase: String
    var prefix: VowelData
    var link: VowelData
    var suffix: VowelData
    let total: Int
    var clicks: Int = 0
    var boardTileClick: Int = 0
    var match: Int = 0
    var setTotal: Int = 0
    let minimumClicks: Int
    let clickMultiple = 2
    
    init (phrase: String = "_unset_", prefix: Int = 0, link: Int = 0, suffix: Int = 0) {
        self.phrase = phrase
        self.prefix = VowelData(id: 1, count: prefix)
        self.link  = VowelData(id: 2, count: link)
        self.suffix  = VowelData(id: 3, count: suffix)
        self.total = prefix + link + suffix
        self.minimumClicks = (prefix + link + suffix) * clickMultiple
    }
    
    func wordphrase() -> String {
        return phrase
    }
    
    func prefixZero() -> Bool {
        return prefix.count == 0 ? true : false
    }
    
    func linkZero() -> Bool {
        return link.count == 0 ? true : false
    }
    
    func suffixZero() -> Bool {
        return suffix.count == 0 ? true : false
    }
    
    func totalZero() -> Bool {
        return prefixZero() && linkZero() && suffixZero()
    }
    
    func matchComplete() -> Bool {
        return match == total
    }
    
    func totalMatches() -> Int {
        return total
    }
    
    func totalClicks() -> Int {
        return clicks
    }
    
    func totalBoardTileClicks() -> Int {
        return boardTileClick
    }
    
    func minClicks() -> Int {
        return minimumClicks
    }
    
    mutating func prefixDecrement() {
        if !prefixZero() {
            prefix.count -= 1
        }
    }
    
    mutating func linkDecrement() {
        if !linkZero() {
            link.count -= 1
        }
    }
    
    mutating func suffixDecrement() {
        if !suffixZero() {
            suffix.count -= 1
        }
    }
    
    mutating func clickAttempt() {
        clicks += 1
    }
    
    mutating func boardClickAttempt() {
        boardTileClick += 1
    }
    
    mutating func clickMatch() {
        if match < total {
            match += 1
        }
    }
    
    func accuracy() -> Float {
        print("total: \(total)")
        print("minimumClicks: \(minimumClicks)")
        print("clicks: \(clicks)")
        return Float(clicks > 0 ? Float(minClicks()) / Float(totalClicks()) : 0)
    }
    
   func percentage() -> Float {
        return accuracy() * Float(100)
    }
}

class Stat: NSObject, NSCoding {
    
    struct Keys {
        static let phrase = "phrase"
        static let minimum = "minimum"
        static let accuracy = "accuracy"
        static let percentage = "percentage"
        static let timeSpan = "timeSpan"
    }
    
    private var _phrase: String? = ""
    private var _accuracy: Float = 0
    private var _minimum: Int = 0
    private var _percentage: Float = 0
    private var _timeSpan: TimeInterval = 0
    
    override init() {}
    
    init(phrase: String?, accuracy: Float, minimum: Int, percentage: Float, timeSpan: TimeInterval = 0) {
        self._phrase = phrase
        self._accuracy = accuracy
        self._minimum = minimum
        self._percentage = percentage
        self._timeSpan = timeSpan
    }
    
    required convenience init(coder decoder: NSCoder) {
        // Retrieve data
        self.init()
        _phrase = decoder.decodeObject(forKey: Keys.phrase) as? String
        _accuracy = decoder.decodeFloat(forKey: Keys.accuracy)
        _minimum = decoder.decodeInteger(forKey: Keys.minimum)
        _percentage = decoder.decodeFloat(forKey: Keys.percentage)
        _timeSpan = decoder.decodeDouble(forKey: Keys.timeSpan)
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(_phrase, forKey: "phrase")
        coder.encode(_accuracy, forKey: "accuracy")
        coder.encode(_minimum, forKey: "minimum")
        coder.encode(_percentage, forKey: "percentage")
        coder.encode(_timeSpan, forKey: "timeSpan")
    }
    
    
    var phrase: String? {
        get {
            return _phrase
        }
        set {
            _phrase = newValue
        }
    }
    
    var accuracy: Float {
        get {
            return _accuracy
        }
        set {
            _accuracy = newValue
        }
    }
    
    var minimum: Int {
        get {
            return _minimum
        }
        set {
            _minimum = newValue
        }
    }

    var percentage: Float {
        get {
            return _percentage
        }
        set {
            _percentage = newValue
        }
    }

    var timeSpan: TimeInterval {
        get {
            return _timeSpan
        }
        set {
            _timeSpan = newValue
        }
    }
}

public struct Queue<T>: ExpressibleByArrayLiteral {
    public private(set) var elements: Array<T> = []
    public mutating func push(value: T) { elements.append(value) }
    public mutating func pop() -> T { return elements.removeFirst() }
    public var isEmpty: Bool { return elements.isEmpty }
    public var isThreshold: Bool { return elements.count > VisibleStateCount }
    public var count: Int { return elements.count }
    public init(arrayLiteral elements: T...) { self.elements = elements }
}

struct StatData {
    
    fileprivate struct info {
        static var statQueue = Queue<Stat>()
    }
    
    static let sharedInstance = StatData()
    private init() {
        if debugInfo {
            self.purge()
        }
        
        if AppDefinition.defaults.keyExist(key: preferenceGameStatKey) {
            let decoded  = AppDefinition.defaults.object(forKey: preferenceGameStatKey) as! Data
            let decodedStats = NSKeyedUnarchiver.unarchiveObject(with: decoded) as! [Stat]
            for stat in decodedStats {
                print("reloaded phrase: \(String(describing: stat.phrase))")
                self.push(element: Stat(phrase: stat.phrase, accuracy: stat.accuracy, minimum: stat.minimum, percentage: stat.percentage, timeSpan: stat.timeSpan))
            }
        }
    }
}

extension StatData {
    
    func isEmpty() -> Bool {
        return info.statQueue.elements.count == 0
    }
    
    func count() -> Int {
       return info.statQueue.count
    }
    
    func elements() -> [Stat] {
        return info.statQueue.elements
    }
    
    func push(element: Stat) {
        prune()
        unique()
        info.statQueue.push(value: element)
    }
    
    func pop() -> Stat? {
        return info.statQueue.pop()
    }
    
    func prune() {
        while info.statQueue.isThreshold {
            _ = pop()
        }
    }
    
    func purge() {
        while !isEmpty() {
            _ = pop()
        }
    }
    
    func unique() {
        print("To implement unique() method.")
    }

}
