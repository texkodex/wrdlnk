//
//  GameStatusScene.swift
//  wrdlnk
//
//  Created by Selvin on 6/1/17.
//  Copyright © 2017 teknowsys. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameStatusScene: BaseScene {
    // MARK:- Top nodes
    let mark = SKSpriteNode(imageNamed: "pdf/mark")
    
    // MARK:- Graph Elements
    let base = SKSpriteNode(imageNamed: "pdf/base")
    let hundred = SKLabelNode(text:"100")
    let zero = SKLabelNode(text:"0")
    var shape:SKShapeNode!

    // MARK:- Buttons
    let enterButton = ButtonNode(imageNamed: "pdf/chevron-down")
    
    // MARK:- Data structure
    var wordList = WordList.sharedInstance
    var statData = StatData.sharedInstance
    var graphParam = GraphParam()
    
    deinit {
        print("Entering \(#file):: \(#function) at line \(#line)")
        self.removeFromParent()
        self.removeAllChildren()
        self.removeAllActions()
        self.view?.presentScene(nil)
    }
    
    override func didMove(to view: SKView) {
        super.didMove(to: view)
        print("Entering \(#file):: \(#function) at line \(#line)")
        placeAssets()
        
        //resizeIfNeeded()
        initializeButtons()
        AppTheme.instance.set(for: self)
    }

    func placeAssets() {
        print("Entering \(#file):: \(#function) at line \(#line)")
        let scaledWidth = size.width * layoutRatio.markWidthScale
        let scaledHeight = size.height * layoutRatio.makeHeightScale
        
        mark.name = "mark"
        mark.scale(to: CGSize(width: scaledWidth, height: scaledHeight))
        mark.anchorPoint = CGPoint(x: 0.5, y: 1.0)
        mark.position = CGPoint(x: size.width * 0, y: size.height * 0.4185)
        mark.zPosition = 10
        addChild(mark)
        
        base.name = "base"
        base.scale(to: CGSize(width: size.width * 0.7874, height: size.height * 0.5652))
        base.anchorPoint = CGPoint(x: 0.5, y: 1.0)
        base.position = CGPoint(x: size.width * 0, y: size.height * 0.2962)
        base.zPosition = 0
        addChild(base)
        graphParam.gridFrame = base.frame
        
        var position = CGPoint(x: 0, y: mark.position.y)
        
        var yPos = base.frame.maxY + size.height * -0.0747
        let xPos = base.frame.width * -0.365
        graphParam.hundredPos = CGPoint(x: xPos, y: yPos)
        
        var labelParam:SceneLabelParam = SceneLabelParam(labelNode: hundred, labelNodeName: "hundred", position: CGPoint(x: xPos, y: yPos))
        sceneLabelSetup(param: labelParam)
        
        yPos = base.frame.minY + size.height * 0.0747
        labelParam = SceneLabelParam(labelNode: zero, labelNodeName: "zero", position: CGPoint(x: xPos, y: yPos))
        sceneLabelSetup(param: labelParam)
        graphParam.zeroPos = CGPoint(x: xPos, y: yPos)
        
        yPos = base.frame.minY + size.height * -0.0978
        position = CGPoint(x: 0.0, y: yPos)
        let buttonParam: SceneButtonParam =
            SceneButtonParam(buttonNode: enterButton, spriteNodeName: "EnterGame",
                             position: position,
                             defaultTexture: "pdf/chevron-down", selectedTexture: "pdf/chevron-down")
        sceneButtonSetup(param: buttonParam)
        
        processGraphRequest()
    }

    func processGraphRequest() {
        let length = statData.elements().count
        if length > 0 {
            if length < VisibleStateCount {
                drawGraph(param: graphParam, stats: statData.elements())
            } else {
                let slice = Array(statData.elements()[length - VisibleStateCount..<length])
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
                                  strokeColor: UIColor = foregroundColor,
                                  lineWidth: CGFloat = 4, zPosition: CGFloat = 10) {
        let shape = SKShapeNode()
        shape.name = name
        shape.path = UIBezierPath(roundedRect: CGRect(x: shapeSize.minX, y: shapeSize.minY, width: shapeSize.width, height: shapeSize.height), cornerRadius: cornerRadius).cgPath
        
        shape.strokeColor = strokeColor
        shape.lineWidth = lineWidth
        shape.zPosition = zPosition
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
            if index > param.maxNumberOfGraphsInGrid { break }
            
            let yPos = Int(graphParam.zeroPos.y)
            let graphWidth = Int(graphWidth)
            let graphHeight =  Int(frameHeight * CGFloat(statElement.accuracy) * param.maxGraphHeightRatioInGrid)
            lastMaxPos = CGPoint(x: xPos, y: yPos + graphHeight)
            
            drawGraphElement(name: "graph_element_\(index)",
                shapeSize: CGRect(x: xPos, y: yPos, width: graphWidth, height: graphHeight),
                             cornerRadius: cornerRadius,
                             strokeColor: foregroundColor)
            
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
        indicator.zPosition = 10
        self.addChild(indicator)
    }
    
    func initializeButtons() {
        enableButton(button: enterButton, isSelected: false, focus: true)
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
    
    override func update(_ currentTime: TimeInterval) { }
}
