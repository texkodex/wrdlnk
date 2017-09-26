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
struct VowelCount {
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let CountersArchiveURL = DocumentsDirectory.appendingPathComponent("counters")
    
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
    
    mutating func prefixDecrement() {
        if !prefixZero() {
            self.prefix -= 1
            if !isEmpty() {
                info.vowelCountList[0] = self
            }
        }
    }
    
    mutating func linkDecrement() {
        if !linkZero() {
            self.link -= 1
            if !isEmpty() {
                info.vowelCountList[0] = self
            }
        }
    }
    
    mutating func suffixDecrement() {
        if !suffixZero() {
            self.suffix -= 1
            if !isEmpty() {
                info.vowelCountList[0] = self
            }
        }
    }
    
    mutating func clickAttempt() {
        self.clicks += 1
        if !isEmpty() {
            info.vowelCountList[0] = self
        }
    }
    
    mutating func restoreMatch() {
        self.match += 1
        if !isEmpty() {
            info.vowelCountList[0] = self
        }
    }
    
    mutating func boardClickAttempt() {
        self.boardTileClick += 1
        if !isEmpty() {
            info.vowelCountList[0] = self
        }
    }
    
    mutating func clickMatch() {
        if match < total {
            self.match += 1
            if !isEmpty() {
                info.vowelCountList[0] = self
            }
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
}

extension VowelCount {
    class Coding: NSObject, NSCoding {
        let vowelCount: VowelCount?
        
        init(vowelCount: VowelCount) {
            self.vowelCount = vowelCount
            super.init()
        }
        
        required init?(coder aDecoder: NSCoder) {
            guard let phrase = aDecoder.decodeObject(forKey: "phrase") as? String else {
                return nil
            }
            
            let prefix = aDecoder.decodeInteger(forKey: "prefix")
            let link = aDecoder.decodeInteger(forKey: "link")
            let suffix = aDecoder.decodeInteger(forKey: "suffix")
            let total = aDecoder.decodeInteger(forKey: "total")
            let clicks = aDecoder.decodeInteger(forKey: "clicks")
            let boardTileClick = aDecoder.decodeInteger (forKey: "boardTileClick")
            let match = aDecoder.decodeInteger(forKey: "match")
            let setTotal = aDecoder.decodeInteger(forKey: "setTotal")
            let minimumClicks = aDecoder.decodeInteger(forKey: "minimumClicks")
            let clickMultiple = aDecoder.decodeInteger(forKey: "clickMultiple")
            
            vowelCount = VowelCount(phrase: phrase, prefix: prefix, link: link, suffix: suffix,
                                    total: total, clicks: clicks, boardTileClick: boardTileClick,
                                    match: match, setTotal: setTotal, minimumClicks: minimumClicks,
                                    clickMultiple: clickMultiple)
            super.init()
        }
        
        public func encode(with aCoder: NSCoder) {
            guard let vowelCount = vowelCount else {
                return
            }
            
            aCoder.encode(vowelCount.phrase, forKey: "phrase")
            aCoder.encode(vowelCount.prefix, forKey: "prefix")
            aCoder.encode(vowelCount.link, forKey: "link")
            aCoder.encode(vowelCount.suffix, forKey: "suffix")
            aCoder.encode(vowelCount.total, forKey: "total")
            aCoder.encode(vowelCount.clicks, forKey: "clicks")
            aCoder.encode(vowelCount.boardTileClick, forKey: "boardTileClick")
            aCoder.encode(vowelCount.match, forKey: "match")
            aCoder.encode(vowelCount.setTotal, forKey: "setTotal")
            aCoder.encode(vowelCount.minimumClicks, forKey: "minimumClicks")
            aCoder.encode(vowelCount.clickMultiple, forKey: "clickMultiple")
        }
    }
}

extension VowelCount: Encodable {
    var encoded: Decodable? {
        return VowelCount.Coding(vowelCount: self)
    }
}

extension VowelCount.Coding: Decodable {
    var decoded: Encodable? {
        return self.vowelCount
    }
}

extension VowelCount {
    func isEmpty() -> Bool {
        return info.vowelCountList.isEmpty
    }
    
    mutating func loadVowelCount() {
        do {
            let fileExists = (try? VowelCount.CountersArchiveURL.checkResourceIsReachable()) ?? false
            if fileExists {
                let data = try Data(contentsOf: VowelCount.CountersArchiveURL, options: .alwaysMapped)
                if let back = (NSKeyedUnarchiver.unarchiveObject(with: data) as? [VowelCount.Coding])?.decoded {
                    loadCountData(vowelCountList: back as! [VowelCount])
                }
            }
            
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    mutating func saveVowelCount() {
        do {
            let data = NSKeyedArchiver.archivedData(withRootObject: info.vowelCountList.encoded)
            try data.write(to: VowelCount.CountersArchiveURL, options: .atomic)
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    mutating func clear() {
        info.vowelCountList.removeAll()
    }
    
    mutating func loadCountData(vowelCountList: [VowelCount]) {
        if vowelCountList.count > 0 && !vowelCountList[0].phrase.contains("_unset_") {
            if info.vowelCountList.count == 1 {
                info.vowelCountList[0].clicks += self.clicks
            } else if info.vowelCountList.count == 0 {
                info.vowelCountList.append(self)
            }
        } else {
            if vowelCountList.count == 0 {
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


