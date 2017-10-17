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
    public internal(set) var sprite: SKSpriteNode?
    public internal(set) var spriteNodeList: [SKSpriteNode]
    public internal(set) var name: String
    init(wordList: WordList, sprite: SKSpriteNode?, spriteNodeList: [SKSpriteNode], name: String) {
        self.wordList = wordList
        self.sprite = sprite
        self.spriteNodeList = spriteNodeList
        self.name = name
    }
}

extension ProcessTile {
    func process(spriteNodeList: inout [SKSpriteNode]) {
        guard let spriteNode = sprite, let spriteNodeName = spriteNode.name,
            let parentName = sprite?.parent?.name else {
                return
        }
        
        if let index = uniqueSpriteList(name: parentName, spriteNodeList: spriteNodeList) {
            let lastSprite = spriteNodeList.remove(at: index)
            lastSprite.unhighlight(spriteName: lastSprite.name!)
        }
        
        if (inMatchList(list: spriteNodeList + [spriteNode])) { return }
        
        spriteNode.highlight(spriteName: spriteNodeName)
    }
    
    func inMatchList(list: [SKSpriteNode]) -> Bool {
        
        return false
    }
    
    func uniqueSpriteList(name: String, spriteNodeList: [SKSpriteNode]) -> Int? {
        
        return 0
    }
    
    func checkForSpriteMatch(spriteList: inout [SKSpriteNode]) {
        
    }
    
    func showDefinitionButton() {
        
    }
    
    func processTileSprite(sprite: SKSpriteNode?, wordlist: WordList, spriteNodeList: inout [SKSpriteNode], handler:(String,WordList)->Void) {
        guard let spriteNode = sprite, let spriteNodeName = spriteNode.name,
            let parentName = sprite?.parent?.name else {
                return
        }
        if let index = uniqueSpriteList(name: parentName, spriteNodeList: spriteNodeList) {
            let lastSprite = spriteNodeList.remove(at: index)
            lastSprite.unhighlight(spriteName: lastSprite.name!)
        }
        if (inMatchList(list: spriteNodeList + [spriteNode])) { return }
        spriteNode.highlight(spriteName: spriteNodeName)
        handler(spriteNodeName, wordlist)
        spriteNodeList.append(spriteNode)
        checkForSpriteMatch(spriteList: &spriteNodeList)
        showDefinitionButton()
    }
    
}
