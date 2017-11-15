//
//  ProcessTile.swift
//  wrdlnk
//
//  Created by sparkle on 10/16/17.
//  Copyright © 2017 teknowsys. All rights reserved.
//

import SpriteKit

struct ProcessTile {
    public internal(set) var wordList: WordList
    public internal(set) var label: SKLabelNode?
    public internal(set) var spriteNodeList: [SKLabelNode]
    public internal(set) var name: String
    init(wordList: WordList, label: SKLabelNode?, spriteNodeList: [SKLabelNode], name: String) {
        self.wordList = wordList
        self.label = label
        self.spriteNodeList = spriteNodeList
        self.name = name
    }
}

extension ProcessTile {
    func process(spriteNodeList: inout [SKLabelNode]) {
        guard let labelNode = label, let labelNodeName = labelNode.name,
            let parentName = label?.parent?.name else {
                return
        }
        
        if let index = uniqueLabelList(name: parentName, spriteNodeList: spriteNodeList) {
            let lastLabel = spriteNodeList.remove(at: index)
            lastLabel.unhighlight(labelName: lastLabel.name!)
        }
        
        if (inMatchList(list: spriteNodeList + [labelNode])) { return }
        
        labelNode.highlight(labelName: labelNodeName)
    }
    
    func inMatchList(list: [SKLabelNode]) -> Bool {
        
        return false
    }
    
    func uniqueLabelList(name: String, spriteNodeList: [SKLabelNode]) -> Int? {
        
        return 0
    }
    
    func checkForLabelMatch(labelList: inout [SKLabelNode]) {
        
    }
    
    func showDefinitionButton() {
        
    }
    
    func processTileSprite(label: SKLabelNode?, wordlist: WordList, spriteNodeList: inout [SKLabelNode], handler:(String,WordList)->Void) {
        guard let labelNode = label, let labelNodeName = labelNode.name,
            let parentName = label?.parent?.name else {
                return
        }
        if let index = uniqueLabelList(name: parentName, spriteNodeList: spriteNodeList) {
            let lastLabel = spriteNodeList.remove(at: index)
            lastLabel.unhighlight(labelName: lastLabel.name!)
        }
        if (inMatchList(list: spriteNodeList + [labelNode])) { return }
        labelNode.highlight(labelName: labelNodeName)
        handler(labelNodeName, wordlist)
        spriteNodeList.append(labelNode)
        checkForLabelMatch(labelList: &spriteNodeList)
        showDefinitionButton()
    }
    
}
