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
    // For mark
    let markName = "mark"
    let markScaleWidth = CGFloat(65.0)
    let makeScaleHeight = CGFloat(60.0)
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
    let baseScaleHeight = CGFloat(0.5652)
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
}

var layoutRatio: LayoutRatio = LayoutRatio()

struct SceneNodeParam {
    var labelNode: SKLabelNode!
    var labelNodeName: String!
    var buttonNode: ButtonNode!
    var spriteNodeName: String!
    var position: CGPoint!
    var frame: CGRect!
    var defaultTexture: String!
    var selectedTexture: String!
    var fontSize: CGFloat!
    
    init(labelNode: SKLabelNode, labelNodeName: String,
         buttonNode: ButtonNode, spriteNodeName: String,
         position: CGPoint, frame: CGRect,
         defaultTexture: String, selectedTexture: String, fontSize: CGFloat = 20.0) {
        self.labelNode = labelNode
        self.labelNodeName = labelNodeName
        self.buttonNode = buttonNode
        self.spriteNodeName = spriteNodeName
        self.position = position
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
         anchor: CGPoint =  CGPoint(x: 0, y: 0),
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
    var fontSize: CGFloat!
    
    init(labelNode: SKLabelNode, labelNodeName: String, position: CGPoint, fontSize: CGFloat = 20.0) {
        self.labelNode = labelNode
        self.labelNodeName = labelNodeName
        self.position = position
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
        param.labelNode.fontName = UIFont.systemFont(ofSize: 20).fontName
        param.labelNode.fontSize = 20.0
        param.labelNode.fontColor = foregroundColor
        param.labelNode.verticalAlignmentMode = .top
        param.labelNode.horizontalAlignmentMode =  .left
        param.labelNode.zPosition = 10
        self.addChild(param.labelNode)
        
        param.buttonNode.name = param.spriteNodeName
        param.buttonNode.defaultTexture = SKTexture(imageNamed: param.defaultTexture)
        param.buttonNode.selectedTexture = SKTexture(imageNamed: param.selectedTexture)
        param.buttonNode.buttonIdentifier = ButtonIdentifier(rawValue: param.spriteNodeName)
        param.buttonNode.position = CGPoint(x: param.labelNode.position.x + frame.maxY, y: 0)
        param.buttonNode.anchorPoint = CGPoint(x: 0.5, y: 1.0)
        param.buttonNode.zPosition = 10
        param.labelNode.addChild(param.buttonNode)
        
        let focusRing = SKSpriteNode(texture: SKTexture(imageNamed: "focusRingRed"))
        focusRing.scale(to: CGSize(width: param.buttonNode.size.width + 2.0, height: param.buttonNode.size.height + 2.0))
        focusRing.name = "focusRing"
        focusRing.anchorPoint = CGPoint(x: 0.5, y: 1.0)
        focusRing.zPosition = 10
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
        param.labelNode.zPosition = 10
        self.addChild(param.labelNode)
    }
}
