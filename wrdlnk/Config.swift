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

let tileWidth: CGFloat = 44
let tileHeight: CGFloat = 44

let tileWidthLess2: CGFloat = 42.0
let tileHeightLess2: CGFloat = 42.0

let buttonsTileMap = "buttons"
let boardTileMap = "board"

let grayTile = UIColor(colorLiteralRed: 192 / 255, green: 192 / 255, blue: 192 / 255, alpha: 1)
let blueTile = UIColor(colorLiteralRed: 77 / 255, green: 146 / 255, blue: 223 / 255, alpha: 1)
let yellowTile = UIColor(colorLiteralRed: 241 / 255, green: 224 / 255, blue: 95 / 255, alpha: 1)
let greenTile = UIColor(colorLiteralRed: 129 / 255, green: 209 / 255, blue: 53 / 255, alpha: 1)
let redTile = UIColor(colorLiteralRed: 252 / 255, green: 13 / 255, blue: 27 / 255, alpha: 1)

struct viewNode {
    let name: String
    let node: SKNode
    let visible: Bool
}

enum ViewElement:String {
    case top = "top"
    case main = "main"
    case board = "board"
    case control = "control"
    case buttons = "buttons"
    case footer = "footer"
    case meaning = "meaning"
    case prefixMeaning = "prefixMeaning"
    case linkMeaning = "linkMeaning"
    case suffixMeaning = "suffixMeaning"
    static let types = [top, main, board, control, buttons, footer,
                        meaning, prefixMeaning, linkMeaning, suffixMeaning]
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

let TileColor = [grayTile, blueTile, yellowTile, greenTile, redTile]

// TileMap cell (0,0) in lower left hand corner
enum VowelRow: Int {
    case prefix = 4
    case link = 2
    case suffix = 0
    
    static let types = [prefix, link, suffix]
}

struct VowelData {
    let id : Int
    var count : Int = 0
}

protocol VowelCountData {
    static var prefix: VowelData { get set }
    static var link: VowelData { get set }
    static var suffix: VowelData { get set }
}

let phraseSeparator = "|"

struct VowelCount {
    let phrase: String
    var prefix: VowelData
    var link: VowelData
    var suffix: VowelData
    let total: Int
    var clicks: Int = 0
    var match: Int = 0
    var setTotal: Int = 0
    
    init (phrase: String = "_unset_", prefix: Int = 0, link: Int = 0, suffix: Int = 0) {
        self.phrase = phrase
        self.prefix = VowelData(id: 1, count: prefix)
        self.link  = VowelData(id: 2, count: link)
        self.suffix  = VowelData(id: 3, count: suffix)
        self.total = prefix + link + suffix
        self.setTotal += 1
    }
    
    func wordphrase() -> String {
        return self.phrase
    }
    
    func prefixZero() -> Bool {
        return self.prefix.count == 0 ? true : false
    }
    
    func linkZero() -> Bool {
        return self.link.count == 0 ? true : false
    }
    
    func suffixZero() -> Bool {
        return self.suffix.count == 0 ? true : false
    }
    
    func totalZero() -> Bool {
        return prefixZero() && linkZero() && suffixZero()
    }
    
    func matchComplete() -> Bool {
        return self.match == self.total
    }
    
    func totalMatches() -> Int {
        return self.total
    }
    
    func totalClicks() -> Int {
        return self.clicks
    }
    
    mutating func prefixDecrement() {
        if !prefixZero() {
            self.prefix.count -= 1
        }
    }
    
    mutating func linkDecrement() {
        if !linkZero() {
            self.link.count -= 1
        }
    }
    
    mutating func suffixDecrement() {
        if !suffixZero() {
            self.suffix.count -= 1
        }
    }
    
    mutating func clickAttempt() {
        self.clicks += 1
    }
    
    mutating func clickMatch() {
        if self.match < self.total {
            self.match += 1
        }
    }
    
    func accuracy() -> Float {
        return Float(self.total > 0 ? (self.clicks / self.total) : 0)
    }
}
