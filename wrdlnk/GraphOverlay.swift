//
//  GraphOverlay.swift
//  wrdlnk
//
//  Created by sparkle on 11/10/17.
//  Copyright © 2017 teknowsys. All rights reserved.
//

import Foundation
import SceneKit
import SpriteKit

protocol GraphOverlayDelegate: class {
    func showOverlayGraph()
    func hideOverlayGraph()
}

class GraphOverlay: SKNode, GraphOverlayDelegate {
    weak private var graphOverlayDelegate: GraphOverlayDelegate?
    
    // MARK:- Top nodes
    let titleLabel = SKLabelNode(text: "Performance")
    let backgroundBase = SKShapeNode()
    let base = SKShapeNode()
    
    // MARK:- Graph Elements
    let hundred = SKLabelNode(text:"100")
    let zero = SKLabelNode(text:"0")
    
    
    
    // MARK:- Data structure
    var wordList = WordList.sharedInstance
    var statData = StatData.sharedInstance
    var graphParam = GraphParam()
    
    let dismissOverlay = SKSpriteNode(imageNamed: "pdf/chevron-down")
    
    init(size: CGSize, test: Bool = false) {
        if localToggle { print("Entering \(#file):: \(#function) at line \(#line)") }
        let heightIndent = size.height * layoutRatio.graphTopIndentSize
        let width = size.width * layoutRatio.graphWidthSize
        let height = size.height * layoutRatio.graphHeightSize
        super.init()
        
        self.name = "GraphOverlayNode"
        
        
        AppTheme.instance.set(for: self, sceneType: "SettingScene")
        
        graphOverlayDelegate = self
        isHidden = true
        alpha = 1.0
        zPosition = 10
        
        backgroundBase.name = "backgroundBase"
        backgroundBase.path = UIBezierPath(roundedRect:
            CGRect(x: 0, y: 0, width: size.width, height: size.height),
                                            cornerRadius: 0).cgPath
        backgroundBase.position = CGPoint(x: -size.width / 2, y: -size.height / 2)
        backgroundBase.zPosition = 33
        backgroundBase.alpha = 0.9
        self.addChild(backgroundBase)

        base.name = "background"
        base.path = UIBezierPath(roundedRect:
            CGRect(x: 0, y: 0, width: width, height: height),
                                       cornerRadius: layoutRatio.graphCornerRadius).cgPath
        base.position = CGPoint(x: -width / 2, y: -heightIndent)
        base.zPosition = backgroundBase.zPosition + 1
        base.alpha = 1.0
        self.addChild(base)

        titleLabel.name = "title"
        titleLabel.fontName = UIFont.systemFont(ofSize: 32).fontName
        titleLabel.fontSize = 32
        titleLabel.position = CGPoint(x: 0, y: height - 100)
        titleLabel.verticalAlignmentMode = .bottom
        titleLabel.horizontalAlignmentMode =  .center
        titleLabel.zPosition = base.zPosition + 1
        self.addChild(titleLabel)

        let buttonWidth = size.width * layoutRatio.buttonGraphWidthScale
        let buttonHeight = size.height * layoutRatio.buttonGraphHeightScale
        let buttonSize = CGSize(width: buttonWidth, height: buttonHeight)
        
        dismissOverlay.scale(to: CGSize(width: buttonWidth, height: buttonHeight))
        dismissOverlay.size = buttonSize
        dismissOverlay.name = "graphOverlay"
        dismissOverlay.position = CGPoint(x: 0, y:  -size.height * (0.5 - layoutRatio.overalyDismissButtonFrontButtonEdge))
        dismissOverlay.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        dismissOverlay.zPosition = base.zPosition + 1
        dismissOverlay.isUserInteractionEnabled = true
        self.addChild(dismissOverlay)

        isUserInteractionEnabled = true
        isHidden = true
        
        showGraph()
    }
    
    deinit {
        self.removeAllChildren()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func showGraph() {
        placeAssets()
    }
    
    // MARK:- graph display
    func placeAssets() {
        print("Entering \(#file):: \(#function) at line \(#line)")
        let size = UIScreen.main.bounds.size
        
        graphParam.gridFrame = base.frame
        
        var yPos = base.frame.maxY + size.height * -0.0747
        let xPos = base.frame.width * -0.365
        graphParam.hundredPos = CGPoint(x: xPos, y: yPos)
        
        var labelParam:SceneLabelParam = SceneLabelParam(labelNode: hundred, labelNodeName: "hundred", position: CGPoint(x: xPos, y: yPos), zposition: base.zPosition)
        sceneLabelSetup(param: labelParam)
        
        yPos = base.frame.minY + size.height * 0.0747
        labelParam = SceneLabelParam(labelNode: zero, labelNodeName: "zero", position: CGPoint(x: xPos, y: yPos), zposition: base.zPosition)
        sceneLabelSetup(param: labelParam)
        graphParam.zeroPos = CGPoint(x: xPos, y: yPos)
        
        processGraphRequest()
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
    
    func numberOfGraphElements() -> Int {
        let maxNumberOfGraphsInGrid = Int(( 1 / 0.1227) * layoutRatio.currentWidthScaleFactor) 
        return VisibleStateCount < maxNumberOfGraphsInGrid ? maxNumberOfGraphsInGrid : VisibleStateCount
    }
    
    func processGraphRequest() {
        let length = statData.elements().count
        if length > 0 {
            if length < VisibleStateCount {
                drawGraph(param: graphParam, stats: statData.elements())
            } else {
                let slice = Array(statData.elements()[length - numberOfGraphElements()..<length])
                drawGraph(param: graphParam, stats: slice)
            }
        }
        
        preserveWordListMatch()
    }
    
    // name: "test_draw"
    // shapeSize: CGRect(x: -80, y: -368, width: 16, height: 200)
    // cornerRadius: 7
    // strokeColor: foregroundColor
    // lineWidth: 4
    // zPosition: 10
    // example call:
    //      drawGraphElement(name: "test_draw",
    //          shapeSize: CGRect(x: -80, y: -368, width: 16, height: 200))
    private func drawGraphElement(name: String, shapeSize: CGRect,
                                  cornerRadius: CGFloat = 7,
                                  strokeColor: SKColor = foregroundColor,
                                  fillColor: SKColor = backgroundColor,
                                  lineWidth: CGFloat = 4, zPosition: CGFloat = 31) {
        
        let shape = SKShapeNode()
        let graphColor = AppTheme.instance.graphFillAndStroke()
        shape.fillColor = graphColor.fill!
        shape.strokeColor = graphColor.stroke!
        shape.name = name
        shape.path = UIBezierPath(roundedRect: CGRect(x: shapeSize.minX, y: shapeSize.minY, width: shapeSize.width, height: shapeSize.height), cornerRadius: cornerRadius).cgPath
        
        
        shape.lineWidth = lineWidth
        shape.zPosition = zPosition + 10
        self.addChild(shape)
    }
    
    func drawGraph(param: GraphParam, stats: [Stat]) {
        print("Entering \(#file):: \(#function) at line \(#line)")
        let frameWidth = param.gridFrame.maxX - param.gridFrame.minX
        let frameHeight = param.gridFrame.maxY - param.gridFrame.minY
        let graphWidth = frameWidth * CGFloat(param.graphWidthRatioOfGrid)
        let spaceWidth = frameWidth * CGFloat(param.graphSpaceRatioOfGrid)
        let cornerRadius = CGFloat(graphWidth * CGFloat(0.5))
        
        guard stats.count > 0 else { return }
        
        var xPos = Int(graphParam.zeroPos.x + spaceWidth)
        var lastMaxPos: CGPoint!
        for (index, statElement) in stats.enumerated() {
            if index > numberOfGraphElements() { break }
            
            let yPos = Int(graphParam.zeroPos.y)
            let graphWidth = Int(graphWidth)
            let graphHeight =  Int(frameHeight * CGFloat(statElement.accuracy) * param.maxGraphHeightRatioInGrid)
            lastMaxPos = CGPoint(x: xPos, y: yPos + graphHeight)
            
            drawGraphElement(name: "graph_element_\(index)",
                shapeSize: CGRect(x: xPos, y: yPos, width: graphWidth, height: graphHeight),
                cornerRadius: cornerRadius)
            
            xPos = xPos + Int(spaceWidth)
        }
        placeIndicator(position: lastMaxPos, width: graphWidth, height: frameHeight)
    }
    
    func placeIndicator(position: CGPoint, width: CGFloat, height: CGFloat) {
        let indicator = SKSpriteNode(imageNamed: "pdf/chevron-down")
        let graphCenter = width / 2
        let offset = height * 0.048
        let yPosScaled = position.y + offset
        let scaledIndicatorwidth = width * 0.75
        
        indicator.position = CGPoint(x: position.x + graphCenter, y: yPosScaled)
        indicator.scale(to: CGSize(width: width, height: scaledIndicatorwidth))
        indicator.zPosition = 31
        self.addChild(indicator)
    }
    
    private func preserveWordListMatch() {
        if wordList.getMatchCondition() {
            preserveDefaults(stats: statData)
            wordList.handledMatchCondition()
        }
    }
    
    func preserveDefaults(stats: StatData?) {
        if !AppDefinition.defaults.keyExist(key: preferenceGameStatKey) {
            AppDefinition.defaults.set(true, forKey: preferenceGameStatKey)
        }
    }
    
    func enableButton(button: ButtonNode?, isSelected: Bool = true, focus: Bool = false) {
        button?.alpha = 1.0
        button?.isUserInteractionEnabled = true
        button?.isSelected = isSelected
        button?.focusRing.isHidden = focus
    }
    
    // MARK:- overlay toggling
    func toggleOverlayGraph() {
       print("Entering \(#file):: \(#function) at line \(#line)")
        isHidden = !isHidden
        if isHidden {
            alpha = 0.0
            isUserInteractionEnabled = false
        } else {
            alpha = 1.0
            isUserInteractionEnabled = true
        }
    }
    
    func showOverlayGraph() {
        print("Entering \(#file):: \(#function) at line \(#line)")
        alpha = 1.0
        isUserInteractionEnabled = true
        isHidden = false
    }
    
    func hideOverlayGraph() {
        print("Entering \(#file):: \(#function) at line \(#line)")
        alpha = 0.0
        isUserInteractionEnabled = false
        isHidden = true
    }
    
    func actionForKeyIsRunning(key: String) -> Bool {
        return self.action(forKey: key) != nil ? true : false
    }
    
    func fadeInGraphOverlay() {
        if !actionForKeyIsRunning(key: "show") {
            alpha = 0.0
            let show = SKAction.fadeIn(withDuration: 0.7)
            run(show, withKey: "show")
        }
    }
    
    func fadeOutGraphOverlay() {
        if !actionForKeyIsRunning(key: "hide") {
            alpha = 1.0
            let hide = SKAction.fadeOut(withDuration: 0.7)
            run(hide, completion: {
                self.isHidden = true
            })
        }
    }
    
    func toggleGraphOverlay() {
        if !actionForKeyIsRunning(key: "show") {
            isHidden = false
        }
    }
    
    func dismmissGraphOverlay() {
        if !actionForKeyIsRunning(key: "dismiss") {
            isHidden = true
        }
    }
    
    // MARK: - Touches
    func touchDown(atPoint pos : CGPoint) {
        print("Entering \(#file):: \(#function) at line \(#line)")
    }
    
    func touchMoved(toPoint pos : CGPoint) {
        print("Entering \(#file):: \(#function) at line \(#line)")
    }
    
    func touchUp(atPoint pos : CGPoint) {
        print("Entering \(#file):: \(#function) at line \(#line)")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("Entering \(#file):: \(#function) at line \(#line)")
        let touch =  touches.first
        let positionInScene = touch!.location(in: self)
        let touchedNode = self.atPoint(positionInScene)
        
        if let name = touchedNode.name {
            if name == "graphOverlay" {
                print("Touched dismiss icon.")
                hideOverlayGraph()
            }
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("Entering \(#file):: \(#function) at line \(#line)")
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("Entering \(#file):: \(#function) at line \(#line)")
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("Entering \(#file):: \(#function) at line \(#line)")
        isUserInteractionEnabled = true
    }
}
