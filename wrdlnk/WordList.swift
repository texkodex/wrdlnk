//
//  WordList.swift
//  wrdlnk
//
//  Created by sparkle on 8/14/17.
//  Copyright © 2017 teknowsys. All rights reserved.
//

import Foundation

class WordListArchiver: NSObject, NSCoding {
    var wordBank: [Word] = []
    
    static var sharedInstance = WordListArchiver()
    
    deinit {
        self.wordBank.removeAll()
    }
    
    override init() {}
    
    init(wordBank : [Word]) {
        self.wordBank = wordBank
    }
    
    required init(coder decoder: NSCoder) {
        super.init()
        var count = 0
        // decodeBytesForKey() returns an UnsafePointer<Word>?, pointing to immutable data.
        if let ptr = decoder.decodeBytes(forKey: WordListKey, returnedLength: &count) {
            // If we convert it to a buffer pointer of the appropriate type and count ...
            let numValues = count / MemoryLayout<Word>.stride
            ptr.withMemoryRebound(to: Word.self, capacity: numValues) {
                let buf = UnsafeBufferPointer<Word>(start: UnsafePointer($0), count: numValues)
                wordBank = Array(buf)
            }
        }
    }
    
    public func encode(with coder: NSCoder) {
        // This encodes both the number of bytes and the data itself.
        let numBytes = wordBank.count * MemoryLayout<Word>.stride
        wordBank.withUnsafeBufferPointer {
            $0.baseAddress!.withMemoryRebound(to: UInt8.self, capacity: numBytes) {
                coder.encodeBytes($0, length: numBytes, forKey: WordListKey)
            }
        }
    }
}

struct WordList {
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let WordListArchiveURL = DocumentsDirectory.appendingPathComponent(StorageForWordList)
    
    
    struct info {
        static var index: Int = 0
        static var initialize: Bool = false
        static var wordBank = [Word]()
        static var selectedRow: VowelRow? = nil
        static var matchCondition: Bool? = nil
    }
    
    static var sharedInstance = WordList()
    
    init() {
        if debugInfo {
            AppDefinition.defaults.set(0, forKey: preferenceWordListKey)
            AppDefinition.defaults.purgeAll()
            AppDefinition.defaults.set(true, forKey: preferenceContinueGameEnabledKey)
        }
        info.index =  AppDefinition.defaults.keyExist(key: preferenceWordListKey) ? AppDefinition.defaults.integer(forKey: preferenceWordListKey) : 0
    }
}


public let random: (Int) -> Int = { Int(arc4random_uniform(UInt32($0))) }

public extension Collection {
    func shuffled() -> [Iterator.Element] {
        var array = Array(self)
        array.shuffle()
        return array
    }
}


public extension MutableCollection where Index == Int, IndexDistance == Int {
    mutating func shuffle() {
        guard count > 1 else { return }
        
        for i in 0..<count - 1 {
            let j = random(count - i) + i
            guard i != j else { continue }
            swap(&self[i], &self[j])
        }
    }
}

