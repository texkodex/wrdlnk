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

let VisibleStateCount = 8

let buttonsTileMap = "buttons"
let boardTileMap = "board"
let tileNodeName = "tileNode_"
let tileNodeColRow = "tileNode_%d_%d"
let tileNodeNameColRow = "tileNode_%@_%d_%d"
let tileUserDataClickName = "clickable"
let letterNodeName = "letter_"
let letterNodeColRow = "letter_%d_%d"


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
    case graph = "graph"
    case progressGraph = "progressGraph"
    
    static let types = [top, main, board, control, buttons, footer,
                        meaning, prefixMeaning, linkMeaning, suffixMeaning, graph, progressGraph]
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
    let minimumClicks: Int
    let clickMultiple = 2
    
    init (phrase: String = "_unset_", prefix: Int = 0, link: Int = 0, suffix: Int = 0) {
        self.phrase = phrase
        self.prefix = VowelData(id: 1, count: prefix)
        self.link  = VowelData(id: 2, count: link)
        self.suffix  = VowelData(id: 3, count: suffix)
        self.total = prefix + link + suffix
        self.minimumClicks = (prefix + link + suffix) * clickMultiple
    }
    
    func wordphrase() -> String {
        return phrase
    }
    
    func prefixZero() -> Bool {
        return prefix.count == 0 ? true : false
    }
    
    func linkZero() -> Bool {
        return link.count == 0 ? true : false
    }
    
    func suffixZero() -> Bool {
        return suffix.count == 0 ? true : false
    }
    
    func totalZero() -> Bool {
        return prefixZero() && linkZero() && suffixZero()
    }
    
    func matchComplete() -> Bool {
        return match == total
    }
    
    func totalMatches() -> Int {
        return total
    }
    
    func totalClicks() -> Int {
        return clicks
    }
    
    func minClicks() -> Int {
        return minimumClicks
    }
    
    mutating func prefixDecrement() {
        if !prefixZero() {
            prefix.count -= 1
        }
    }
    
    mutating func linkDecrement() {
        if !linkZero() {
            link.count -= 1
        }
    }
    
    mutating func suffixDecrement() {
        if !suffixZero() {
            suffix.count -= 1
        }
    }
    
    mutating func clickAttempt() {
        clicks += 1
    }
    
    mutating func clickMatch() {
        if match < total {
            match += 1
        }
    }
    
    func accuracy() -> Float {
        print("total: \(total)")
        print("minimumClicks: \(minimumClicks)")
        print("clicks: \(clicks)")
        return Float(clicks > 0 ? Float(minClicks()) / Float(totalClicks()) : 0)
    }
    
   func percentage() -> Float {
        return accuracy() * Float(100)
    }
}

struct Stats {
    let phrase: String?
    let accuracy: Float
    let percentage: Float
    let timeSpan: TimeInterval
    
    init(phrase: String?, accuracy: Float, percentage: Float, timeSpan: TimeInterval = 0) {
        self.phrase = phrase
        self.accuracy = accuracy
        self.percentage = percentage
        self.timeSpan = timeSpan
    }
}

public struct Queue<T>: ExpressibleByArrayLiteral {
    public private(set) var elements: Array<T> = []
    public mutating func push(value: T) { elements.append(value) }
    public mutating func pop() -> T { return elements.removeFirst() }
    public var isEmpty: Bool { return elements.isEmpty }
    public var count: Int { return elements.count }
    public init(arrayLiteral elements: T...) { self.elements = elements }
}

struct StatData {
    
    fileprivate struct info {
        static var statQueue = Queue<Stats>()
    }
    
    init() {
    }
}

extension StatData {
    
    func isEmpty() -> Bool {
        return info.statQueue.isEmpty
    }
    
    func count() -> Int {
       return info.statQueue.count
    }
    
    func elements() -> [Stats] {
        return info.statQueue.elements
    }
    
    mutating func push(element: Stats) {
        info.statQueue.push(value: element)
    }
    
    mutating func pop() -> Stats? {
        return info.statQueue.pop()
    }
}
