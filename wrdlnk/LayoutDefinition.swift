//
//  LayoutDefinition.swift
//  wrdlnk
//
//  Created by sparkle on 11/4/17.
//  Copyright © 2017 teknowsys. All rights reserved.
//
import SpriteKit

struct BoardTileParam {
    let textureName = "pdf/tile"
    let textureBlueRedName = "pdf/tile_blue_red"
    let textureGreenRedName = "pdf/tile_green_red"
    let textureBlueBlackName = "pdf/tile_blue_black"
    let textureGreenBlackName = "pdf/tile_green_black"
    
    let boardTileNameTemplate = "board_tile_%@_%@"
    let boardLetterNameTemplate = "board_letter_%@"
    var row: Int!
    var column: Int!
    var position: CGPoint!
    var xPosAdjustment: CGFloat!
    var zPosition: CGFloat!
    var tileWidth: CGFloat!
    var tileHeight: CGFloat!
    var currentWord: String!
    var currentIndex: Int!
    var fontSize: CGFloat!
    var fontName: String!
    var fontColor: UIColor!
    
    init() {}
    
    init(row: Int, column :Int, position: CGPoint,
         xPosAdjustment: CGFloat, zPosition: CGFloat,
         tileWidth: CGFloat, tileHeight: CGFloat,
         currentWord: String, currentIndex: Int,
         fontSize: CGFloat, fontName: String = UIFont.systemFont(ofSize: 32).fontName, fontColor: UIColor = .red) {
        self.row = row
        self.column = column
        self.position = position
        self.xPosAdjustment = xPosAdjustment
        self.zPosition = zPosition
        self.tileWidth = tileWidth
        self.tileHeight = tileHeight
        self.currentWord = currentWord
        self.currentIndex = currentIndex
        
        self.fontSize = fontSize
        self.fontName = fontName
        self.fontColor = fontColor
    }
}

// Ratios based on iPhone 8 Plus with:
// Width = 414 and Height = 736
struct LayoutRatio {
    
    let defaultScreenWidth = CGFloat(414.0)
    let defaultScreenHeight = CGFloat(736.0)
    let screenWidth = CGFloat(UIScreen.main.bounds.width)
    let screenHeight = CGFloat(UIScreen.main.bounds.height)
    
    let currentWidthScaleFactor = CGFloat(UIScreen.main.bounds.width / 414.0)
    let currentHeightScaleFactor = CGFloat(UIScreen.main.bounds.height / 736.0)
    
    let defaultFontSize = CGFloat(26.0)
    
    // For mark
    let markName = "mark"
    let markWidthScale = CGFloat(0.157)
    let markHeightScale = CGFloat(0.08152)
    let markXAnchorPoint = CGFloat(0.5)
    let markYAnchorPoint = CGFloat(1.0)
    // mark has anchorPoint = CGPoint(x: 0.5, y: 1.0)
    let markPositionSizeHeightFromTop = CGFloat(0.4185)
    let markPositionSizeWidth = CGFloat(0.0)
    let markZPosition = CGFloat(10.0)
    
    // base has anchorPoint = CGPoint(x: 0.5, y: 1.0)
    let baseName = "base"
    let baseXAnchorPoint = CGFloat(0.5)
    let baseYAnchorPoiint = CGFloat(1.0)
    let baseScaleWidth = CGFloat(0.7874)
    let baseScaleHeight = CGFloat(0.581)
    let baseScaleHeightLarge = CGFloat(0.8581)
    let baseScaleHeightWithSixRows = CGFloat(0.5042)
    let basePositionSizeWidth = CGFloat(0.0)
    let basePositionSizeHeight = CGFloat(0.2962)
    let baseZPosition = CGFloat(0.0)
    
    // layout of label in base container
    // where xadjust = base.frame.minX + base.frame.width * 0.1074
    let labelNodeHorizontalIndent = CGFloat(0.1074)
    // where mark.position.y + size.height * -0.1712
    let labelNodeVerticalIndent = CGFloat(0.1712)
    
    // Distance between horizontal labels
    let labelVerticalSpacing = CGFloat(0.0747)
    
    // Enter (chevron-down) button
    let enterButtonXPosition = CGFloat(0.0)
    // where yPos = base.frame.minY + size.height * -0.0747
    let enterButtonVerticalFromMinBase = CGFloat(0.0747)
    
    // Setting scene
    let settingIndentFromTopEdgeToBase = CGFloat(0.201)
    let settingIndentToFirstRowFromTopIndent = CGFloat(0.2527)
    let settingFromBaseTopToFirstRowTop = CGFloat(0.0516)
    
    // For GameScene
    let indentFromTopEdgeFirstBoardRow = CGFloat(0.3043)
    let tileWidthToScreen = CGFloat(0.1111)
    let tileHeightToScreen = CGFloat(0.0625)
    let spaceBetweenInnerTileInRow = CGFloat(0.012)
    let markTopFirstRowInScreen = CGFloat(0.1957)
    let spaceBetweenRowsInScreen = CGFloat(0.1182)
    let spaceBetweenLastBoardRowAndButtonsInScreen = CGFloat(0.2038)
    let indentToFirstBoardTile = CGFloat(0.0628)
    let indentToFirstButtonTile = CGFloat(0.1739)
    let indentToCenterOfFirstButtonTile = CGFloat(0.2198)
    let indentFromTopEdgeToCenterOfButton = CGFloat(0.8003)
    let indentFromLeftEdgeLowerButton = CGFloat(0.082)
    let textSizeToTileHeight = CGFloat(0.5714)
    let xAnchor = CGFloat(0.5)
    let yAnchor = CGFloat(0.5)
    let numberOfVowels = Int(6)
    
    // GameScene GameSettings and ShowGraph button
    let indentForGameButtonFromSideEdge = CGFloat(0.1159)
    let indentForGameButtonFromTopEdge = CGFloat(0.9334)
    let buttonSettingsWidthScale = CGFloat(0.0628)
    let buttonSettingsHeightScale = CGFloat(0.0353)
    let buttonGraphWidthScale = CGFloat(0.0628)
    let buttonGraphHeightScale = CGFloat(0.0353)
    
    let overalyDismissButtonFrontButtonEdge = CGFloat(0.1196)
    
    // Game Scene Score counter and Timer display
    let gameScoreName="gamescore"
    let indentForScoreLabelFromLeftSideEdge = CGFloat(0.16908)
    let indentForScoreLabelFromTopEdge = CGFloat(0.2038)
    
    let gameTimerName="gametimer"
    let indentForTimerLabelFromRightSideEdge = CGFloat(0.3019)
    let indentForTimerLabelFromTopEdge = CGFloat(0.2038)
    
    // Award Screen
    
    // Distance between horizontal labels
    let labelAwardVerticalSpacing = CGFloat(0.085)
    
    // Login Screen
    let viewCornerRadius = CGFloat(4.0)
    
    let errorLabelFontSize = CGFloat(14.0)
    
    let wrdlnkLabelFontSize = CGFloat(25.0)
    
    let guestButtonFontSize = CGFloat(16.0)
    
    let emailLabelFontSize = CGFloat(13.0)
    
    let emailTextFontSize = CGFloat(14.0)
    
    let passwordLabelFontSize = CGFloat(13.0)
    
    let passwordTextFontSize = CGFloat(14.0)
    
    let errorLabelHeight = CGFloat(20.0) * CGFloat(UIScreen.main.bounds.height / 736.0)
    
    let loginMarkTopAnchorErrorView = CGFloat(40.0) * CGFloat(UIScreen.main.bounds.height / 736.0)
    
    let loginMarkWidthAnchor = CGFloat(87.0) * CGFloat(UIScreen.main.bounds.width / 414.0)
    
    let loginMarkHeightAnchor = CGFloat(80.0) * CGFloat(UIScreen.main.bounds.height / 736.0)
    
    let loginWrdlnkLabelTopAnchor = CGFloat(115.0) * CGFloat(UIScreen.main.bounds.height / 736.0)
    
    let loginWrdlnkLabelWidthAnchor = CGFloat(126.0) * CGFloat(UIScreen.main.bounds.width / 414.0)
    
    let loginWrdlnkLabelHeightAnchor = CGFloat(25.0)  * CGFloat(UIScreen.main.bounds.height / 736.0)
    
    let loginEmailLabelTopAnchor = CGFloat(2.0)
    
    let loginEmailLabelWidthAnchor = CGFloat(120.0) * CGFloat(UIScreen.main.bounds.width / 414.0)
    
    let loginEmailLabelHeightAnchor = CGFloat(20.0)  * CGFloat(UIScreen.main.bounds.height / 736.0)
    
    let loginEmailTextTopAnchor = CGFloat(25.0)  * CGFloat(UIScreen.main.bounds.height / 736.0)
    
    let loginEmailTextWidthAnchor = CGFloat(360.0) * CGFloat(UIScreen.main.bounds.width / 414.0)
    
    let loginEmailTextHeightAnchor = CGFloat(20.0)  * CGFloat(UIScreen.main.bounds.height / 736.0)
    
    let loginSeparatorEmailLabelTopAnchor = CGFloat(58.0) * CGFloat(UIScreen.main.bounds.height / 736.0)
    
    let loginSeparatorEmailLabelWidthAnchor = CGFloat(-96.0) * CGFloat(UIScreen.main.bounds.width / 414.0)
    
    let loginSeparatorEmailLabelHeightAnchor = CGFloat(1.0)  * CGFloat(UIScreen.main.bounds.height / 736.0)
    
    let loginPasswordLabelTopAnchor = CGFloat(92.0)  * CGFloat(UIScreen.main.bounds.height / 736.0)
    
    let loginPasswordLabelWidthAnchor = CGFloat(300.0) * CGFloat(UIScreen.main.bounds.width / 414.0)
    
    let loginPasswordLabelHeightAnchor = CGFloat(13.0)  * CGFloat(UIScreen.main.bounds.height / 736.0)
    
    let loginPasswordTextTopAnchor = CGFloat(123.0)  * CGFloat(UIScreen.main.bounds.height / 736.0)
    
    let loginPasswordTextWidthAnchor = CGFloat(162.0) * CGFloat(UIScreen.main.bounds.width / 414.0)
    
    let loginPasswordTextHeightAnchor = CGFloat(14.0)  * CGFloat(UIScreen.main.bounds.height / 736.0)
    
    let loginSeparatorPasswordLabelTopAnchor = CGFloat(148.0) * CGFloat(UIScreen.main.bounds.height / 736.0)
    
    let loginSeparatorPasswordLabelWidthAnchor = CGFloat(-96.0) * CGFloat(UIScreen.main.bounds.width / 414.0)
    
    let loginSeparatorPasswordLabelHeightAnchor = CGFloat(1.0) * CGFloat(UIScreen.main.bounds.height / 736.0)
    
    let loginContainerViewTopAnchor = CGFloat(308.0) * CGFloat(UIScreen.main.bounds.height / 736.0)
    
    let loginContainerViewWidthAnchor = CGFloat(-96.0) * CGFloat(UIScreen.main.bounds.width / 414.0)
    
    let loginContainerViewHeightAnchor = CGFloat(150.0) * CGFloat(UIScreen.main.bounds.height / 736.0)
    
    let loginYesViewTopAnchor = CGFloat(52.0)  * CGFloat(UIScreen.main.bounds.height / 736.0)
    
    let loginYesViewWidthAnchor = CGFloat(46.0) * CGFloat(UIScreen.main.bounds.width / 414.0)
    
    let loginYesViewHeightAnchor = CGFloat(46.0)  * CGFloat(UIScreen.main.bounds.height / 736.0)
    
    let loginBackgroundViewTopAnchor = CGFloat(100.0) * CGFloat(UIScreen.main.bounds.height / 736.0)
    
    let loginBackgroundViewWidthAnchor = CGFloat(-60.0) * CGFloat(UIScreen.main.bounds.width / 414.0)
    
    let loginBackgroundViewHeightAnchor = CGFloat(0.8)  * CGFloat(UIScreen.main.bounds.height / 736.0)
    
    let loginGoogleViewTopAnchor = CGFloat(52.0) * CGFloat(UIScreen.main.bounds.height / 736.0)
    
    let loginGoogleViewWidthAnchor = CGFloat(46.0) * CGFloat(UIScreen.main.bounds.width / 414.0)
    
    let loginGoogleViewHeightAnchor = CGFloat(46.0) * CGFloat(UIScreen.main.bounds.height / 736.0)
    
    let loginGoogleButtonWidthAnchor = CGFloat(-184.0) * CGFloat(UIScreen.main.bounds.width / 414.0)
    
    let loginGoogleButtonHeightAnchor = CGFloat(24.0)  * CGFloat(UIScreen.main.bounds.height / 736.0)
    
    let loginViewErrorHeightRatio = CGFloat(0.081522)
    
    let loginViewHeightRatio = CGFloat(0.179348)
    
    // Overlay graph scene
    let graphTopIndentSize = CGFloat(0.201)
    
    let graphLeftOrRightIndent = CGFloat(0.10386)
    
    let graphTopWidthIndent = CGFloat(0.2126)
    
    let graphWidthSize = CGFloat(0.7899)
    
    let graphHeightSize = CGFloat(0.5679)
    
    let graphTopHeightIndent = CGFloat(0.4334)
    
    let graphBottomHeightIndent = CGFloat(0.23097)
    
    let graphCornerRadius = CGFloat(12.0) *
        CGFloat(UIScreen.main.bounds.height / 736.0)
    
    // Overlay setting scene
    let settingTopIndentSize = CGFloat(0.2514)
}

var layoutRatio: LayoutRatio = LayoutRatio()

struct LayoutColor {
    let greenPinkTileFill = SKColor(hue: 0.463, saturation: 0.713, brightness: 0.82, alpha: 1)
    let greenPinkTileStroke = SKColor(hue: 0.009, saturation: 0.073, brightness: 0.973, alpha: 1)
    let bluePinkTileFill = SKColor(hue: 0.551, saturation: 0.465, brightness: 0.92, alpha: 1)
    let bluePinkTileStroke = SKColor(hue: 0.009, saturation: 0.073, brightness: 0.973, alpha: 1)
    let greenBlackTileFill = SKColor(hue: 0.463, saturation: 0.713, brightness: 0.82, alpha: 1)
    let greenBlackTileStroke = SKColor(hue: 0.573, saturation: 0.455, brightness: 0.216, alpha: 1)
    let blueBlackTileFill = SKColor(hue: 0.551, saturation: 0.465, brightness: 0.92, alpha: 1)
    let blueBlackTileStroke = SKColor(hue: 0.573, saturation: 0.455, brightness: 0.216, alpha: 1)
    let brandLight = SKColor(hue: 0.009, saturation: 0.073, brightness: 0.973, alpha: 1)
    let branddarkBlack = SKColor(hue: 0.573, saturation: 0.455, brightness: 0.216, alpha: 1)
    let brandDefault = SKColor(hue: 0.006, saturation: 0.5, brightness: 0.933, alpha: 1)
    let brandDark1 = SKColor(hue: 0.006, saturation: 0.5, brightness: 0.933, alpha: 1)
    let brandDark2 = SKColor(hue: 0.006, saturation: 0.504, brightness: 0.467, alpha: 1)
    let highlightDefault = SKColor(hue: 1.00, saturation: 1.00, brightness: 1.00, alpha: 1)
}

var layoutColor: LayoutColor = LayoutColor()

struct SceneNodeParam {
    var labelNode: SKLabelNode!
    var labelNodeName: String!
    var buttonNode: ButtonNode!
    var spriteNodeName: String!
    var position: CGPoint!
    var zposition: CGFloat
    var anchor: CGPoint!
    var frame: CGRect!
    var defaultTexture: String!
    var selectedTexture: String!
    var fontSize: CGFloat!
    
    init(labelNode: SKLabelNode, labelNodeName: String,
         buttonNode: ButtonNode, spriteNodeName: String,
         position: CGPoint, zposition: CGFloat = 10,
         anchor: CGPoint =  CGPoint(x: 0.5, y: 1.0), frame: CGRect,
         defaultTexture: String, selectedTexture: String, fontSize: CGFloat = 20.0) {
        self.labelNode = labelNode
        self.labelNodeName = labelNodeName
        self.buttonNode = buttonNode
        self.spriteNodeName = spriteNodeName
        self.position = position
        self.zposition = zposition
        self.anchor = anchor
        self.frame = frame
        self.defaultTexture = defaultTexture
        self.selectedTexture = selectedTexture
        self.fontSize = fontSize
    }
}

struct SceneSpriteLabelLabelParam {
    var spriteNode: SKSpriteNode!
    var spriteNodeName: String!
    var labelNode: SKLabelNode!
    var labelNodeName: String!
    var labelNode2: SKLabelNode!
    var labelNodeName2: String!
    var position: CGPoint!
    var zposition: CGFloat
    var anchor: CGPoint!
    var frame: CGRect!
    var fontSize: CGFloat!
    
    init(spriteNode: SKSpriteNode, spriteNodeName: String,
         labelNode: SKLabelNode, labelNodeName: String,
         labelNode2: SKLabelNode, labelNodeName2: String,
         position: CGPoint, zposition: CGFloat = 10,
         anchor: CGPoint =  CGPoint(x: 0.5, y: 0.75), frame: CGRect,
         fontSize: CGFloat = 20.0) {
        
        self.spriteNode = spriteNode
        self.spriteNodeName = spriteNodeName
        self.labelNode = labelNode
        self.labelNodeName = labelNodeName
        self.labelNode2 = labelNode2
        self.labelNodeName2 = labelNodeName2
        self.position = position
        self.zposition = zposition
        self.anchor = anchor
        self.frame = frame
        self.fontSize = fontSize
    }
}
struct SceneButtonParam {
    var buttonNode: ButtonNode!
    var spriteNodeName: String!
    var position: CGPoint!
    var zposition: CGFloat
    var anchor: CGPoint!
    var frame: CGRect!
    var defaultTexture: String!
    var selectedTexture: String!
    var fontSize: CGFloat!
    
    init(buttonNode: ButtonNode, spriteNodeName: String,
         position: CGPoint, zposition: CGFloat = 10,
         anchor: CGPoint =  CGPoint(x: 0.5, y: 1.0),
         defaultTexture: String, selectedTexture: String, fontSize: CGFloat = 26.0) {
        self.buttonNode = buttonNode
        self.spriteNodeName = spriteNodeName
        self.position = position
        self.zposition = zposition
        self.anchor = anchor
        self.defaultTexture = defaultTexture
        self.selectedTexture = selectedTexture
        self.fontSize = fontSize
    }
}

struct SceneLabelParam {
    var labelNode: SKLabelNode!
    var labelNodeName: String!
    var position: CGPoint!
    var zposition: CGFloat
    var fontSize: CGFloat!
    
    init(labelNode: SKLabelNode, labelNodeName: String, position: CGPoint, zposition: CGFloat = 10,
         fontSize: CGFloat = 20.0) {
        self.labelNode = labelNode
        self.labelNodeName = labelNodeName
        self.position = position
        self.zposition = zposition
        self.fontSize = fontSize
    }
}

struct GraphParam {
    var hundredPos: CGPoint!
    var zeroPos: CGPoint!
    var gridFrame: CGRect!
    
    let graphSpaceRatioOfGrid = CGFloat(0.1227)  * layoutRatio.currentWidthScaleFactor
    let graphWidthRatioOfGrid = CGFloat(0.0491)   * layoutRatio.currentWidthScaleFactor
    let maxGraphHeightRatioInGrid = CGFloat(0.735)
    let maxNumberOfGraphsInGrid = Int(( 1 / 0.1227) * layoutRatio.currentWidthScaleFactor) - 1
    let cornerRadiusRatioToWidth = CGFloat(0.25)
    
    init() {
        self.hundredPos = CGPoint()
        self.zeroPos = CGPoint()
        self.gridFrame = CGRect()
    }
    
    init(hundredPos: CGPoint, zeroPos: CGPoint, gridFrame: CGRect) {
        self.hundredPos = hundredPos
        self.zeroPos = zeroPos
        self.gridFrame = gridFrame
    }
}

extension BaseScene {
    func sceneNodeSetup(param: SceneNodeParam) {
        param.labelNode.name = param.labelNodeName
        param.labelNode.position = param.position
        param.labelNode.fontName = UIFont.systemFont(ofSize: param.fontSize).fontName
        param.labelNode.fontSize = param.fontSize * layoutRatio.currentHeightScaleFactor
        param.labelNode.verticalAlignmentMode = .top
        param.labelNode.horizontalAlignmentMode =  .left
        param.labelNode.zPosition = param.zposition
        self.addChild(param.labelNode)
        
        param.buttonNode.name = param.spriteNodeName
        param.buttonNode.defaultTexture = SKTexture(image: UIImage(named: param.defaultTexture)!)
        param.buttonNode.selectedTexture = SKTexture(image: UIImage(named: param.selectedTexture)!)
        
        param.buttonNode.buttonIdentifier = ButtonIdentifier(rawValue: param.spriteNodeName)
        param.buttonNode.position = CGPoint(x: param.labelNode.position.x + frame.maxY, y: 0)
        param.buttonNode.anchorPoint = param.anchor // CGPoint(x: 0.5, y: 1.0)
        param.buttonNode.zPosition = param.zposition // 10
        param.labelNode.addChild(param.buttonNode)
        
        let focusRing = SKSpriteNode(texture: SKTexture(image: UIImage(named: "pdf/focusRing")!))
        focusRing.scale(to: CGSize(width: param.buttonNode.size.width + 2.0, height: param.buttonNode.size.height + 2.0))
        focusRing.name = "focusRing"
        focusRing.anchorPoint = CGPoint(x: 0.5, y: 1.0)
        focusRing.zPosition = param.zposition
        focusRing.position = param.buttonNode.position
        param.buttonNode.addChild(focusRing)
    }
    
    func sceneButtonSetup(param: SceneButtonParam) {
        param.buttonNode.name = param.spriteNodeName
        param.buttonNode.defaultTexture = SKTexture(image: UIImage(named: param.defaultTexture)!)
        param.buttonNode.selectedTexture = SKTexture(image: UIImage(named: param.selectedTexture)!)
        param.buttonNode.buttonIdentifier = ButtonIdentifier(rawValue: param.spriteNodeName)
        param.buttonNode.position = param.position
        param.buttonNode.anchorPoint = param.anchor
        param.buttonNode.zPosition = param.zposition
        self.addChild(param.buttonNode)
        
        let focusRing = SKSpriteNode(texture: SKTexture(image: UIImage(named: "pdf/focusRing")!))
        focusRing.scale(to: CGSize(width: param.buttonNode.size.width + 2.0, height: param.buttonNode.size.height + 2.0))
        focusRing.name = "focusRing"
        focusRing.alpha = 0
        focusRing.position = param.position
        param.buttonNode.addChild(focusRing)
    }
    
    func sceneLabelSetup(param: SceneLabelParam) {
        param.labelNode.name = param.labelNodeName
        param.labelNode.position = param.position
        param.labelNode.fontName = UIFont.systemFont(ofSize: param.fontSize).fontName
        param.labelNode.fontSize = param.fontSize * layoutRatio.currentHeightScaleFactor
        param.labelNode.verticalAlignmentMode = .bottom
        param.labelNode.horizontalAlignmentMode =  .center
        param.labelNode.zPosition = param.zposition
        self.addChild(param.labelNode)
    }
    
    func sceneSpriteLabelLabelSetup(param: SceneSpriteLabelLabelParam) {
        param.spriteNode.name = param.spriteNodeName
        param.spriteNode.position = param.position
        param.spriteNode.anchorPoint = param.anchor // CGPoint(x: 0.5, y: 1.0)
        param.spriteNode.zPosition = param.zposition // 10
        self.addChild(param.spriteNode)
        
        param.labelNode.name = param.labelNodeName
        param.labelNode.position = CGPoint(x: param.spriteNode.position.x + param.frame.width * 0.6, y: 0)
        param.labelNode.fontName = UIFont.systemFont(ofSize: param.fontSize).fontName
        param.labelNode.fontSize = param.fontSize * layoutRatio.currentHeightScaleFactor
        param.labelNode.verticalAlignmentMode = .top
        param.labelNode.horizontalAlignmentMode =  .left
        param.labelNode.zPosition = param.zposition
        param.spriteNode.addChild(param.labelNode)
        
        param.labelNode2.name = param.labelNodeName2
        param.labelNode2.position = CGPoint(x: param.labelNode.position.x + param.frame.width * 0.25, y: 0)
        param.labelNode2.fontName = UIFont.systemFont(ofSize: param.fontSize).fontName
        param.labelNode2.fontSize = param.fontSize * layoutRatio.currentHeightScaleFactor
        param.labelNode2.verticalAlignmentMode = .top
        param.labelNode2.horizontalAlignmentMode =  .left
        param.labelNode2.zPosition = param.zposition
        param.labelNode.addChild(param.labelNode2)
        
    }
}
