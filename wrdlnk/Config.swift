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
    static let InitialLogin = "initialLogin"
    static let DefaultBackground = "BackgroundColor"
    static let WalkthroughContent = "WalkThrough"
    static let PlayNotification = "PlayNotification"
    static let FirebaseConfigFile = "GoogleService-firebase-Info"
}

enum StoryboardName : String {
    case Main = "Main"
    case Onboarding = "Onboarding"
}

// MARK:- Defines
let debugInfo = false

// "SF Mono" or "Helvetica" or "Arial"
let fontName = "SF Pro Display Regular"

let defaultTileWidth: CGFloat = 42
let defaultTileHeight: CGFloat = 42
let defaultTileInnerWidth: CGFloat = 40.0
let defaultTileInnerHeight: CGFloat = 40.0

let tileWidth: CGFloat = 28
let tileHeight: CGFloat = 28

let tileWidthLess2: CGFloat = 26.0
let tileHeightLess2: CGFloat = 26.0

let VisibleStateCount = 7
let StatDataSize = 5000
let GameLevelTime = 20

let MesssageDisplayThreshold = 0.85
let CommonDelaySetting = 0.7
let MinimumAwardLevelForSharing = 6

let StorageForStatItem = "ItemStat"
let StorageForCounters = "Counters"
let StorageForStatItemVC = "ItemStatVC"
let StorageForStatDataItem = "ItemStatData"
let StorageForLiveData = "LiveData"
let StorageForWordList = "wordlist"
let WordListKey = "wordListKey"


let buttonsTileMap = "buttons"
let boardTileMap = "board"
let tileNodeName = "tileNode_"
let tileNodeColRow = "tileNode_%d_%d"
let tileNodeNameColRow = "tileNode_%@_%d_%d"
let tileUserDataClickName = "clickable"
let letterNodeName = "letter_"
let letterNodeColRow = "letter_%d_%d"

let remoteWordListSite = "http:remote_site.json"

let backgroundNodePath = "//world/backgroundNode"
let titleNodePath = "//world/top"
let statNodePath = "//world/stat"
let boardNodePath = "//world/main/board"
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
let socialNodePath = "//world/award/social"
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

let overlayNodePath = "//world/action"
let overlayActionYesNodePath = "//world/action/proceedAction"
let overlayActionNoNodePath = "//world/action/cancelAction"

let focusRingName = "focusRing"

let preferenceWordListKey = "preference_wordlist_index"
let preferenceWordMatchKey = "preference_word_match_index"

let preferenceWordListShuffledKey = "preference_wordlist_shuffled"
let preferenceShowGraphKey = "preference_graph"
let preferenceGameStatKey = "preference_game_stat"
let preferenceGameTextDescriptionKey = "preference_game_text_description"

let preferenceSoundEnabledKey = "preference_sound_enabled"
let preferenceScoreEnabledKey = "preference_score_enabled"
let preferenceTimerEnabledKey = "preference_timer_enabled"
let preferenceSetTimerEnabledKey = "preference_set_timer_enabled"

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

let preferenceShareSocialEnabledKey = "preference_share_social_enabled"

let preferenceCurrentScoreKey = "preference_current_score"
let preferenceHighScoreKey = "preference_high_score"

let preferenceGameLevelTimeKey = "preference_game_level_time"

let preferenceStartTimeKey = "preference_start_time"

let preferenceRemoteDataSiteKey = "preference_remote_data_site"

let preferenceMemoryDataFileKey = "preference_memory_data_file"

let awardDescriptionPrefixDefaultString = "with default: "
let awardDescriptionPrefixString = "with group: "
let awardDescriptionFormat = "%@%@"
let preferenceAwardDescriptionInfoKey = "preference_award_description_info"

let preferenceAccuracyLowerBoundDataKey = "preference_accuracy_lower_bound_data"
let preferenceTimeLowerBoundDataKey = "preference_time_lower_bound_data"

let preferenceMaxNumberOfDataPlaysKey = "preference_max_number_of_data_plays"
let preferenceCurrentNumberOfDataPlaysKey = "preference_current_number_of_data_plays"

let MaxNumberOfDataPlays = 4

let preferenceAccuracyGoldCountKey = "preference_accuracy_gold_count"
let preferenceAccuracySilverCountKey = "preference_accuracy_silver_count"
let preferenceAccuracyBronzeCountKey = "preference_accuracy_bronze_count"

let preferenceTimeGoldCountKey = "preference_time_gold_count"
let preferenceTimeSilverCountKey = "preference_time_silver_count"
let preferenceTimeBronzeCountKey = "preference_time_bronze_count"

let preferenceOverlayActionYesKey = "preference_overlay_action_yes"

let preferenceOverlayActionNoKey = "preference_overlay_action_no"

let minClickToSeeDefinition = 100

let matchLetterValue = 2
let maxMatchingTimeSec = 180

let whiteTile = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
let blackTile = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
let darkGrayTile = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
let lightGrayTile = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
let grayTile = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
let blueTile = #colorLiteral(red: 0.3019607843, green: 0.5725490196, blue: 0.8745098039, alpha: 1)
let yellowTile = #colorLiteral(red: 0.9450980392, green: 0.8784313725, blue: 0.3725490196, alpha: 1)
let greenTileOld = #colorLiteral(red: 0.5058823529, green: 0.8196078431, blue: 0.2078431373, alpha: 1)
let greenTile = #colorLiteral(red: 0.7137254902, green: 0.862745098, blue: 0.5411764706, alpha: 1)
let redTile = #colorLiteral(red: 0.9882352941, green: 0.05098039216, blue: 0.1058823529, alpha: 1)
let pastelForegroundTile = #colorLiteral(red: 1, green: 0.8509803922, blue: 0.6666666667, alpha: 1)
let pastelBackgroundTile = #colorLiteral(red: 0.9882352941, green: 0.9921568627, blue: 0.8745098039, alpha: 1)
let pastelFontColor = #colorLiteral(red: 0.368627451, green: 0.7215686275, blue: 0.6470588235, alpha: 1)
let pastelFontColor2 = #colorLiteral(red: 0.8392156863, green: 0.8705882353, blue: 1, alpha: 1)

// Mode colors
let grayCanvas = #colorLiteral(red: 0.9019607843, green: 0.9019607843, blue: 0.9019607843, alpha: 1)
let whiteCanvas = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)

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
    
    case action = "action"
    case proceedAction = "proceedAction"
    case actionYesSwitch = "ActionYesSwitch"
    case cancelAction = "cancelAction"
    case actionNoSwitch = "ActionNoSwitch"
    
    case social = "social"
    case shareSwitch = "ShareSwitch"
    
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
                         awardDetail,
                         
                         action,
                         proceedAction, actionYesSwitch,
                         cancelAction, actionNoSwitch,
                         shareSwitch,
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

let TileColor = [ whiteTile, blackTile, darkGrayTile, lightGrayTile, grayTile, blueTile, yellowTile, greenTile, redTile]

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
    case great2 = "great2"
    case good = "good"
    case again = "again"
    case end = "end"
    case upgrade = "upgrade"
    
    static let types = [awake, beep, beepbeep, bang, biff, yes, no, error,
                        warning, great, great2, good, again,
                        end, upgrade]
}

