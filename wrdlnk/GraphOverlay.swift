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

class GraphOverlay: SKScene {
    private var graphOverlayNode: SKNode
    private var titleLabel: SKLabelNode!
    private var mark: SKSpriteNode!
    private var background: SKShapeNode!
    private var backgroundBase: SKShapeNode!

    init(size: CGSize, test: Bool = false) {
        if localToggle { print("Entering \(#file):: \(#function) at line \(#line)") }
        graphOverlayNode = SKNode()
        let widthIndent = size.width * layoutRatio.graphTopWidthIndent
        let heightIndent = size.height * layoutRatio.graphTopIndentSize
        let width = size.width * layoutRatio.graphWidthSize
        let height = size.height * layoutRatio.graphHeightSize
        super.init(size: CGSize(width: width, height: height))
        graphOverlayNode.alpha = 1.0
        
        //graphOverlayNode.zPosition = 10
        
        // Setup the game overlays using SpriteKit.
        scaleMode =  .resizeFill
        
        addChild(graphOverlayNode)
       
        backgroundBase = SKShapeNode()
        backgroundBase.name = "backgroundBase"
        backgroundBase.path = UIBezierPath(roundedRect:
            CGRect(x: 0, y: 0, width: size.width, height: height),
                                            cornerRadius: 0).cgPath
        backgroundBase.position = CGPoint(x: -size.width / 2, y: -heightIndent)
        
        backgroundBase.fillColor = .red
        backgroundBase.strokeColor = .red
        backgroundBase.zPosition = 30
        backgroundBase.alpha = 0.7
        graphOverlayNode.addChild(backgroundBase)
        
        background = SKShapeNode()
        background.name = "background"
        background.path = UIBezierPath(roundedRect:
            CGRect(x: 0, y: 0, width: width, height: height),
                                       cornerRadius: layoutRatio.graphCornerRadius).cgPath
        background.position = CGPoint(x: -width / 2, y: -heightIndent)
        background.fillColor = .white
        background.strokeColor = .white
        
        background.zPosition = 31
        background.alpha = 1.0
        graphOverlayNode.addChild(background)
        
        /*
         param.labelNode.name = param.labelNodeName
         param.labelNode.position = param.position
         param.labelNode.fontName = UIFont.systemFont(ofSize: param.fontSize).fontName
         param.labelNode.fontSize = param.fontSize * layoutRatio.currentHeightScaleFactor
         param.labelNode.fontColor = foregroundColor
         param.labelNode.verticalAlignmentMode = .bottom
         param.labelNode.horizontalAlignmentMode =  .center
         param.labelNode.zPosition = param.zposition
         self.addChild(param.labelNode)
 
        */
        titleLabel = SKLabelNode(text: "Performance")
        titleLabel.name = "title"
        titleLabel.fontName = UIFont.systemFont(ofSize: 32).fontName
        titleLabel.fontSize = 32
        titleLabel.fontColor = foregroundColor
        titleLabel.position = CGPoint(x: 0, y: height - 100)
        titleLabel.verticalAlignmentMode = .bottom
        titleLabel.horizontalAlignmentMode =  .center
        titleLabel.zPosition = 100
        graphOverlayNode.addChild(titleLabel)
        
        
        mark = SKSpriteNode(imageNamed: "pdf/mark")
        let scaledWidth = size.width * layoutRatio.markWidthScale
        let scaledHeight = size.height * layoutRatio.markHeightScale
        
        mark.name = "mark"
        mark.scale(to: CGSize(width: scaledWidth, height: scaledHeight))
        mark.position = CGPoint(x: 0, y: 0)
        graphOverlayNode.addChild(mark)
        
        
        graphOverlayNode.isHidden = true
        // Assign the SpriteKit overlay to the SceneKit view.
        //isUserInteractionEnabled = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func showGraph() {
        graphOverlayNode.isHidden = false
    }
    
    func hideGraph() {
        graphOverlayNode.isHidden = true
    }
    
    func toggleGraphOverlay() {
        graphOverlayNode.isHidden = !graphOverlayNode.isHidden
    }
    
    func touchAtPoint(_ location: CGPoint) {
        if localToggle { print("Entering \(#file):: \(#function) at line \(#line)") }

        let touchedNode = self.scene?.atPoint(location)
        
        if touchedNode != nil {
            self.isHidden = true
            print("Hiding GraphOverlay")
        }
    }
}
