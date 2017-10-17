//
//  WordList.swift
//  wrdlnk
//
//  Created by sparkle on 8/14/17.
//  Copyright © 2017 teknowsys. All rights reserved.
//

import Foundation

struct Word: Codable {
    public internal(set) var prefix: String
    public internal(set) var link: String
    public internal(set) var suffix: String
    public internal(set) var level: Int
    
    init(prefix: String, link: String, suffix: String, level: Int = 0) {
        self.prefix = prefix
        self.link = link
        self.suffix = suffix
        self.level = level
    }
    
    enum WordKeys: String, CodingKey {
        case prefix = "prefix"
        case link = "link"
        case suffix = "suffix"
        case level = "level"
    }
}

extension Word {
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: WordKeys.self)
        try container.encode(prefix, forKey: .prefix)
        try container.encode(link, forKey: .link)
        try container.encode(suffix, forKey: .suffix)
        try container.encode(level, forKey: .level)
    }
}

extension Word {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: WordKeys.self)
        let prefix: String = try container.decode(String.self, forKey: .prefix)
        let link: String = try container.decode(String.self, forKey: .link)
        let suffix: String = try container.decode(String.self, forKey: .suffix)
        let level: Int = try container.decode(Int.self, forKey: .level)
        
        self.init(prefix: prefix, link: link, suffix: suffix, level: level)
    }
}

struct WordList {
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let WordListArchiveURL = DocumentsDirectory.appendingPathComponent(StorageForWordList)
    let queue = DispatchQueue(label: "com.teknowsys.wordlist.queue")
    
    var filePath: String {
        let manager = FileManager.default
        let url = manager.urls(for: .documentDirectory, in: .userDomainMask).first
        print("The url path in the document directory \(String(describing: url))")
        return(url!.appendingPathComponent(StorageForWordList).path)
    }
    
    struct info {
        static var index: Int = 0
        static var initialize: Bool = false
        static var wordBank = [Word]()
        static var selectedRow: VowelRow? = nil
        static var matchCondition: Bool? = nil
    }
    
    static var sharedInstance = WordList()
    
    private init() {
        queue.sync {
            if debugInfo {
                AppDefinition.defaults.set(0, forKey: preferenceWordListKey)
                AppDefinition.defaults.purgeAll()
                AppDefinition.defaults.set(true, forKey: preferenceContinueGameEnabledKey)
            }
            info.index =  AppDefinition.defaults.keyExist(key: preferenceWordListKey) ? AppDefinition.defaults.integer(forKey: preferenceWordListKey) : 0
        }
    }
    
    func getListItems() -> [Word] {
        return info.wordBank
    }
}

class WordListBox {
    private var wordListInstance: WordList!
    private let queue = DispatchQueue(label: "com.teknowsys.wordlistbox.queue")
    
    static var sharedInstance = WordListBox()
    
    fileprivate init() {
        queue.sync {
            wordListInstance = WordList.sharedInstance
        }
    }
    
    deinit {
        queue.sync {
            wordListInstance.saveWordList()
        }
    }
    
    func getListItems() -> [Word] {
        return wordListInstance.getListItems()
    }
    
    func isEmpty() -> Bool {
        return wordListInstance.isEmpty()
    }
    
    func populateFromMemoryList() {
        queue.sync {
            wordListInstance.populateFromMemoryList()
        }
    }
    
    func setupWords() {
        queue.sync {
            wordListInstance.setupWords()
        }
    }
    
    func clearWordList() {
        queue.sync {
            wordListInstance.clearWordList()
        }
    }
    
    func loadWordList() {
        queue.sync {
            wordListInstance.loadWordList()
        }
    }
    
    func saveWordList() {
        queue.sync {
            wordListInstance.saveWordList()
        }
    }
    
    func setListDescription(listName: String = awardDescriptionPrefixDefaultString) {
        wordListInstance.setListDescription(listName: listName)
    }
    
    func networkLoad(wordList: [Word]) {
        queue.sync {
            wordListInstance.networkLoad(wordList: wordList)
        }
    }
    
    func getWords() -> Word? {
        var word: Word?
        queue.sync {
            return word = wordListInstance.getWords()
        }
        return word
    }
    
    func skip() {
        wordListInstance.skip()
    }
    
    func stay() {
        wordListInstance.stay()
    }
    
    func checkForListTraversal() {
        wordListInstance.checkForListTraversal()
    }
    
    func getCurrentWords() -> Word? {
        return wordListInstance.getCurrentWords()
    }
    
    func setSelectedRow(row: VowelRow?) {
        queue.sync {
            wordListInstance.setSelectedRow(row: row)
        }
    }
    
    func getSelectedRow() -> VowelRow? {
        return wordListInstance.getSelectedRow()
    }
    
    func currentIndex() -> Int? {
        return wordListInstance.currentIndex()
    }

    func setMatchCondition() {
        queue.sync {
            wordListInstance.setMatchCondition()
        }
    }
    
    func clearMatchCondition() {
        queue.sync {
            wordListInstance.clearMatchCondition()
        }
    }
    
    func handledMatchCondition() {
        queue.sync {
            wordListInstance.handledMatchCondition()
        }
    }
    
    func getMatchCondition() -> Bool {
        return wordListInstance.getMatchCondition()
    }
    
    func reset() {
        queue.sync {
            wordListInstance.reset()
        }
    }
}
