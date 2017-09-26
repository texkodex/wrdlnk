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

// "SF Mono" or "Helvetica" or "Arial"
let fontName = "SF Pro Display Regular"

let defaultTileWidth: CGFloat = 42
let defaultTileHeight: CGFloat = 42
let defaultTileInnerWidth: CGFloat = 40.0
let defaultTileInnerHeight: CGFloat = 40.0

let tileWidth: CGFloat = 24
let tileHeight: CGFloat = 24

let tileWidthLess2: CGFloat = 22.0
let tileHeightLess2: CGFloat = 22.0

let VisibleStateCount = 6
let StatDataSize = 3000
let GameLevelTime = 20

let StorageForStatItem = "ItemStat"
let StorageForStatItemVC = "ItemStatVC"
let StorageForStatDataItem = "ItemStatData"
let StorageForLiveData = "LiveData"

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

let commonDelaySetting = 0.5

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

let whiteTile = UIColor(colorLiteralRed: 255 / 255, green: 255 / 255, blue: 255 / 255, alpha: 1)
let blackTile = UIColor(colorLiteralRed: 0 / 0, green: 0 / 255, blue: 0 / 255, alpha: 1)
let darkGrayTile = UIColor(colorLiteralRed: 255 / 255, green: 255 / 255, blue: 255 / 255, alpha: 0.333)
let lightGrayTile = UIColor(colorLiteralRed: 255 / 255, green: 255 / 255, blue: 255 / 255, alpha: 0.667)
let grayTile = UIColor(colorLiteralRed: 255 / 255, green: 255 / 255, blue: 255 / 255, alpha: 0.5)
let blueTile = UIColor(colorLiteralRed: 77 / 255, green: 146 / 255, blue: 223 / 255, alpha: 1)
let yellowTile = UIColor(colorLiteralRed: 241 / 255, green: 224 / 255, blue: 95 / 255, alpha: 1)
let greenTileOld = UIColor(colorLiteralRed: 129 / 255, green: 209 / 255, blue: 53 / 255, alpha: 1)
let greenTile = UIColor(colorLiteralRed: 182 / 255, green: 220 / 255, blue: 138 / 255, alpha: 1)
let redTile = UIColor(colorLiteralRed: 252 / 255, green: 13 / 255, blue: 27 / 255, alpha: 1)
let pastelForegroundTile = UIColor(colorLiteralRed: 255 / 255, green: 217 / 255, blue: 170 / 255, alpha: 1)
let pastelBackgroundTile = UIColor(colorLiteralRed: 252 / 255, green: 253 / 255, blue: 223 / 255, alpha: 1)
let pastelFontColor = UIColor(colorLiteralRed: 98 / 255, green: 184 / 255, blue: 165 / 255, alpha: 1)

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
    
    case action = "action"
    case proceedAction = "proceedAction"
    case actionYesSwitch = "ActionYesSwitch"
    case cancelAction = "cancelAction"
    case actionNoSwitch = "ActionNoSwitch"
    
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

