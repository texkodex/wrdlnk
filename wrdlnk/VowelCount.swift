//
//  VowelCount.swift
//  wrdlnk
//
//  Created by sparkle on 9/26/17.
//  Copyright © 2017 teknowsys. All rights reserved.
//

import Foundation

// MARK:- Structs
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

// MARK:- VowelCount structure
struct VowelCount: Codable {
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let CountersArchiveURL = DocumentsDirectory.appendingPathComponent(StorageForCounters)
    
    var filePath: String {
        let manager = FileManager.default
        let url = manager.urls(for: .documentDirectory, in: .userDomainMask).first
        print("The url path in the document directory \(String(describing: url))")
        return(url!.appendingPathComponent(StorageForCounters).path)
    }
    
    public internal(set) var phrase: String
    public internal(set) var prefix: Int
    public internal(set) var link: Int
    public internal(set) var suffix: Int
    public internal(set) var total: Int
    public internal(set) var clicks: Int
    public internal(set) var boardTileClick: Int
    public internal(set) var match: Int
    public internal(set) var setTotal: Int
    public internal(set) var minimumClicks: Int
    public internal(set) var clickMultiple: Int
    
    fileprivate struct info {
        static var initialize: Bool = false
        static var minClicks: Int = 0
        static var vowelCountList = [VowelCount]()
    }
    
    static let sharedInstance = VowelCount()
    
    private init() {
        if debugInfo {
            info.vowelCountList.removeAll()
        }
        self.phrase = ""
        self.prefix = 0
        self.link  = 0
        self.suffix  = 0
        self.total = 0
        self.clicks = 0
        self.boardTileClick = 0
        self.match = 0
        self.setTotal = 0
        self.minimumClicks = 0
        self.clickMultiple = 2
    }
    
    init (phrase: String = "_unset_", prefix: Int = 0, link: Int = 0, suffix: Int = 0, total: Int = 0,
          clicks: Int = 0, boardTileClick: Int = 0, match: Int = 0, setTotal: Int = 0, minimumClicks: Int = 1, clickMultiple: Int = 2) {
        self.phrase = phrase
        self.prefix = prefix
        self.link  = link
        self.suffix  = suffix
        self.total = prefix + link + suffix
        self.clicks = clicks
        self.boardTileClick = boardTileClick
        self.match = match
        self.setTotal = setTotal
        info.minClicks = (prefix + link + suffix) * clickMultiple
        self.minimumClicks = (prefix + link + suffix) * clickMultiple
        self.clickMultiple = clickMultiple
        
    }
    
    mutating func setup(vowelCount: VowelCount) {
        self = vowelCount
    }
    
    func isEmpty() -> Bool {
        return info.vowelCountList.count == 0 ? true : false
    }
    
    func wordphrase() -> String {
        return phrase
    }
    
    func prefixZero() -> Bool {
        return prefix == 0 ? true : false
    }
    
    func linkZero() -> Bool {
        return link == 0 ? true : false
    }
    
    func suffixZero() -> Bool {
        return suffix == 0 ? true : false
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
        return !isEmpty() ? info.vowelCountList[0].clicks : 0
    }
    
    func totalBoardTileClicks() -> Int {
        return boardTileClick
    }
    
    func minClicks() -> Int {
        return info.minClicks
    }
    
    mutating func assignToVowelList() {
        if !isEmpty() {
            info.vowelCountList[0] = self
        } else {
            info.vowelCountList.append(self)
        }
    }
    
    mutating func prefixDecrement() {
        if !prefixZero() {
            self.prefix -= 1
            assignToVowelList()
        }
    }
    
    mutating func linkDecrement() {
        if !linkZero() {
            self.link -= 1
            assignToVowelList()
        }
    }
    
    mutating func suffixDecrement() {
        if !suffixZero() {
            self.suffix -= 1
            assignToVowelList()
        }
    }
    
    mutating func clickAttempt() {
        self.clicks += 1
        assignToVowelList()
    }
    
    mutating func restoreMatch() {
        self.match += 1
        assignToVowelList()
    }
    
    mutating func boardClickAttempt() {
        self.boardTileClick += 1
        assignToVowelList()
    }
    
    mutating func clickMatch() {
        if match < total {
            self.match += 1
            assignToVowelList()
        }
    }
    
    func accuracy() -> Float {
        print("total: \(total)")
        print("minimumClicks: \(minimumClicks)")
        print("clicks: \(clicks)")
        return Float(clicks > 0 ? min(Float(minClicks()) / Float(totalClicks()), 1.0) : 0)
    }
    
    func percentage() -> Float {
        return accuracy() * Float(100)
    }
    
    enum VowelCountKeys: String, CodingKey {
        case phrase = "phrase"
        case prefix = "prefix"
        case link = "link"
        case suffix = "suffix"
        case total = "total"
        case clicks = "clicks"
        case boardTileClick = "boardTileClick"
        case match = "match"
        case setTotal = "setTotal"
        case minimumClicks = "minimumClicks"
        case clickMultiple = "clickMultiple"
    }
}

extension VowelCount {
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: VowelCountKeys.self)
        try container.encode(phrase, forKey: .phrase)
        try container.encode(prefix, forKey: .prefix)
        try container.encode(link, forKey: .link)
        try container.encode(suffix, forKey: .suffix)
        try container.encode(total, forKey: .total)
        try container.encode(clicks, forKey: .clicks)
        try container.encode(boardTileClick, forKey: .boardTileClick)
        try container.encode(match, forKey: .match)
        try container.encode(setTotal, forKey: .setTotal)
        try container.encode(minimumClicks, forKey: .minimumClicks)
        try container.encode(clickMultiple, forKey: .clickMultiple)
    }
}

extension VowelCount {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: VowelCountKeys.self)
        
        let phrase: String = try container.decode(String.self, forKey: .phrase)
        let prefix: Int = try container.decode(Int.self, forKey: .prefix)
        let link: Int = try container.decode(Int.self, forKey: .link)
        let suffix: Int = try container.decode(Int.self, forKey: .suffix)
        let total: Int = try container.decode(Int.self, forKey: .total)
        let clicks: Int = try container.decode(Int.self, forKey: .clicks)
        let boardTileClick: Int = try container.decode(Int.self, forKey: .boardTileClick)
        let match: Int = try container.decode(Int.self, forKey: .match)
        let setTotal: Int = try container.decode(Int.self, forKey: .setTotal)
        let minimumClicks: Int = try container.decode(Int.self, forKey: .minimumClicks)
        let clickMultiple: Int = try container.decode(Int.self, forKey: .clickMultiple)
        
        self.init(phrase: phrase, prefix: prefix, link: link, suffix:suffix, total: total,
                  clicks: clicks, boardTileClick: boardTileClick, match: match, setTotal: setTotal,
                  minimumClicks: minimumClicks, clickMultiple: clickMultiple)
        
        if info.vowelCountList.count == 0 {
            info.vowelCountList.append(self)
        } else {
            info.vowelCountList[0] = self
        }
    }
}

extension VowelCount {
    mutating func loadVowelCount() {
        guard let data = NSKeyedUnarchiver.unarchiveObject(withFile: filePath) as? Data else { return }
        do {
            let decoder = JSONDecoder()
            let vowels = try decoder.decode([VowelCount].self, from: data)
            info.vowelCountList = vowels
            if vowels.count > 0 { info.initialize = true }
        } catch {
            print("loadWordList Failed")
        }
    }
    
    mutating func saveVowelCount() {
        trace("\(#file ) \(#line)", {"saveVowelCount - start: "})
        do {
            let vowels = info.vowelCountList
            let encoder = JSONEncoder()
            let data = try encoder.encode(vowels)
            NSKeyedArchiver.archiveRootObject(data, toFile: filePath)
        } catch {
            print("saveWordList Failed")
        }
    }
    
    mutating func clear() {
        if isEmpty() { return }
        trace("\(#file ) \(#line)", {"clear VowelCount - ...: "})
        info.vowelCountList.removeAll()
        info.initialize = false
    }
    
    mutating func loadCountData(vowelCountList: [VowelCount]) {
        if info.vowelCountList.count > 0 && !info.vowelCountList[0].phrase.contains("_unset_") {
            if info.vowelCountList.count == 1 {
                info.vowelCountList[0].clicks += self.clicks
            } else if info.vowelCountList.count == 0 {
                info.vowelCountList.append(self)
            }
        } else {
            if info.vowelCountList.count == 0 {
                info.vowelCountList.append(self)
            } else {
                info.vowelCountList[0] = self
            }
        }
    }
    
    mutating func deleteVowelCount() {
        clear()
        saveVowelCount()
    }
}

class VowelCountBox {
    private var vowelCountInstance: VowelCount!
    private var queue = DispatchQueue(label: "com.teknowsys.vowelcount.queue")
    
    static var sharedInstance = VowelCountBox()
    
    fileprivate init() {
        queue.sync {
            vowelCountInstance = VowelCount.sharedInstance
        }
    }
    
    func setup(vowelCount: VowelCount) {
        queue.sync {
            vowelCountInstance.setup(vowelCount: vowelCount)
        }
    }
    
    func isEmpty() -> Bool {
        return vowelCountInstance.isEmpty()
    }
    
    func wordphrase() -> String {
        return vowelCountInstance.wordphrase()
    }
    
    func prefixZero() -> Bool {
        return vowelCountInstance.prefixZero()
    }
    
    func linkZero() -> Bool {
        return vowelCountInstance.linkZero()
    }
    
    func suffixZero() -> Bool {
        return vowelCountInstance.suffixZero()
    }
    
    func totalZero() -> Bool {
        return vowelCountInstance.totalZero()
    }
    
    func matchComplete() -> Bool {
        return vowelCountInstance.matchComplete()
    }
    
    func totalMatches() -> Int {
        return vowelCountInstance.totalMatches()
    }
    
    func totalClicks() -> Int {
        return vowelCountInstance.totalClicks()
    }
    
    func totalBoardTileClicks() -> Int {
        return vowelCountInstance.totalBoardTileClicks()
    }
    
    func minClicks() -> Int {
        return vowelCountInstance.minClicks()
    }
    
    func accuracy() -> Float {
        return vowelCountInstance.accuracy()
    }
    
    func percentage() -> Float {
        return vowelCountInstance.percentage()
    }
    
    func assignToVowelList() {
        queue.sync {
            vowelCountInstance.assignToVowelList()
        }
    }
    
    func prefixDecrement() {
        queue.sync {
            vowelCountInstance.prefixDecrement()
        }
    }
    
    func linkDecrement() {
        queue.sync {
            vowelCountInstance.linkDecrement()
        }
    }
    
    func suffixDecrement() {
        queue.sync {
            vowelCountInstance.suffixDecrement()
        }
    }
    
    func clickAttempt() {
        queue.sync {
            vowelCountInstance.clickAttempt()
        }
    }
    
    func restoreMatch() {
        queue.sync {
            vowelCountInstance.restoreMatch()
        }
    }
    
    func boardClickAttempt() {
        queue.sync {
            vowelCountInstance.boardClickAttempt()
        }
    }
    
    func clickMatch() {
        queue.sync {
            vowelCountInstance.clickMatch()
        }
    }
    
    func loadVowelCount() {
       queue.sync {
        vowelCountInstance.loadVowelCount()
        }
    }
    
    func saveVowelCount() {
        queue.sync {
            vowelCountInstance.saveVowelCount()
        }
    }
    
    func clear() {
       queue.sync {
            vowelCountInstance.clear()
        }
    }
    
    func loadCountData(vowelCountList: [VowelCount]) {
        queue.sync {
            return vowelCountInstance.loadCountData(vowelCountList: vowelCountList)
        }
    }
    
    func deleteVowelCount() {
        queue.sync {
            vowelCountInstance.deleteVowelCount()
        }
    }
}

