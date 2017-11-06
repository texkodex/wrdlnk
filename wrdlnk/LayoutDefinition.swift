//
//  LayoutDefinition.swift
//  wrdlnk
//
//  Created by sparkle on 11/4/17.
//  Copyright © 2017 teknowsys. All rights reserved.
//
import SpriteKit

// Ratios based on iPhone 8 Plus with:
// Width = 414 and Height = 736
struct LayoutRatio {
    
    let screenWidth = CGFloat(UIScreen.main.bounds.width)
    let screenHeight = CGFloat(UIScreen.main.bounds.height)
    
    // For mark
    let markName = "mark"
    let markWidthScale = CGFloat(0.157)
    let makeHeightScale = CGFloat(0.08152)
    let markXAnchorPoint = CGFloat(0.5)
    let markYAnchorPoiint = CGFloat(1.0)
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
    
    // For GameScene
    let indentFromTopEdgeFirstBoardRow = CGFloat(0.3043)
    let tileWidthToScreen = CGFloat(0.099)
    let tileHeightToScreen = CGFloat(0.0557)
    let spaceBetweenInnerTileInRow = CGFloat(0.00966)
    let markTopFirstRowInScreen = CGFloat(0.1957)
    let spaceBetweenRowsInScreen = CGFloat(0.1182)
    let spaceBetweenLastBoardRowAndButtonsInScreen = CGFloat(0.2038)
    let indentToFirstBoardTile = CGFloat(0.06039)
    let indentToFirstButtonTile = CGFloat(0.1691)
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
    let buttonGraphHeightScale = CGFloat(0.07)
}

var layoutRatio: LayoutRatio = LayoutRatio()

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
         defaultTexture: String, selectedTexture: String, fontSize: CGFloat = 20.0) {
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
    
    let graphSpaceRatioOfGrid = CGFloat(0.1227)
    let graphWidthRatioOfGrid = CGFloat(0.0491)
    let maxGraphHeightRatioInGrid = CGFloat(0.735)
    let maxNumberOfGraphsInGrid = Int( 1 / 0.1227) - 2
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
        param.labelNode.fontSize = param.fontSize
        param.labelNode.fontColor = foregroundColor
        param.labelNode.verticalAlignmentMode = .top
        param.labelNode.horizontalAlignmentMode =  .left
        param.labelNode.zPosition = param.zposition
        self.addChild(param.labelNode)
        
        param.buttonNode.name = param.spriteNodeName
        param.buttonNode.defaultTexture = SKTexture(imageNamed: param.defaultTexture)
        param.buttonNode.selectedTexture = SKTexture(imageNamed: param.selectedTexture)
        param.buttonNode.buttonIdentifier = ButtonIdentifier(rawValue: param.spriteNodeName)
        param.buttonNode.position = CGPoint(x: param.labelNode.position.x + frame.maxY, y: 0)
        param.buttonNode.anchorPoint = param.anchor // CGPoint(x: 0.5, y: 1.0)
        param.buttonNode.zPosition = param.zposition // 10
        param.labelNode.addChild(param.buttonNode)
        
        let focusRing = SKSpriteNode(texture: SKTexture(imageNamed: "focusRingRed"))
        focusRing.scale(to: CGSize(width: param.buttonNode.size.width + 2.0, height: param.buttonNode.size.height + 2.0))
        focusRing.name = "focusRing"
        focusRing.anchorPoint = CGPoint(x: 0.5, y: 1.0)
        focusRing.zPosition = param.zposition
        focusRing.position = param.buttonNode.position
        param.buttonNode.addChild(focusRing)
    }
    
    func sceneButtonSetup(param: SceneButtonParam) {
        param.buttonNode.name = param.spriteNodeName
        param.buttonNode.defaultTexture = SKTexture(imageNamed: param.defaultTexture)
        param.buttonNode.selectedTexture = SKTexture(imageNamed: param.selectedTexture)
        param.buttonNode.buttonIdentifier = ButtonIdentifier(rawValue: param.spriteNodeName)
        param.buttonNode.position = param.position
        param.buttonNode.anchorPoint = param.anchor
        param.buttonNode.zPosition = param.zposition
        self.addChild(param.buttonNode)
        
        let focusRing = SKSpriteNode(texture: SKTexture(imageNamed: "focusRingRed"))
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
        param.labelNode.fontSize = param.fontSize
        param.labelNode.fontColor = foregroundColor
        param.labelNode.verticalAlignmentMode = .bottom
        param.labelNode.horizontalAlignmentMode =  .center
        param.labelNode.zPosition = param.zposition
        self.addChild(param.labelNode)
    }
}
