//
//  WordGroupDataFront.swift
//  wrdlnk
//
//  Created by sparkle on 8/14/17.
//  Copyright © 2017 teknowsys. All rights reserved.
//

import Foundation

internal struct WordListFront {
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let WordListArchiveURL = DocumentsDirectory.appendingPathComponent("wordlist")
    
    
    fileprivate struct info {
        static var index: Int = 0
        static var initialize: Bool = false
        static var wordBank = [Word]()
        static var selectedRow: VowelRow? = nil
        static var matchCondition: Bool? = nil
    }
    
    static var sharedInstance = WordListFront()
    
    private init() {
        if debugInfo {
            AppDefinition.defaults.set(0, forKey: preferenceWordListKey)
            AppDefinition.defaults.purgeAll()
        }
        info.index =  AppDefinition.defaults.keyExist(key: preferenceWordListKey) ? AppDefinition.defaults.integer(forKey: preferenceWordListKey) : 0
    }
}

extension WordListFront {
    func level1Data() {
        
        
        info.wordBank.append(Word(prefix: "HERE", link: "AFTER", suffix: "EFFECT"))
        info.wordBank.append(Word(prefix: "HERE", link: "AFTER", suffix: "NOON"))
        info.wordBank.append(Word(prefix: "HERE", link: "AFTER", suffix: "THOUGHT"))
        
        info.wordBank.append(Word(prefix: "PINE", link: "APPLE", suffix: "SAUCE"))
        
        info.wordBank.append(Word(prefix: "FIRE", link: "ARM", suffix: "CHAIR"))
        info.wordBank.append(Word(prefix: "FIRE", link: "ARM", suffix: "HOLE"))
        info.wordBank.append(Word(prefix: "FIRE", link: "ARM", suffix: "PIT"))
        info.wordBank.append(Word(prefix: "UNDER", link: "ARM", suffix: "CHAIR"))
        info.wordBank.append(Word(prefix: "UNDER", link: "ARM", suffix: "HOLE"))
        info.wordBank.append(Word(prefix: "UNDER", link: "ARM", suffix: "PIT"))
        info.wordBank.append(Word(prefix: "YARD", link: "ARM", suffix: "CHAIR"))
        info.wordBank.append(Word(prefix: "YARD", link: "ARM", suffix: "HOLE"))
        info.wordBank.append(Word(prefix: "YARD", link: "ARM", suffix: "PIT"))
        
        // start back - cut
        info.wordBank.append(Word(prefix: "CUT", link: "BACK", suffix: "ACHE"))
        info.wordBank.append(Word(prefix: "CUT", link: "BACK", suffix: "BONE"))
        info.wordBank.append(Word(prefix: "CUT", link: "BACK", suffix: "DROP")) // 1
        info.wordBank.append(Word(prefix: "CUT", link: "BACK", suffix: "GROUND"))
        info.wordBank.append(Word(prefix: "CUT", link: "BACK", suffix: "HAND"))
        info.wordBank.append(Word(prefix: "CUT", link: "BACK", suffix: "HOE"))
        info.wordBank.append(Word(prefix: "CUT", link: "BACK", suffix: "LOG"))
        info.wordBank.append(Word(prefix: "CUT", link: "BACK", suffix: "PACK"))
        info.wordBank.append(Word(prefix: "CUT", link: "BACK", suffix: "SPACE"))
        info.wordBank.append(Word(prefix: "CUT", link: "BACK", suffix: "STABBING"))
        info.wordBank.append(Word(prefix: "CUT", link: "BACK", suffix: "STROKE"))
        info.wordBank.append(Word(prefix: "CUT", link: "BACK", suffix: "WATER"))
        info.wordBank.append(Word(prefix: "CUT", link: "BACK", suffix: "WOODS"))
        info.wordBank.append(Word(prefix: "CUT", link: "BACK", suffix: "YARD"))
        // end back
        
        // start back - feed
        info.wordBank.append(Word(prefix: "FEED", link: "BACK", suffix: "ACHE"))
        info.wordBank.append(Word(prefix: "FEED", link: "BACK", suffix: "BONE"))
        info.wordBank.append(Word(prefix: "FEED", link: "BACK", suffix: "DROP"))
        info.wordBank.append(Word(prefix: "FEED", link: "BACK", suffix: "GROUND"))
        info.wordBank.append(Word(prefix: "FEED", link: "BACK", suffix: "HAND"))
        info.wordBank.append(Word(prefix: "FEED", link: "BACK", suffix: "HOE"))
        info.wordBank.append(Word(prefix: "FEED", link: "BACK", suffix: "LOG"))
        info.wordBank.append(Word(prefix: "FEED", link: "BACK", suffix: "PACK"))
        info.wordBank.append(Word(prefix: "FEED", link: "BACK", suffix: "SPACE"))
        info.wordBank.append(Word(prefix: "FEED", link: "BACK", suffix: "STABBING"))
        info.wordBank.append(Word(prefix: "FEED", link: "BACK", suffix: "STROKE"))
        info.wordBank.append(Word(prefix: "FEED", link: "BACK", suffix: "WATER"))
        info.wordBank.append(Word(prefix: "FEED", link: "BACK", suffix: "WOODS"))
        info.wordBank.append(Word(prefix: "FEED", link: "BACK", suffix: "YARD"))
        // end back
        
        // start back - green
        info.wordBank.append(Word(prefix: "GREEN", link: "BACK", suffix: "ACHE"))
        info.wordBank.append(Word(prefix: "GREEN", link: "BACK", suffix: "BONE"))
        info.wordBank.append(Word(prefix: "GREEN", link: "BACK", suffix: "DROP"))
        info.wordBank.append(Word(prefix: "GREEN", link: "BACK", suffix: "GROUND"))
        info.wordBank.append(Word(prefix: "GREEN", link: "BACK", suffix: "HAND"))
        info.wordBank.append(Word(prefix: "GREEN", link: "BACK", suffix: "HOE"))
        info.wordBank.append(Word(prefix: "GREEN", link: "BACK", suffix: "LOG"))
        info.wordBank.append(Word(prefix: "GREEN", link: "BACK", suffix: "PACK"))
        info.wordBank.append(Word(prefix: "GREEN", link: "BACK", suffix: "SPACE"))
        info.wordBank.append(Word(prefix: "GREEN", link: "BACK", suffix: "STABBING"))
        info.wordBank.append(Word(prefix: "GREEN", link: "BACK", suffix: "STROKE"))
        info.wordBank.append(Word(prefix: "GREEN", link: "BACK", suffix: "WATER"))
        info.wordBank.append(Word(prefix: "GREEN", link: "BACK", suffix: "WOODS"))
        info.wordBank.append(Word(prefix: "GREEN", link: "BACK", suffix: "YARD"))
        // end back
        
        // start back - half
        info.wordBank.append(Word(prefix: "HALF", link: "BACK", suffix: "ACHE"))
        info.wordBank.append(Word(prefix: "HALF", link: "BACK", suffix: "BONE"))
        info.wordBank.append(Word(prefix: "HALF", link: "BACK", suffix: "DROP"))
        info.wordBank.append(Word(prefix: "HALF", link: "BACK", suffix: "GROUND"))
        info.wordBank.append(Word(prefix: "HALF", link: "BACK", suffix: "HAND"))
        info.wordBank.append(Word(prefix: "HALF", link: "BACK", suffix: "HOE"))
        info.wordBank.append(Word(prefix: "HALF", link: "BACK", suffix: "LOG"))
        info.wordBank.append(Word(prefix: "HALF", link: "BACK", suffix: "PACK"))
        info.wordBank.append(Word(prefix: "HALF", link: "BACK", suffix: "SPACE"))
        info.wordBank.append(Word(prefix: "HALF", link: "BACK", suffix: "STABBING"))
        info.wordBank.append(Word(prefix: "HALF", link: "BACK", suffix: "STROKE"))
        info.wordBank.append(Word(prefix: "HALF", link: "BACK", suffix: "WATER"))
        info.wordBank.append(Word(prefix: "HALF", link: "BACK", suffix: "WOODS"))
        info.wordBank.append(Word(prefix: "HALF", link: "BACK", suffix: "YARD"))
        // end back
        
        // start back - horse
        info.wordBank.append(Word(prefix: "HORSE", link: "BACK", suffix: "ACHE"))
        info.wordBank.append(Word(prefix: "HORSE", link: "BACK", suffix: "BONE"))
        info.wordBank.append(Word(prefix: "HORSE", link: "BACK", suffix: "DROP"))
        info.wordBank.append(Word(prefix: "HORSE", link: "BACK", suffix: "GROUND"))
        info.wordBank.append(Word(prefix: "HORSE", link: "BACK", suffix: "HAND"))
        info.wordBank.append(Word(prefix: "HORSE", link: "BACK", suffix: "HOE"))
        info.wordBank.append(Word(prefix: "HORSE", link: "BACK", suffix: "LOG"))
        info.wordBank.append(Word(prefix: "HORSE", link: "BACK", suffix: "PACK"))
        info.wordBank.append(Word(prefix: "HORSE", link: "BACK", suffix: "SPACE"))
        info.wordBank.append(Word(prefix: "HORSE", link: "BACK", suffix: "STABBING"))
        info.wordBank.append(Word(prefix: "HORSE", link: "BACK", suffix: "STROKE"))
        info.wordBank.append(Word(prefix: "HORSE", link: "BACK", suffix: "WATER"))
        info.wordBank.append(Word(prefix: "HORSE", link: "BACK", suffix: "WOODS"))
        info.wordBank.append(Word(prefix: "HORSE", link: "BACK", suffix: "YARD"))
        // end back
        
        // start back - hump
        info.wordBank.append(Word(prefix: "HUMP", link: "BACK", suffix: "ACHE"))
        info.wordBank.append(Word(prefix: "HUMP", link: "BACK", suffix: "BONE"))
        info.wordBank.append(Word(prefix: "HUMP", link: "BACK", suffix: "DROP"))
        info.wordBank.append(Word(prefix: "HUMP", link: "BACK", suffix: "GROUND"))
        info.wordBank.append(Word(prefix: "HUMP", link: "BACK", suffix: "HAND"))
        info.wordBank.append(Word(prefix: "HUMP", link: "BACK", suffix: "HOE"))
        info.wordBank.append(Word(prefix: "HUMP", link: "BACK", suffix: "LOG"))
        info.wordBank.append(Word(prefix: "HUMP", link: "BACK", suffix: "PACK"))
        info.wordBank.append(Word(prefix: "HUMP", link: "BACK", suffix: "SPACE"))
        info.wordBank.append(Word(prefix: "HUMP", link: "BACK", suffix: "STABBING"))
        info.wordBank.append(Word(prefix: "HUMP", link: "BACK", suffix: "STROKE"))
        info.wordBank.append(Word(prefix: "HUMP", link: "BACK", suffix: "WATER"))
        info.wordBank.append(Word(prefix: "HUMP", link: "BACK", suffix: "WOODS"))
        info.wordBank.append(Word(prefix: "HUMP", link: "BACK", suffix: "YARD"))
        // end back
        
        // start back - hunch
        info.wordBank.append(Word(prefix: "HUNCH", link: "BACK", suffix: "ACHE"))
        info.wordBank.append(Word(prefix: "HUNCH", link: "BACK", suffix: "BONE"))
        info.wordBank.append(Word(prefix: "HUNCH", link: "BACK", suffix: "DROP"))
        info.wordBank.append(Word(prefix: "HUNCH", link: "BACK", suffix: "GROUND"))
        info.wordBank.append(Word(prefix: "HUNCH", link: "BACK", suffix: "HAND"))
        info.wordBank.append(Word(prefix: "HUNCH", link: "BACK", suffix: "HOE"))
        info.wordBank.append(Word(prefix: "HUNCH", link: "BACK", suffix: "LOG"))
        info.wordBank.append(Word(prefix: "HUNCH", link: "BACK", suffix: "PACK"))
        info.wordBank.append(Word(prefix: "HUNCH", link: "BACK", suffix: "SPACE"))
        info.wordBank.append(Word(prefix: "HUNCH", link: "BACK", suffix: "STABBING"))
        info.wordBank.append(Word(prefix: "HUNCH", link: "BACK", suffix: "STROKE"))
        info.wordBank.append(Word(prefix: "HUNCH", link: "BACK", suffix: "WATER"))
        info.wordBank.append(Word(prefix: "HUNCH", link: "BACK", suffix: "WOODS"))
        info.wordBank.append(Word(prefix: "HUNCH", link: "BACK", suffix: "YARD"))
        // end back
        
        // start back - paper
        info.wordBank.append(Word(prefix: "PAPER", link: "BACK", suffix: "ACHE"))
        info.wordBank.append(Word(prefix: "PAPER", link: "BACK", suffix: "BONE"))
        info.wordBank.append(Word(prefix: "PAPER", link: "BACK", suffix: "DROP"))
        info.wordBank.append(Word(prefix: "PAPER", link: "BACK", suffix: "GROUND"))
        info.wordBank.append(Word(prefix: "PAPER", link: "BACK", suffix: "HAND"))
        info.wordBank.append(Word(prefix: "PAPER", link: "BACK", suffix: "HOE"))
        info.wordBank.append(Word(prefix: "PAPER", link: "BACK", suffix: "LOG"))
        info.wordBank.append(Word(prefix: "PAPER", link: "BACK", suffix: "PACK"))
        info.wordBank.append(Word(prefix: "PAPER", link: "BACK", suffix: "SPACE"))
        info.wordBank.append(Word(prefix: "PAPER", link: "BACK", suffix: "STABBING"))
        info.wordBank.append(Word(prefix: "PAPER", link: "BACK", suffix: "STROKE"))
        info.wordBank.append(Word(prefix: "PAPER", link: "BACK", suffix: "WATER"))
        info.wordBank.append(Word(prefix: "PAPER", link: "BACK", suffix: "WOODS"))
        info.wordBank.append(Word(prefix: "PAPER", link: "BACK", suffix: "YARD"))
        // end back
        
        // start back - piggy
        info.wordBank.append(Word(prefix: "PIGGY", link: "BACK", suffix: "ACHE"))
        info.wordBank.append(Word(prefix: "PIGGY", link: "BACK", suffix: "BONE"))
        info.wordBank.append(Word(prefix: "PIGGY", link: "BACK", suffix: "DROP"))
        info.wordBank.append(Word(prefix: "PIGGY", link: "BACK", suffix: "GROUND"))
        info.wordBank.append(Word(prefix: "PIGGY", link: "BACK", suffix: "HAND"))
        info.wordBank.append(Word(prefix: "PIGGY", link: "BACK", suffix: "HOE"))
        info.wordBank.append(Word(prefix: "PIGGY", link: "BACK", suffix: "LOG"))
        info.wordBank.append(Word(prefix: "PIGGY", link: "BACK", suffix: "PACK"))
        info.wordBank.append(Word(prefix: "PIGGY", link: "BACK", suffix: "SPACE"))
        info.wordBank.append(Word(prefix: "PIGGY", link: "BACK", suffix: "STABBING"))
        info.wordBank.append(Word(prefix: "PIGGY", link: "BACK", suffix: "STROKE"))
        info.wordBank.append(Word(prefix: "PIGGY", link: "BACK", suffix: "WATER"))
        info.wordBank.append(Word(prefix: "PIGGY", link: "BACK", suffix: "WOODS"))
        info.wordBank.append(Word(prefix: "PIGGY", link: "BACK", suffix: "YARD"))
        // end back
        
        // start back - quarter
        info.wordBank.append(Word(prefix: "QUARTER", link: "BACK", suffix: "ACHE"))
        info.wordBank.append(Word(prefix: "QUARTER", link: "BACK", suffix: "BONE"))
        info.wordBank.append(Word(prefix: "QUARTER", link: "BACK", suffix: "DROP"))
        info.wordBank.append(Word(prefix: "QUARTER", link: "BACK", suffix: "GROUND"))
        info.wordBank.append(Word(prefix: "QUARTER", link: "BACK", suffix: "HAND"))
        info.wordBank.append(Word(prefix: "QUARTER", link: "BACK", suffix: "HOE"))
        info.wordBank.append(Word(prefix: "QUARTER", link: "BACK", suffix: "LOG"))
        info.wordBank.append(Word(prefix: "QUARTER", link: "BACK", suffix: "PACK"))
        info.wordBank.append(Word(prefix: "QUARTER", link: "BACK", suffix: "SPACE"))
        info.wordBank.append(Word(prefix: "QUARTER", link: "BACK", suffix: "STABBING"))
        info.wordBank.append(Word(prefix: "QUARTER", link: "BACK", suffix: "STROKE"))
        info.wordBank.append(Word(prefix: "QUARTER", link: "BACK", suffix: "WATER"))
        info.wordBank.append(Word(prefix: "QUARTER", link: "BACK", suffix: "WOODS"))
        info.wordBank.append(Word(prefix: "QUARTER", link: "BACK", suffix: "YARD"))
        // end back
        
        // start back - set
        info.wordBank.append(Word(prefix: "SET", link: "BACK", suffix: "ACHE"))
        info.wordBank.append(Word(prefix: "SET", link: "BACK", suffix: "BONE"))
        info.wordBank.append(Word(prefix: "SET", link: "BACK", suffix: "DROP"))
        info.wordBank.append(Word(prefix: "SET", link: "BACK", suffix: "GROUND"))
        info.wordBank.append(Word(prefix: "SET", link: "BACK", suffix: "HAND"))
        info.wordBank.append(Word(prefix: "SET", link: "BACK", suffix: "HOE"))
        info.wordBank.append(Word(prefix: "SET", link: "BACK", suffix: "LOG"))
        info.wordBank.append(Word(prefix: "SET", link: "BACK", suffix: "PACK"))
        info.wordBank.append(Word(prefix: "SET", link: "BACK", suffix: "SPACE"))
        info.wordBank.append(Word(prefix: "SET", link: "BACK", suffix: "STABBING"))
        info.wordBank.append(Word(prefix: "SET", link: "BACK", suffix: "STROKE"))
        info.wordBank.append(Word(prefix: "SET", link: "BACK", suffix: "WATER"))
        info.wordBank.append(Word(prefix: "SET", link: "BACK", suffix: "WOODS"))
        info.wordBank.append(Word(prefix: "SET", link: "BACK", suffix: "YARD"))
        // end back
        
        // start back - tail
        info.wordBank.append(Word(prefix: "TAIL", link: "BACK", suffix: "ACHE"))
        info.wordBank.append(Word(prefix: "TAIL", link: "BACK", suffix: "BONE"))
        info.wordBank.append(Word(prefix: "TAIL", link: "BACK", suffix: "DROP"))
        info.wordBank.append(Word(prefix: "TAIL", link: "BACK", suffix: "GROUND"))
        info.wordBank.append(Word(prefix: "TAIL", link: "BACK", suffix: "HAND"))
        info.wordBank.append(Word(prefix: "TAIL", link: "BACK", suffix: "HOE"))
        info.wordBank.append(Word(prefix: "TAIL", link: "BACK", suffix: "LOG"))
        info.wordBank.append(Word(prefix: "TAIL", link: "BACK", suffix: "PACK"))
        info.wordBank.append(Word(prefix: "TAIL", link: "BACK", suffix: "SPACE"))
        info.wordBank.append(Word(prefix: "TAIL", link: "BACK", suffix: "STABBING"))
        info.wordBank.append(Word(prefix: "TAIL", link: "BACK", suffix: "STROKE"))
        info.wordBank.append(Word(prefix: "TAIL", link: "BACK", suffix: "WATER"))
        info.wordBank.append(Word(prefix: "TAIL", link: "BACK", suffix: "WOODS"))
        info.wordBank.append(Word(prefix: "TAIL", link: "BACK", suffix: "YARD"))
        // end back
        
        info.wordBank.append(Word(prefix: "AIR", link: "BAG", suffix: "PIPES"))
        info.wordBank.append(Word(prefix: "HAND", link: "BAG", suffix: "PIPES"))
        
        info.wordBank.append(Word(prefix: "BASE", link: "BALL", suffix: "PLAYER"))
        info.wordBank.append(Word(prefix: "BASKET", link: "BALL", suffix: "PLAYER"))
        info.wordBank.append(Word(prefix: "EYE", link: "BALL", suffix: "PLAYER"))
        info.wordBank.append(Word(prefix: "FOOT", link: "BALL", suffix: "PLAYER"))
        info.wordBank.append(Word(prefix: "HAND", link: "BALL", suffix: "PLAYER"))
        info.wordBank.append(Word(prefix: "MEAT", link: "BALL", suffix: "PLAYER"))
        info.wordBank.append(Word(prefix: "SNOW", link: "BALL", suffix: "PLAYER"))
        info.wordBank.append(Word(prefix: "SOFT", link: "BALL", suffix: "PLAYER"))
        info.wordBank.append(Word(prefix: "VOLLEY", link: "BALL", suffix: "PLAYER"))
        
        info.wordBank.append(Word(prefix: "CROW", link: "BAR", suffix: "CODE"))
        info.wordBank.append(Word(prefix: "SAND", link: "BAR", suffix: "CODE"))
        
        info.wordBank.append(Word(prefix: "DATA", link: "BASE", suffix: "BALL"))
        
        info.wordBank.append(Word(prefix: "BREAD", link: "BASKET", suffix: "BALL"))
        
        info.wordBank.append(Word(prefix: "JELLY", link: "BEAN", suffix: "CURD"))
        info.wordBank.append(Word(prefix: "SOY", link: "BEAN", suffix: "CURD"))
        
        info.wordBank.append(Word(prefix: "FLOWER", link: "BED", suffix: "SPREAD"))
        info.wordBank.append(Word(prefix: "FLOWER", link: "BED", suffix: "ROCK"))
        info.wordBank.append(Word(prefix: "FLOWER", link: "BED", suffix: "ROOM"))
        info.wordBank.append(Word(prefix: "FLOWER", link: "BED", suffix: "TIME"))
        
        info.wordBank.append(Word(prefix: "HOT", link: "BED", suffix: "SPREAD"))
        info.wordBank.append(Word(prefix: "HOT", link: "BED", suffix: "ROCK"))
        info.wordBank.append(Word(prefix: "HOT", link: "BED", suffix: "ROOM"))
        info.wordBank.append(Word(prefix: "HOT", link: "BED", suffix: "TIME"))
        
        info.wordBank.append(Word(prefix: "LAKE", link: "BED", suffix: "SPREAD"))
        info.wordBank.append(Word(prefix: "LAKE", link: "BED", suffix: "ROCK"))
        info.wordBank.append(Word(prefix: "LAKE", link: "BED", suffix: "ROOM"))
        info.wordBank.append(Word(prefix: "LAKE", link: "BED", suffix: "TIME"))
        
        info.wordBank.append(Word(prefix: "LAKE", link: "BED", suffix: "SPREAD"))
        info.wordBank.append(Word(prefix: "LAKE", link: "BED", suffix: "ROCK"))
        info.wordBank.append(Word(prefix: "LAKE", link: "BED", suffix: "ROOM"))
        info.wordBank.append(Word(prefix: "LAKE", link: "BED", suffix: "TIME"))
        
        info.wordBank.append(Word(prefix: "RIVER", link: "BED", suffix: "SPREAD"))
        info.wordBank.append(Word(prefix: "RIVER", link: "BED", suffix: "ROCK"))
        info.wordBank.append(Word(prefix: "RIVER", link: "BED", suffix: "ROOM"))
        info.wordBank.append(Word(prefix: "RIVER", link: "BED", suffix: "TIME"))
        
        info.wordBank.append(Word(prefix: "ROAD", link: "BED", suffix: "SPREAD"))
        info.wordBank.append(Word(prefix: "ROAD", link: "BED", suffix: "ROCK"))
        info.wordBank.append(Word(prefix: "ROAD", link: "BED", suffix: "ROOM"))
        info.wordBank.append(Word(prefix: "ROAD", link: "BED", suffix: "TIME"))
        
        info.wordBank.append(Word(prefix: "SEA", link: "BED", suffix: "SPREAD"))
        info.wordBank.append(Word(prefix: "SEA", link: "BED", suffix: "ROCK"))
        info.wordBank.append(Word(prefix: "SEA", link: "BED", suffix: "ROOM"))
        info.wordBank.append(Word(prefix: "SEA", link: "BED", suffix: "TIME"))
        
        info.wordBank.append(Word(prefix: "WATER", link: "BED", suffix: "SPREAD"))
        info.wordBank.append(Word(prefix: "WATER", link: "BED", suffix: "ROCK"))
        info.wordBank.append(Word(prefix: "WATER", link: "BED", suffix: "ROOM"))
        info.wordBank.append(Word(prefix: "WATER", link: "BED", suffix: "TIME"))
        
        
        info.wordBank.append(Word(prefix: "HONEY", link: "BEE", suffix: "HIVE"))
        info.wordBank.append(Word(prefix: "HONEY", link: "BEE", suffix: "KEEPER"))
        info.wordBank.append(Word(prefix: "HONEY", link: "BEE", suffix: "KEEPING"))
        info.wordBank.append(Word(prefix: "HONEY", link: "BEES", suffix: "WAX"))
        
        info.wordBank.append(Word(prefix: "COW", link: "BELL", suffix: "HOP"))
        info.wordBank.append(Word(prefix: "DOOR", link: "BELL", suffix: "HOP"))
        info.wordBank.append(Word(prefix: "DUMB", link: "BELL", suffix: "HOP"))
        info.wordBank.append(Word(prefix: "DUCK", link: "BILL", suffix: "BOARD"))
        
        info.wordBank.append(Word(prefix: "CHILD", link: "BIRTH", suffix: "DAY"))
        info.wordBank.append(Word(prefix: "CHILD", link: "BIRTH", suffix: "PLACE"))
        info.wordBank.append(Word(prefix: "CHILD", link: "BIRTH", suffix: "RATE"))
        info.wordBank.append(Word(prefix: "CHILD", link: "BIRTH", suffix: "RIGHT"))
        info.wordBank.append(Word(prefix: "ANY", link: "BODY", suffix: "GUARD"))
        info.wordBank.append(Word(prefix: "EVERY", link: "BODY", suffix: "GUARD"))
        info.wordBank.append(Word(prefix: "NO", link: "BODY", suffix: "GUARD"))
        info.wordBank.append(Word(prefix: "SOME", link: "BODY", suffix: "GUARD"))
        
        info.wordBank.append(Word(prefix: "COOK", link: "BOOK", suffix: "BINDER"))
        info.wordBank.append(Word(prefix: "GUIDE", link: "BOOK", suffix: "BINDER"))
        info.wordBank.append(Word(prefix: "HAND", link: "BOOK", suffix: "BINDER"))
        info.wordBank.append(Word(prefix: "MATCH", link: "BOOK", suffix: "BINDER"))
        info.wordBank.append(Word(prefix: "NOTE", link: "BOOK", suffix: "BINDER"))
        info.wordBank.append(Word(prefix: "PASS", link: "BOOK", suffix: "BINDER"))
        info.wordBank.append(Word(prefix: "POCKET", link: "BOOK", suffix: "BINDER"))
        info.wordBank.append(Word(prefix: "SCRAP", link: "BOOK", suffix: "BINDER"))
        info.wordBank.append(Word(prefix: "TEXT", link: "BOOK", suffix: "BINDER"))
        info.wordBank.append(Word(prefix: "WORK", link: "BOOK", suffix: "BINDER"))
        info.wordBank.append(Word(prefix: "YEAR", link: "BOOK", suffix: "BINDER"))
        
        info.wordBank.append(Word(prefix: "COOK", link: "BOOK", suffix: "CASE"))
        info.wordBank.append(Word(prefix: "GUIDE", link: "BOOK", suffix: "CASE"))
        info.wordBank.append(Word(prefix: "HAND", link: "BOOK", suffix: "CASE"))
        info.wordBank.append(Word(prefix: "MATCH", link: "BOOK", suffix: "CASE"))
        info.wordBank.append(Word(prefix: "NOTE", link: "BOOK", suffix: "CASE"))
        info.wordBank.append(Word(prefix: "PASS", link: "BOOK", suffix: "CASE"))
        info.wordBank.append(Word(prefix: "POCKET", link: "BOOK", suffix: "CASE"))
        info.wordBank.append(Word(prefix: "SCRAP", link: "BOOK", suffix: "CASE"))
        info.wordBank.append(Word(prefix: "TEXT", link: "BOOK", suffix: "CASE"))
        info.wordBank.append(Word(prefix: "WORK", link: "BOOK", suffix: "CASE"))
        info.wordBank.append(Word(prefix: "YEAR", link: "BOOK", suffix: "CASE"))
        
        info.wordBank.append(Word(prefix: "COOK", link: "BOOK", suffix: "KEEPER"))
        info.wordBank.append(Word(prefix: "GUIDE", link: "BOOK", suffix: "KEEPER"))
        info.wordBank.append(Word(prefix: "HAND", link: "BOOK", suffix: "KEEPER"))
        info.wordBank.append(Word(prefix: "MATCH", link: "BOOK", suffix: "KEEPER"))
        info.wordBank.append(Word(prefix: "NOTE", link: "BOOK", suffix: "KEEPER"))
        info.wordBank.append(Word(prefix: "PASS", link: "BOOK", suffix: "KEEPER"))
        info.wordBank.append(Word(prefix: "POCKET", link: "BOOK", suffix: "KEEPER"))
        info.wordBank.append(Word(prefix: "SCRAP", link: "BOOK", suffix: "KEEPER"))
        info.wordBank.append(Word(prefix: "TEXT", link: "BOOK", suffix: "KEEPER"))
        info.wordBank.append(Word(prefix: "WORK", link: "BOOK", suffix: "KEEPER"))
        info.wordBank.append(Word(prefix: "YEAR", link: "BOOK", suffix: "KEEPER"))
        
        info.wordBank.append(Word(prefix: "COOK", link: "BOOK", suffix: "MARK"))
        info.wordBank.append(Word(prefix: "GUIDE", link: "BOOK", suffix: "MARK"))
        info.wordBank.append(Word(prefix: "HAND", link: "BOOK", suffix: "MARK"))
        info.wordBank.append(Word(prefix: "MATCH", link: "BOOK", suffix: "MARK"))
        info.wordBank.append(Word(prefix: "NOTE", link: "BOOK", suffix: "MARK"))
        info.wordBank.append(Word(prefix: "PASS", link: "BOOK", suffix: "MARK"))
        info.wordBank.append(Word(prefix: "POCKET", link: "BOOK", suffix: "MARK"))
        info.wordBank.append(Word(prefix: "SCRAP", link: "BOOK", suffix: "MARK"))
        info.wordBank.append(Word(prefix: "TEXT", link: "BOOK", suffix: "MARK"))
        info.wordBank.append(Word(prefix: "WORK", link: "BOOK", suffix: "MARK"))
        info.wordBank.append(Word(prefix: "YEAR", link: "BOOK", suffix: "MARK"))
        
        info.wordBank.append(Word(prefix: "COOK", link: "BOOK", suffix: "MOBILE"))
        info.wordBank.append(Word(prefix: "GUIDE", link: "BOOK", suffix: "MOBILE"))
        info.wordBank.append(Word(prefix: "HAND", link: "BOOK", suffix: "MOBILE"))
        info.wordBank.append(Word(prefix: "MATCH", link: "BOOK", suffix: "MOBILE"))
        info.wordBank.append(Word(prefix: "NOTE", link: "BOOK", suffix: "MOBILE"))
        info.wordBank.append(Word(prefix: "PASS", link: "BOOK", suffix: "MOBILE"))
        info.wordBank.append(Word(prefix: "POCKET", link: "BOOK", suffix: "MOBILE"))
        info.wordBank.append(Word(prefix: "SCRAP", link: "BOOK", suffix: "MOBILE"))
        info.wordBank.append(Word(prefix: "TEXT", link: "BOOK", suffix: "MOBILE"))
        info.wordBank.append(Word(prefix: "WORK", link: "BOOK", suffix: "MOBILE"))
        info.wordBank.append(Word(prefix: "YEAR", link: "BOOK", suffix: "MOBILE"))
        
        info.wordBank.append(Word(prefix: "COOK", link: "BOOK", suffix: "SHELF"))
        info.wordBank.append(Word(prefix: "GUIDE", link: "BOOK", suffix: "SHELF"))
        info.wordBank.append(Word(prefix: "HAND", link: "BOOK", suffix: "SHELF"))
        info.wordBank.append(Word(prefix: "MATCH", link: "BOOK", suffix: "SHELF"))
        info.wordBank.append(Word(prefix: "NOTE", link: "BOOK", suffix: "SHELF"))
        info.wordBank.append(Word(prefix: "PASS", link: "BOOK", suffix: "SHELF"))
        info.wordBank.append(Word(prefix: "POCKET", link: "BOOK", suffix: "SHELF"))
        info.wordBank.append(Word(prefix: "SCRAP", link: "BOOK", suffix: "SHELF"))
        info.wordBank.append(Word(prefix: "TEXT", link: "BOOK", suffix: "SHELF"))
        info.wordBank.append(Word(prefix: "WORK", link: "BOOK", suffix: "SHELF"))
        info.wordBank.append(Word(prefix: "YEAR", link: "BOOK", suffix: "SHELF"))
        
        info.wordBank.append(Word(prefix: "COOK", link: "BOOK", suffix: "WORM"))
        info.wordBank.append(Word(prefix: "GUIDE", link: "BOOK", suffix: "WORM"))
        info.wordBank.append(Word(prefix: "HAND", link: "BOOK", suffix: "WORM"))
        info.wordBank.append(Word(prefix: "MATCH", link: "BOOK", suffix: "WORM"))
        info.wordBank.append(Word(prefix: "NOTE", link: "BOOK", suffix: "WORM"))
        info.wordBank.append(Word(prefix: "PASS", link: "BOOK", suffix: "WORM"))
        info.wordBank.append(Word(prefix: "POCKET", link: "BOOK", suffix: "WORM"))
        info.wordBank.append(Word(prefix: "SCRAP", link: "BOOK", suffix: "WORM"))
        info.wordBank.append(Word(prefix: "TEXT", link: "BOOK", suffix: "WORM"))
        info.wordBank.append(Word(prefix: "WORK", link: "BOOK", suffix: "WORM"))
        info.wordBank.append(Word(prefix: "YEAR", link: "BOOK", suffix: "WORM"))
        
        info.wordBank.append(Word(prefix: "CROSS", link: "BOW", suffix: "LEGGED"))
        info.wordBank.append(Word(prefix: "FISH", link: "BOW", suffix: "LEGGED"))
        info.wordBank.append(Word(prefix: "OX", link: "BOW", suffix: "LEGGED"))
        info.wordBank.append(Word(prefix: "RAIN", link: "BOW", suffix: "LEGGED"))
        
        info.wordBank.append(Word(prefix: "BREAD", link: "BOX", suffix: "CAR"))
        info.wordBank.append(Word(prefix: "BREAD", link: "BOX", suffix: "CUTTER"))
        info.wordBank.append(Word(prefix: "BREAD", link: "BOX", suffix: "SPRINGS"))
        
        info.wordBank.append(Word(prefix: "MAIL", link: "BOX", suffix: "CAR"))
        info.wordBank.append(Word(prefix: "MAIL", link: "BOX", suffix: "CUTTER"))
        info.wordBank.append(Word(prefix: "MAIL", link: "BOX", suffix: "SPRINGS"))
        
        info.wordBank.append(Word(prefix: "PILL", link: "BOX", suffix: "CAR"))
        info.wordBank.append(Word(prefix: "PILL", link: "BOX", suffix: "CUTTER"))
        info.wordBank.append(Word(prefix: "PILL", link: "BOX", suffix: "SPRINGS"))
        
        info.wordBank.append(Word(prefix: "SAND", link: "BOX", suffix: "CAR"))
        info.wordBank.append(Word(prefix: "SAND", link: "BOX", suffix: "CUTTER"))
        info.wordBank.append(Word(prefix: "SAND", link: "BOX", suffix: "SPRINGS"))
        
        info.wordBank.append(Word(prefix: "STRONG", link: "BOX", suffix: "CAR"))
        info.wordBank.append(Word(prefix: "STRONG", link: "BOX", suffix: "CUTTER"))
        info.wordBank.append(Word(prefix: "STRONG", link: "BOX", suffix: "SPRINGS"))
        
        info.wordBank.append(Word(prefix: "TOOL", link: "BOX", suffix: "CAR"))
        info.wordBank.append(Word(prefix: "TOOL", link: "BOX", suffix: "CUTTER"))
        info.wordBank.append(Word(prefix: "TOOL", link: "BOX", suffix: "SPRINGS"))
        
        info.wordBank.append(Word(prefix: "SCATTER", link: "BRAIN", suffix: "STORM"))
        info.wordBank.append(Word(prefix: "SCATTER", link: "BRAIN", suffix: "WASH"))
        
        info.wordBank.append(Word(prefix: "EYE", link: "BROW", suffix: "BEAT"))
        info.wordBank.append(Word(prefix: "HIGH", link: "BROW", suffix: "BEAT"))
        info.wordBank.append(Word(prefix: "LOW", link: "BROW", suffix: "BEAT"))
        
        info.wordBank.append(Word(prefix: "CORN", link: "BREAD", suffix: "BASKET"))
        info.wordBank.append(Word(prefix: "CORN", link: "BREAD", suffix: "BOX"))
        info.wordBank.append(Word(prefix: "CORN", link: "BREAD", suffix: "CRUMBS"))
        info.wordBank.append(Word(prefix: "CORN", link: "BREAD", suffix: "FRUIT"))
        info.wordBank.append(Word(prefix: "CORN", link: "BREAD", suffix: "KNIFE"))
        info.wordBank.append(Word(prefix: "CORN", link: "BREAD", suffix: "STICK"))
        info.wordBank.append(Word(prefix: "GINGER", link: "BREAD", suffix: "BASKET"))
        info.wordBank.append(Word(prefix: "GINGER", link: "BREAD", suffix: "BOX"))
        info.wordBank.append(Word(prefix: "GINGER", link: "BREAD", suffix: "CRUMBS"))
        info.wordBank.append(Word(prefix: "GINGER", link: "BREAD", suffix: "FRUIT"))
        info.wordBank.append(Word(prefix: "GINGER", link: "BREAD", suffix: "KNIFE"))
        info.wordBank.append(Word(prefix: "GINGER", link: "BREAD", suffix: "STICK"))
        info.wordBank.append(Word(prefix: "SHORT", link: "BREAD", suffix: "BASKET"))
        info.wordBank.append(Word(prefix: "SHORT", link: "BREAD", suffix: "BOX"))
        info.wordBank.append(Word(prefix: "SHORT", link: "BREAD", suffix: "CRUMBS"))
        info.wordBank.append(Word(prefix: "SHORT", link: "BREAD", suffix: "FRUIT"))
        info.wordBank.append(Word(prefix: "SHORT", link: "BREAD", suffix: "KNIFE"))
        info.wordBank.append(Word(prefix: "SHORT", link: "BREAD", suffix: "STICK"))
        
        info.wordBank.append(Word(prefix: "DAY", link: "BREAK", suffix: "DANCE"))
        info.wordBank.append(Word(prefix: "DAY", link: "BREAK", suffix: "FAST"))
        info.wordBank.append(Word(prefix: "DAY", link: "BREAK", suffix: "FRONT"))
        info.wordBank.append(Word(prefix: "DAY", link: "BREAK", suffix: "NECK"))
        info.wordBank.append(Word(prefix: "DAY", link: "BREAK", suffix: "OUT"))
        info.wordBank.append(Word(prefix: "DAY", link: "BREAK", suffix: "THROUGH"))
        info.wordBank.append(Word(prefix: "DAY", link: "BREAK", suffix: "UP"))
        info.wordBank.append(Word(prefix: "DAY", link: "BREAK", suffix: "WATER"))
        
        info.wordBank.append(Word(prefix: "JAW", link: "BREAK", suffix: "DANCE"))
        info.wordBank.append(Word(prefix: "JAW", link: "BREAK", suffix: "FAST"))
        info.wordBank.append(Word(prefix: "JAW", link: "BREAK", suffix: "FRONT"))
        info.wordBank.append(Word(prefix: "JAW", link: "BREAK", suffix: "NECK"))
        info.wordBank.append(Word(prefix: "JAW", link: "BREAK", suffix: "OUT"))
        info.wordBank.append(Word(prefix: "JAW", link: "BREAK", suffix: "THROUGH"))
        info.wordBank.append(Word(prefix: "JAW", link: "BREAK", suffix: "UP"))
        info.wordBank.append(Word(prefix: "JAW", link: "BREAK", suffix: "WATER"))
        
        info.wordBank.append(Word(prefix: "TOOTH", link: "HAIR", suffix: "BRUSH"))
        
        info.wordBank.append(Word(prefix: "PIT", link: "BULL", suffix: "DOG"))
        info.wordBank.append(Word(prefix: "PIT", link: "BULL", suffix: "DOZER"))
        info.wordBank.append(Word(prefix: "PIT", link: "BULL", suffix: "FROG"))
        
        info.wordBank.append(Word(prefix: "PEANUT", link: "BUTTER", suffix: "CUP"))
        info.wordBank.append(Word(prefix: "PEANUT", link: "BUTTER", suffix: "FINGERS"))
        info.wordBank.append(Word(prefix: "PEANUT", link: "BUTTER", suffix: "FLY"))
        info.wordBank.append(Word(prefix: "PEANUT", link: "BUTTER", suffix: "MILK"))
        
        info.wordBank.append(Word(prefix: "FISH", link: "EYE", suffix: "COAT"))
        info.wordBank.append(Word(prefix: "RED", link: "EYE", suffix: "LASH"))
        info.wordBank.append(Word(prefix: "SHUT", link: "EYE", suffix: "BROW"))
        
        info.wordBank.append(Word(prefix: "BOB", link: "CAT", suffix: "FISH"))
        info.wordBank.append(Word(prefix: "COPY", link: "CAT", suffix: "NAP"))
        info.wordBank.append(Word(prefix: "POLE", link: "CAT", suffix: "NIP"))
        info.wordBank.append(Word(prefix: "TOM", link: "CAT", suffix: "WALK"))
        info.wordBank.append(Word(prefix: "WILD", link: "CAT", suffix: "WALK"))
        
        info.wordBank.append(Word(prefix: "BOX", link: "CAR", suffix: "BRAKE"))
        info.wordBank.append(Word(prefix: "SIDE", link: "CAR", suffix: "PORT"))
        info.wordBank.append(Word(prefix: "RACE", link: "CAR", suffix: "TRACK"))
        info.wordBank.append(Word(prefix: "SIDE", link: "CAR", suffix: "RIDE"))
        info.wordBank.append(Word(prefix: "STREET", link: "CAR", suffix: "RIDE"))
        
        info.wordBank.append(Word(prefix: "ARM", link: "CHAIR", suffix: "MAN"))
        info.wordBank.append(Word(prefix: "ARM", link: "CHAIR", suffix: "WOMAN"))
        info.wordBank.append(Word(prefix: "HIGH", link: "CHAIR", suffix: "MAN"))
        info.wordBank.append(Word(prefix: "HIGH", link: "CHAIR", suffix: "WOMAN"))
        info.wordBank.append(Word(prefix: "WHEEL", link: "CHAIR", suffix: "MAN"))
        info.wordBank.append(Word(prefix: "WHEEL", link: "CHAIR", suffix: "WOMAN"))
        
        info.wordBank.append(Word(prefix: "SWALLOW", link: "TAIL", suffix: "BACK"))
        info.wordBank.append(Word(prefix: "SWALLOW", link: "TAIL", suffix: "SPIN"))
        info.wordBank.append(Word(prefix: "BOB", link: "TAIL", suffix: "BACK"))
        info.wordBank.append(Word(prefix: "BOB", link: "TAIL", suffix: "SPIN"))
        info.wordBank.append(Word(prefix: "PIG", link: "TAIL", suffix: "BACK"))
        info.wordBank.append(Word(prefix: "PIG", link: "TAIL", suffix: "SPIN"))
        info.wordBank.append(Word(prefix: "HIGH", link: "TAIL", suffix: "BACK"))
        info.wordBank.append(Word(prefix: "HIGH", link: "TAIL", suffix: "SPIN"))
        info.wordBank.append(Word(prefix: "SWALLOW", link: "TAIL", suffix: "BACK"))
        info.wordBank.append(Word(prefix: "SWALLOW", link: "TAIL", suffix: "SPIN"))
        info.wordBank.append(Word(prefix: "YELLOW", link: "TAIL", suffix: "BACK"))
        info.wordBank.append(Word(prefix: "YELLOW", link: "TAIL", suffix: "SPIN"))
        
        info.wordBank.append(Word(prefix: "POST", link: "CARD", suffix: "BOARD"))
        info.wordBank.append(Word(prefix: "TIME", link: "CARD", suffix: "BOARD"))
        
        info.wordBank.append(Word(prefix: "CHILD", link: "CARE", suffix: "FREE"))
        info.wordBank.append(Word(prefix: "CHILD", link: "CARE", suffix: "LESS"))
        info.wordBank.append(Word(prefix: "CHILD", link: "CARE", suffix: "TAKER"))
        
        info.wordBank.append(Word(prefix: "BOX", link: "CAR", suffix: "PORT"))
        info.wordBank.append(Word(prefix: "SIDE", link: "CAR", suffix: "PORT"))
        info.wordBank.append(Word(prefix: "STREET", link: "CAR", suffix: "PORT"))
        
        info.wordBank.append(Word(prefix: "PAY", link: "CHECK", suffix: "MATE"))
        info.wordBank.append(Word(prefix: "PAY", link: "CHECK", suffix: "ROOM"))
        info.wordBank.append(Word(prefix: "PAY", link: "CHECK", suffix: "UP"))
        
        info.wordBank.append(Word(prefix: "GRAND", link: "CHILD", suffix: "BIRTH"))
        info.wordBank.append(Word(prefix: "GRAND", link: "CHILD", suffix: "CARE"))
        info.wordBank.append(Word(prefix: "GRAND", link: "CHILD", suffix: "FREEH"))
        info.wordBank.append(Word(prefix: "GRAND", link: "CHILD", suffix: "LIKE"))
        info.wordBank.append(Word(prefix: "GRAND", link: "CHILD", suffix: "PROOF"))
        info.wordBank.append(Word(prefix: "GRAND", link: "CHILD", suffix: "REARING"))
        
        info.wordBank.append(Word(prefix: "COUNTER", link: "CLOCK", suffix: "WISE"))
        
        info.wordBank.append(Word(prefix: "OVER", link: "COOK", suffix: "BOOK"))
        info.wordBank.append(Word(prefix: "OVER", link: "COOK", suffix: "OUT"))
        info.wordBank.append(Word(prefix: "OVER", link: "COOK", suffix: "TOP"))
        info.wordBank.append(Word(prefix: "OVER", link: "COOK", suffix: "WEAR"))
        info.wordBank.append(Word(prefix: "UNDER", link: "COOK", suffix: "BOOK"))
        info.wordBank.append(Word(prefix: "UNDER", link: "COOK", suffix: "OUT"))
        info.wordBank.append(Word(prefix: "UNDER", link: "COOK", suffix: "TOP"))
        info.wordBank.append(Word(prefix: "UNDER", link: "COOK", suffix: "WEAR"))
        
        info.wordBank.append(Word(prefix: "PEPPER", link: "CORN", suffix: "FIELD"))
        info.wordBank.append(Word(prefix: "PEPPER", link: "CORN", suffix: "FLOWER"))
        info.wordBank.append(Word(prefix: "PEPPER", link: "CORN", suffix: "BREAD"))
        info.wordBank.append(Word(prefix: "PEPPER", link: "CORN", suffix: "COB"))
        info.wordBank.append(Word(prefix: "PEPPER", link: "CORN", suffix: "DOG"))
        info.wordBank.append(Word(prefix: "PEPPER", link: "CORN", suffix: "STALK"))
        
        info.wordBank.append(Word(prefix: "BUTTER", link: "CUP", suffix: "BOARD"))
        info.wordBank.append(Word(prefix: "BUTTER", link: "CUP", suffix: "CAKE"))
        info.wordBank.append(Word(prefix: "EGG", link: "CUP", suffix: "BOARD"))
        info.wordBank.append(Word(prefix: "EGG", link: "CUP", suffix: "CAKE"))
        info.wordBank.append(Word(prefix: "TEA", link: "CUP", suffix: "BOARD"))
        info.wordBank.append(Word(prefix: "TEA", link: "CUP", suffix: "CAKE"))
        
        info.wordBank.append(Word(prefix: "HAIR", link: "CUT", suffix: "AWAY"))
        info.wordBank.append(Word(prefix: "HAIR", link: "CUT", suffix: "BACK"))
        info.wordBank.append(Word(prefix: "HAIR", link: "CUT", suffix: "OFF"))
        info.wordBank.append(Word(prefix: "HAIR", link: "CUT", suffix: "THROAT"))
        info.wordBank.append(Word(prefix: "HAIR", link: "CUT", suffix: "UP"))
        
        info.wordBank.append(Word(prefix: "UNDER", link: "CUT", suffix: "AWAY"))
        info.wordBank.append(Word(prefix: "UNDER", link: "CUT", suffix: "BACK"))
        info.wordBank.append(Word(prefix: "UNDER", link: "CUT", suffix: "OFF"))
        info.wordBank.append(Word(prefix: "UNDER", link: "CUT", suffix: "THROAT"))
        info.wordBank.append(Word(prefix: "UNDER", link: "CUT", suffix: "UP"))
        
        info.wordBank.append(Word(prefix: "EVERY", link: "DAY", suffix: "BREAK"))
        info.wordBank.append(Word(prefix: "EVERY", link: "DAY", suffix: "DREAM"))
        info.wordBank.append(Word(prefix: "EVERY", link: "DAY", suffix: "LIGHT"))
        info.wordBank.append(Word(prefix: "EVERY", link: "DAY", suffix: "TIME"))
        
        info.wordBank.append(Word(prefix: "SOME", link: "DAY", suffix: "BREAK"))
        info.wordBank.append(Word(prefix: "SOME", link: "DAY", suffix: "DREAM"))
        info.wordBank.append(Word(prefix: "SOME", link: "DAY", suffix: "LIGHT"))
        info.wordBank.append(Word(prefix: "SOME", link: "DAY", suffix: "TIME"))
        
        info.wordBank.append(Word(prefix: "WEEK", link: "DAY", suffix: "BREAK"))
        info.wordBank.append(Word(prefix: "WEEK", link: "DAY", suffix: "DREAM"))
        info.wordBank.append(Word(prefix: "WEEK", link: "DAY", suffix: "LIGHT"))
        info.wordBank.append(Word(prefix: "WEEK", link: "DAY", suffix: "TIME"))
        
        info.wordBank.append(Word(prefix: "WORK", link: "DAY", suffix: "BREAK"))
        info.wordBank.append(Word(prefix: "WORK", link: "DAY", suffix: "DREAM"))
        info.wordBank.append(Word(prefix: "WORK", link: "DAY", suffix: "LIGHT"))
        info.wordBank.append(Word(prefix: "WORK", link: "DAY", suffix: "TIME"))
        
        info.wordBank.append(Word(prefix: "BIRTH", link: "DAY", suffix: "BREAK"))
        info.wordBank.append(Word(prefix: "BIRTH", link: "DAY", suffix: "DREAM"))
        info.wordBank.append(Word(prefix: "BIRTH", link: "DAY", suffix: "LIGHT"))
        info.wordBank.append(Word(prefix: "BIRTH", link: "DAY", suffix: "TIME"))
        
        info.wordBank.append(Word(prefix: "HOT", link: "DOG", suffix: "CATCHER"))
        info.wordBank.append(Word(prefix: "HOT", link: "DOG", suffix: "FISH"))
        info.wordBank.append(Word(prefix: "HOT", link: "DOG", suffix: "HOUSE"))
        info.wordBank.append(Word(prefix: "HOT", link: "DOG", suffix: "WOOD"))
        
        info.wordBank.append(Word(prefix: "SHEEP", link: "DOG", suffix: "CATCHER"))
        info.wordBank.append(Word(prefix: "SHEEP", link: "DOG", suffix: "FISH"))
        info.wordBank.append(Word(prefix: "SHEEP", link: "DOG", suffix: "HOUSE"))
        info.wordBank.append(Word(prefix: "SHEEP", link: "DOG", suffix: "WOOD"))
        
        info.wordBank.append(Word(prefix: "UNDER", link: "DOG", suffix: "CATCHER"))
        info.wordBank.append(Word(prefix: "UNDER", link: "DOG", suffix: "FISH"))
        info.wordBank.append(Word(prefix: "UNDER", link: "DOG", suffix: "HOUSE"))
        info.wordBank.append(Word(prefix: "UNDER", link: "DOG", suffix: "WOOD"))
        
        info.wordBank.append(Word(prefix: "WATCH", link: "DOG", suffix: "CATCHER"))
        info.wordBank.append(Word(prefix: "WATCH", link: "DOG", suffix: "FISH"))
        info.wordBank.append(Word(prefix: "WATCH", link: "DOG", suffix: "HOUSE"))
        info.wordBank.append(Word(prefix: "WATCH", link: "DOG", suffix: "WOOD"))
        
        info.wordBank.append(Word(prefix: "IN", link: "DOOR", suffix: "BELL"))
        info.wordBank.append(Word(prefix: "IN", link: "DOOR", suffix: "KNOB"))
        info.wordBank.append(Word(prefix: "IN", link: "DOOR", suffix: "MAN"))
        info.wordBank.append(Word(prefix: "IN", link: "DOOR", suffix: "MAT"))
        info.wordBank.append(Word(prefix: "IN", link: "DOOR", suffix: "STEP"))
        info.wordBank.append(Word(prefix: "IN", link: "DOOR", suffix: "STOP"))
        info.wordBank.append(Word(prefix: "IN", link: "DOOR", suffix: "WAY"))
        
        info.wordBank.append(Word(prefix: "OUT", link: "DOOR", suffix: "BELL"))
        info.wordBank.append(Word(prefix: "OUT", link: "DOOR", suffix: "KNOB"))
        info.wordBank.append(Word(prefix: "OUT", link: "DOOR", suffix: "MAN"))
        info.wordBank.append(Word(prefix: "OUT", link: "DOOR", suffix: "MAT"))
        info.wordBank.append(Word(prefix: "OUT", link: "DOOR", suffix: "STEP"))
        info.wordBank.append(Word(prefix: "OUT", link: "DOOR", suffix: "STOP"))
        info.wordBank.append(Word(prefix: "OUT", link: "DOOR", suffix: "WAY"))
        
        // down start - shut
        info.wordBank.append(Word(prefix: "SHUT", link: "DOWN", suffix: "BURST"))
        info.wordBank.append(Word(prefix: "SHUT", link: "DOWN", suffix: "CAST"))
        info.wordBank.append(Word(prefix: "SHUT", link: "DOWN", suffix: "DRAFT"))
        info.wordBank.append(Word(prefix: "SHUT", link: "DOWN", suffix: "FALL"))
        info.wordBank.append(Word(prefix: "SHUT", link: "DOWN", suffix: "HILL"))
        
        info.wordBank.append(Word(prefix: "SHUT", link: "DOWN", suffix: "HOME"))
        info.wordBank.append(Word(prefix: "SHUT", link: "DOWN", suffix: "LOAD"))
        info.wordBank.append(Word(prefix: "SHUT", link: "DOWN", suffix: "LINK"))
        info.wordBank.append(Word(prefix: "SHUT", link: "DOWN", suffix: "PAYMENT"))
        info.wordBank.append(Word(prefix: "SHUT", link: "DOWN", suffix: "PLAY"))
        
        info.wordBank.append(Word(prefix: "SHUT", link: "DOWN", suffix: "POUR"))
        info.wordBank.append(Word(prefix: "SHUT", link: "DOWN", suffix: "RATE"))
        info.wordBank.append(Word(prefix: "SHUT", link: "DOWN", suffix: "RIGHT"))
        info.wordBank.append(Word(prefix: "SHUT", link: "DOWN", suffix: "SCALE"))
        info.wordBank.append(Word(prefix: "SHUT", link: "DOWN", suffix: "SHIFT"))
        
        info.wordBank.append(Word(prefix: "SHUT", link: "DOWN", suffix: "SIZE"))
        info.wordBank.append(Word(prefix: "SHUT", link: "DOWN", suffix: "STAIRS"))
        info.wordBank.append(Word(prefix: "SHUT", link: "DOWN", suffix: "STREAM"))
        info.wordBank.append(Word(prefix: "SHUT", link: "DOWN", suffix: "STROKE"))
        info.wordBank.append(Word(prefix: "SHUT", link: "DOWN", suffix: "THROW"))
        
        info.wordBank.append(Word(prefix: "SHUT", link: "DOWN", suffix: "TOWN"))
        info.wordBank.append(Word(prefix: "SHUT", link: "DOWN", suffix: "TRODDEN"))
        info.wordBank.append(Word(prefix: "SHUT", link: "DOWN", suffix: "TURN"))
        info.wordBank.append(Word(prefix: "SHUT", link: "DOWN", suffix: "UNDER"))
        info.wordBank.append(Word(prefix: "SHUT", link: "DOWN", suffix: "WARD"))
        
        info.wordBank.append(Word(prefix: "SHUT", link: "DOWN", suffix: "WIND"))
        // down end - shut
        
        // down start - sun
        info.wordBank.append(Word(prefix: "SUN", link: "DOWN", suffix: "BURST"))
        info.wordBank.append(Word(prefix: "SUN", link: "DOWN", suffix: "CAST"))
        info.wordBank.append(Word(prefix: "SUN", link: "DOWN", suffix: "DRAFT"))
        info.wordBank.append(Word(prefix: "SUN", link: "DOWN", suffix: "FALL"))
        info.wordBank.append(Word(prefix: "SUN", link: "DOWN", suffix: "HILL"))
        
        info.wordBank.append(Word(prefix: "SUN", link: "DOWN", suffix: "HOME"))
        info.wordBank.append(Word(prefix: "SUN", link: "DOWN", suffix: "LOAD"))
        info.wordBank.append(Word(prefix: "SUN", link: "DOWN", suffix: "LINK"))
        info.wordBank.append(Word(prefix: "SUN", link: "DOWN", suffix: "PAYMENT"))
        info.wordBank.append(Word(prefix: "SUN", link: "DOWN", suffix: "PLAY"))
        
        info.wordBank.append(Word(prefix: "SUN", link: "DOWN", suffix: "POUR"))
        info.wordBank.append(Word(prefix: "SUN", link: "DOWN", suffix: "RATE"))
        info.wordBank.append(Word(prefix: "SUN", link: "DOWN", suffix: "RIGHT"))
        info.wordBank.append(Word(prefix: "SUN", link: "DOWN", suffix: "SCALE"))
        info.wordBank.append(Word(prefix: "SUN", link: "DOWN", suffix: "SHIFT"))
        
        info.wordBank.append(Word(prefix: "SUN", link: "DOWN", suffix: "SIZE"))
        info.wordBank.append(Word(prefix: "SUN", link: "DOWN", suffix: "STAIRS"))
        info.wordBank.append(Word(prefix: "SUN", link: "DOWN", suffix: "STREAM"))
        info.wordBank.append(Word(prefix: "SUN", link: "DOWN", suffix: "STROKE"))
        info.wordBank.append(Word(prefix: "SUN", link: "DOWN", suffix: "THROW"))
        
        info.wordBank.append(Word(prefix: "SUN", link: "DOWN", suffix: "TOWN"))
        info.wordBank.append(Word(prefix: "SUN", link: "DOWN", suffix: "TRODDEN"))
        info.wordBank.append(Word(prefix: "SUN", link: "DOWN", suffix: "TURN"))
        info.wordBank.append(Word(prefix: "SUN", link: "DOWN", suffix: "UNDER"))
        info.wordBank.append(Word(prefix: "SUN", link: "DOWN", suffix: "WARD"))
        
        info.wordBank.append(Word(prefix: "SUN", link: "DOWN", suffix: "WIND"))
        // down end - shut
        
        info.wordBank.append(Word(prefix: "SNAP", link: "DRAGON", suffix: "FLY"))
        
        info.wordBank.append(Word(prefix: "HEAD", link: "DRESS", suffix: "MAKER"))
        info.wordBank.append(Word(prefix: "SUN", link: "DRESS", suffix: "MAKER"))
        
        info.wordBank.append(Word(prefix: "SNOW", link: "DRIFT", suffix: "WOOD"))
        
        info.wordBank.append(Word(prefix: "OVER", link: "DRIVE", suffix: "WAY"))
        
        info.wordBank.append(Word(prefix: "EAVES", link: "DROP", suffix: "OUT"))
        info.wordBank.append(Word(prefix: "GUM", link: "DROP", suffix: "OUT"))
        info.wordBank.append(Word(prefix: "SNOW", link: "DROP", suffix: "OUT"))
        info.wordBank.append(Word(prefix: "TEAR", link: "DROP", suffix: "OUT"))
        info.wordBank.append(Word(prefix: "BACK", link: "DROP", suffix: "OUT"))
        
        info.wordBank.append(Word(prefix: "EAR", link: "DRUM", suffix: "BEAT"))
        info.wordBank.append(Word(prefix: "HUM", link: "DRUM", suffix: "BEAT"))
        info.wordBank.append(Word(prefix: "KETTLE", link: "DRUM", suffix: "BEAT"))
        
        info.wordBank.append(Word(prefix: "EAR", link: "DRUM", suffix: "STICK"))
        info.wordBank.append(Word(prefix: "HUM", link: "DRUM", suffix: "STICK"))
        info.wordBank.append(Word(prefix: "KETTLE", link: "DRUM", suffix: "STICK"))
        
        info.wordBank.append(Word(prefix: "SAW", link: "DUST", suffix: "PAN"))
        info.wordBank.append(Word(prefix: "SAW", link: "DUST", suffix: "STORM"))
        
        info.wordBank.append(Word(prefix: "RIGHT", link: "EAR", suffix: "ACHE"))
        info.wordBank.append(Word(prefix: "RIGHT", link: "EAR", suffix: "DRUM"))
        info.wordBank.append(Word(prefix: "RIGHT", link: "EAR", suffix: "LOBE"))
        info.wordBank.append(Word(prefix: "RIGHT", link: "EAR", suffix: "MARK"))
        info.wordBank.append(Word(prefix: "RIGHT", link: "EAR", suffix: "MUFF"))
        
        info.wordBank.append(Word(prefix: "RIGHT", link: "EAR", suffix: "PHONE"))
        info.wordBank.append(Word(prefix: "RIGHT", link: "EAR", suffix: "RING"))
        info.wordBank.append(Word(prefix: "RIGHT", link: "EAR", suffix: "SHOT"))
        info.wordBank.append(Word(prefix: "RIGHT", link: "EAR", suffix: "WIG"))
        
        info.wordBank.append(Word(prefix: "FIRST", link: "EARTH", suffix: "BOUND"))
        info.wordBank.append(Word(prefix: "FIRST", link: "EARTH", suffix: "QUAKE"))
        
        info.wordBank.append(Word(prefix: "FIRST", link: "EARTH", suffix: "WARD"))
        info.wordBank.append(Word(prefix: "FIRST", link: "EARTH", suffix: "WORM"))
        info.wordBank.append(Word(prefix: "FIRST", link: "EARTH", suffix: "WIG"))
        
        info.wordBank.append(Word(prefix: "HOW", link: "EVER", suffix: "GREEN"))
        info.wordBank.append(Word(prefix: "HOW", link: "EVER", suffix: "LASTING"))
        info.wordBank.append(Word(prefix: "WHAT", link: "EVER", suffix: "GREEN"))
        info.wordBank.append(Word(prefix: "WHAT", link: "EVER", suffix: "LASTING"))
        info.wordBank.append(Word(prefix: "WHEN", link: "EVER", suffix: "GREEN"))
        info.wordBank.append(Word(prefix: "WHEN", link: "EVER", suffix: "LASTING"))
        info.wordBank.append(Word(prefix: "WHICH", link: "EVER", suffix: "GREEN"))
        info.wordBank.append(Word(prefix: "WHICH", link: "EVER", suffix: "LASTING"))
        info.wordBank.append(Word(prefix: "WHO", link: "EVER", suffix: "GREEN"))
        info.wordBank.append(Word(prefix: "WHO", link: "EVER", suffix: "LASTING"))
        info.wordBank.append(Word(prefix: "WHOM", link: "EVER", suffix: "GREEN"))
        info.wordBank.append(Word(prefix: "WHOM", link: "EVER", suffix: "LASTING"))
        
        info.wordBank.append(Word(prefix: "FISH", link: "EYE", suffix: "BALL"))
        info.wordBank.append(Word(prefix: "FISH", link: "EYE", suffix: "BROW"))
        info.wordBank.append(Word(prefix: "FISH", link: "EYE", suffix: "GLASSES"))
        info.wordBank.append(Word(prefix: "FISH", link: "EYE", suffix: "LASH"))
        info.wordBank.append(Word(prefix: "FISH", link: "EYE", suffix: "LID"))
        info.wordBank.append(Word(prefix: "FISH", link: "EYE", suffix: "SIGHT"))
        info.wordBank.append(Word(prefix: "FISH", link: "EYE", suffix: "WITNESS"))
        
        info.wordBank.append(Word(prefix: "RED", link: "EYE", suffix: "BALL"))
        info.wordBank.append(Word(prefix: "RED", link: "EYE", suffix: "BROW"))
        info.wordBank.append(Word(prefix: "RED", link: "EYE", suffix: "GLASSES"))
        info.wordBank.append(Word(prefix: "RED", link: "EYE", suffix: "LASH"))
        info.wordBank.append(Word(prefix: "RED", link: "EYE", suffix: "LID"))
        info.wordBank.append(Word(prefix: "RED", link: "EYE", suffix: "SIGHT"))
        info.wordBank.append(Word(prefix: "RED", link: "EYE", suffix: "WITNESS"))
        
        info.wordBank.append(Word(prefix: "SHUT", link: "EYE", suffix: "BALL"))
        info.wordBank.append(Word(prefix: "SHUT", link: "EYE", suffix: "BROW"))
        info.wordBank.append(Word(prefix: "SHUT", link: "EYE", suffix: "GLASSES"))
        info.wordBank.append(Word(prefix: "SHUT", link: "EYE", suffix: "LASH"))
        info.wordBank.append(Word(prefix: "SHUT", link: "EYE", suffix: "LID"))
        info.wordBank.append(Word(prefix: "SHUT", link: "EYE", suffix: "SIGHT"))
        info.wordBank.append(Word(prefix: "SHUT", link: "EYE", suffix: "WITNESS"))
        
        info.wordBank.append(Word(prefix: "LAND", link: "FALL", suffix: "OUT"))
        info.wordBank.append(Word(prefix: "NIGHT", link: "FALL", suffix: "OUT"))
        info.wordBank.append(Word(prefix: "RAIN", link: "FALL", suffix: "OUT"))
        info.wordBank.append(Word(prefix: "SNOW", link: "FALL", suffix: "OUT"))
        info.wordBank.append(Word(prefix: "WATER", link: "FALL", suffix: "OUT"))
        info.wordBank.append(Word(prefix: "WIND", link: "FALL", suffix: "OUT"))
        info.wordBank.append(Word(prefix: "DOWN", link: "FALL", suffix: "OUT"))
        
        info.wordBank.append(Word(prefix: "FAN", link: "FARE", suffix: "WELL"))
        info.wordBank.append(Word(prefix: "SEA", link: "FARE", suffix: "WELL"))
        info.wordBank.append(Word(prefix: "THOROUGH", link: "FARE", suffix: "WELL"))
        info.wordBank.append(Word(prefix: "WAR", link: "FARE", suffix: "WELL"))
        
        info.wordBank.append(Word(prefix: "STEP", link: "FATHER", suffix: "LAND"))
        info.wordBank.append(Word(prefix: "GRAND", link: "FATHER", suffix: "LAND"))
        
        info.wordBank.append(Word(prefix: "BUTTER", link: "FINGER", suffix: "NAIL"))
        info.wordBank.append(Word(prefix: "BUTTER", link: "FINGER", suffix: "PRINT"))
        info.wordBank.append(Word(prefix: "BUTTER", link: "FINGER", suffix: "TIP"))
        
        info.wordBank.append(Word(prefix: "CAMP", link: "FIRE", suffix: "ARM"))
        info.wordBank.append(Word(prefix: "CAMP", link: "FIRE", suffix: "BOAT"))
        info.wordBank.append(Word(prefix: "CAMP", link: "FIRE", suffix: "BUG"))
        info.wordBank.append(Word(prefix: "CAMP", link: "FIRE", suffix: "FIGHTER"))
        info.wordBank.append(Word(prefix: "CAMP", link: "FIRE", suffix: "FLY"))
        info.wordBank.append(Word(prefix: "CAMP", link: "FIRE", suffix: "MAN"))
        info.wordBank.append(Word(prefix: "CAMP", link: "FIRE", suffix: "PLACE"))
        info.wordBank.append(Word(prefix: "CAMP", link: "FIRE", suffix: "PROOFED"))
        info.wordBank.append(Word(prefix: "CAMP", link: "FIRE", suffix: "WOOD"))
        info.wordBank.append(Word(prefix: "CAMP", link: "FIRE", suffix: "WORKS"))
        info.wordBank.append(Word(prefix: "CAMP", link: "FIRE", suffix: "PROOFED"))
        
        info.wordBank.append(Word(prefix: "GUN", link: "FIRE", suffix: "ARM"))
        info.wordBank.append(Word(prefix: "GUN", link: "FIRE", suffix: "BOAT"))
        info.wordBank.append(Word(prefix: "GUN", link: "FIRE", suffix: "BUG"))
        info.wordBank.append(Word(prefix: "GUN", link: "FIRE", suffix: "FIGHTER"))
        info.wordBank.append(Word(prefix: "GUN", link: "FIRE", suffix: "FLY"))
        info.wordBank.append(Word(prefix: "GUN", link: "FIRE", suffix: "MAN"))
        info.wordBank.append(Word(prefix: "GUN", link: "FIRE", suffix: "PLACE"))
        info.wordBank.append(Word(prefix: "GUN", link: "FIRE", suffix: "PROOFED"))
        info.wordBank.append(Word(prefix: "GUN", link: "FIRE", suffix: "WOOD"))
        info.wordBank.append(Word(prefix: "GUN", link: "FIRE", suffix: "WORKS"))
        info.wordBank.append(Word(prefix: "GUN", link: "FIRE", suffix: "PROOFED"))
        
        info.wordBank.append(Word(prefix: "QUICK", link: "FIRE", suffix: "ARM"))
        info.wordBank.append(Word(prefix: "QUICK", link: "FIRE", suffix: "BOAT"))
        info.wordBank.append(Word(prefix: "QUICK", link: "FIRE", suffix: "BUG"))
        info.wordBank.append(Word(prefix: "QUICK", link: "FIRE", suffix: "FIGHTER"))
        info.wordBank.append(Word(prefix: "QUICK", link: "FIRE", suffix: "FLY"))
        info.wordBank.append(Word(prefix: "QUICK", link: "FIRE", suffix: "MAN"))
        info.wordBank.append(Word(prefix: "QUICK", link: "FIRE", suffix: "PLACE"))
        info.wordBank.append(Word(prefix: "QUICK", link: "FIRE", suffix: "PROOFED"))
        info.wordBank.append(Word(prefix: "QUICK", link: "FIRE", suffix: "WOOD"))
        info.wordBank.append(Word(prefix: "QUICK", link: "FIRE", suffix: "WORKS"))
        info.wordBank.append(Word(prefix: "QUICK", link: "FIRE", suffix: "PROOFED"))
        
        info.wordBank.append(Word(prefix: "WILD", link: "FIRE", suffix: "ARM"))
        info.wordBank.append(Word(prefix: "WILD", link: "FIRE", suffix: "BOAT"))
        info.wordBank.append(Word(prefix: "WILD", link: "FIRE", suffix: "BUG"))
        info.wordBank.append(Word(prefix: "WILD", link: "FIRE", suffix: "FIGHTER"))
        info.wordBank.append(Word(prefix: "WILD", link: "FIRE", suffix: "FLY"))
        info.wordBank.append(Word(prefix: "WILD", link: "FIRE", suffix: "MAN"))
        info.wordBank.append(Word(prefix: "WILD", link: "FIRE", suffix: "PLACE"))
        info.wordBank.append(Word(prefix: "WILD", link: "FIRE", suffix: "PROOFED"))
        info.wordBank.append(Word(prefix: "WILD", link: "FIRE", suffix: "WOOD"))
        info.wordBank.append(Word(prefix: "WILD", link: "FIRE", suffix: "WORKS"))
        info.wordBank.append(Word(prefix: "WILD", link: "FIRE", suffix: "PROOFED"))
        
        info.wordBank.append(Word(prefix: "HEAD", link: "FIRST", suffix: "HAND"))
        
        info.wordBank.append(Word(prefix: "ANGEL", link: "FISH", suffix: "BOWL"))
        info.wordBank.append(Word(prefix: "ANGEL", link: "FISH", suffix: "CAKE"))
        info.wordBank.append(Word(prefix: "ANGEL", link: "FISH", suffix: "EYE"))
        info.wordBank.append(Word(prefix: "ANGEL", link: "FISH", suffix: "HOOK"))
        info.wordBank.append(Word(prefix: "ANGEL", link: "FISH", suffix: "NET"))
        
        info.wordBank.append(Word(prefix: "CAT", link: "FISH", suffix: "BOWL"))
        info.wordBank.append(Word(prefix: "CAT", link: "FISH", suffix: "CAKE"))
        info.wordBank.append(Word(prefix: "CAT", link: "FISH", suffix: "EYE"))
        info.wordBank.append(Word(prefix: "CAT", link: "FISH", suffix: "HOOK"))
        info.wordBank.append(Word(prefix: "CAT", link: "FISH", suffix: "NET"))
        
        info.wordBank.append(Word(prefix: "CRAW", link: "FISH", suffix: "BOWL"))
        info.wordBank.append(Word(prefix: "CRAW", link: "FISH", suffix: "CAKE"))
        info.wordBank.append(Word(prefix: "CRAW", link: "FISH", suffix: "EYE"))
        info.wordBank.append(Word(prefix: "CRAW", link: "FISH", suffix: "HOOK"))
        info.wordBank.append(Word(prefix: "CRAW", link: "FISH", suffix: "NET"))
        
        info.wordBank.append(Word(prefix: "DOG", link: "FISH", suffix: "BOWL"))
        info.wordBank.append(Word(prefix: "DOG", link: "FISH", suffix: "CAKE"))
        info.wordBank.append(Word(prefix: "DOG", link: "FISH", suffix: "EYE"))
        info.wordBank.append(Word(prefix: "DOG", link: "FISH", suffix: "HOOK"))
        info.wordBank.append(Word(prefix: "DOG", link: "FISH", suffix: "NET"))
        
        info.wordBank.append(Word(prefix: "FLAT", link: "FISH", suffix: "BOWL"))
        info.wordBank.append(Word(prefix: "FLAT", link: "FISH", suffix: "CAKE"))
        info.wordBank.append(Word(prefix: "FLAT", link: "FISH", suffix: "EYE"))
        info.wordBank.append(Word(prefix: "FLAT", link: "FISH", suffix: "HOOK"))
        info.wordBank.append(Word(prefix: "FLAT", link: "FISH", suffix: "NET"))
        
        info.wordBank.append(Word(prefix: "GOLD", link: "FISH", suffix: "BOWL"))
        info.wordBank.append(Word(prefix: "GOLD", link: "FISH", suffix: "CAKE"))
        info.wordBank.append(Word(prefix: "GOLD", link: "FISH", suffix: "EYE"))
        info.wordBank.append(Word(prefix: "GOLD", link: "FISH", suffix: "HOOK"))
        info.wordBank.append(Word(prefix: "GOLD", link: "FISH", suffix: "NET"))
        
        info.wordBank.append(Word(prefix: "ICE", link: "FISH", suffix: "BOWL"))
        info.wordBank.append(Word(prefix: "ICE", link: "FISH", suffix: "CAKE"))
        info.wordBank.append(Word(prefix: "ICE", link: "FISH", suffix: "EYE"))
        info.wordBank.append(Word(prefix: "ICE", link: "FISH", suffix: "HOOK"))
        info.wordBank.append(Word(prefix: "ICE", link: "FISH", suffix: "NET"))
        
        info.wordBank.append(Word(prefix: "JELLY", link: "FISH", suffix: "BOWL"))
        info.wordBank.append(Word(prefix: "JELLY", link: "FISH", suffix: "CAKE"))
        info.wordBank.append(Word(prefix: "JELLY", link: "FISH", suffix: "EYE"))
        info.wordBank.append(Word(prefix: "JELLY", link: "FISH", suffix: "HOOK"))
        info.wordBank.append(Word(prefix: "JELLY", link: "FISH", suffix: "NET"))
        
        info.wordBank.append(Word(prefix: "LUNG", link: "FISH", suffix: "BOWL"))
        info.wordBank.append(Word(prefix: "LUNG", link: "FISH", suffix: "CAKE"))
        info.wordBank.append(Word(prefix: "LUNG", link: "FISH", suffix: "EYE"))
        info.wordBank.append(Word(prefix: "LUNG", link: "FISH", suffix: "HOOK"))
        info.wordBank.append(Word(prefix: "LUNG", link: "FISH", suffix: "NET"))
        
        info.wordBank.append(Word(prefix: "PIPE", link: "FISH", suffix: "BOWL"))
        info.wordBank.append(Word(prefix: "PIPE", link: "FISH", suffix: "CAKE"))
        info.wordBank.append(Word(prefix: "PIPE", link: "FISH", suffix: "EYE"))
        info.wordBank.append(Word(prefix: "PIPE", link: "FISH", suffix: "HOOK"))
        info.wordBank.append(Word(prefix: "PIPE", link: "FISH", suffix: "NET"))
        
        info.wordBank.append(Word(prefix: "ROCK", link: "FISH", suffix: "BOWL"))
        info.wordBank.append(Word(prefix: "ROCK", link: "FISH", suffix: "CAKE"))
        info.wordBank.append(Word(prefix: "ROCK", link: "FISH", suffix: "EYE"))
        info.wordBank.append(Word(prefix: "ROCK", link: "FISH", suffix: "HOOK"))
        info.wordBank.append(Word(prefix: "ROCK", link: "FISH", suffix: "NET"))
        
        info.wordBank.append(Word(prefix: "SAIL", link: "FISH", suffix: "BOWL"))
        info.wordBank.append(Word(prefix: "SAIL", link: "FISH", suffix: "CAKE"))
        info.wordBank.append(Word(prefix: "SAIL", link: "FISH", suffix: "EYE"))
        info.wordBank.append(Word(prefix: "SAIL", link: "FISH", suffix: "HOOK"))
        info.wordBank.append(Word(prefix: "SAIL", link: "FISH", suffix: "NET"))
        
        info.wordBank.append(Word(prefix: "SHELL", link: "FISH", suffix: "BOWL"))
        info.wordBank.append(Word(prefix: "SHELL", link: "FISH", suffix: "CAKE"))
        info.wordBank.append(Word(prefix: "SHELL", link: "FISH", suffix: "EYE"))
        info.wordBank.append(Word(prefix: "SHELL", link: "FISH", suffix: "HOOK"))
        info.wordBank.append(Word(prefix: "SHELL", link: "FISH", suffix: "NET"))
        
        info.wordBank.append(Word(prefix: "STAR", link: "FISH", suffix: "BOWL"))
        info.wordBank.append(Word(prefix: "STAR", link: "FISH", suffix: "CAKE"))
        info.wordBank.append(Word(prefix: "STAR", link: "FISH", suffix: "EYE"))
        info.wordBank.append(Word(prefix: "STAR", link: "FISH", suffix: "HOOK"))
        info.wordBank.append(Word(prefix: "STAR", link: "FISH", suffix: "NET"))
        
        info.wordBank.append(Word(prefix: "SUN", link: "FISH", suffix: "BOWL"))
        info.wordBank.append(Word(prefix: "SUN", link: "FISH", suffix: "CAKE"))
        info.wordBank.append(Word(prefix: "SUN", link: "FISH", suffix: "EYE"))
        info.wordBank.append(Word(prefix: "SUN", link: "FISH", suffix: "HOOK"))
        info.wordBank.append(Word(prefix: "SUN", link: "FISH", suffix: "NET"))
        
        info.wordBank.append(Word(prefix: "SWORD", link: "FISH", suffix: "BOWL"))
        info.wordBank.append(Word(prefix: "SWORD", link: "FISH", suffix: "CAKE"))
        info.wordBank.append(Word(prefix: "SWORD", link: "FISH", suffix: "EYE"))
        info.wordBank.append(Word(prefix: "SWORD", link: "FISH", suffix: "HOOK"))
        info.wordBank.append(Word(prefix: "SWORD", link: "FISH", suffix: "NET"))
        
        info.wordBank.append(Word(prefix: "TRIGGER", link: "FISH", suffix: "BOWL"))
        info.wordBank.append(Word(prefix: "TRIGGER", link: "FISH", suffix: "CAKE"))
        info.wordBank.append(Word(prefix: "TRIGGER", link: "FISH", suffix: "EYE"))
        info.wordBank.append(Word(prefix: "TRIGGER", link: "FISH", suffix: "HOOK"))
        info.wordBank.append(Word(prefix: "TRIGGER", link: "FISH", suffix: "NET"))
        
        info.wordBank.append(Word(prefix: "WHITE", link: "FISH", suffix: "BOWL"))
        info.wordBank.append(Word(prefix: "WHITE", link: "FISH", suffix: "CAKE"))
        info.wordBank.append(Word(prefix: "WHITE", link: "FISH", suffix: "EYE"))
        info.wordBank.append(Word(prefix: "WHITE", link: "FISH", suffix: "HOOK"))
        info.wordBank.append(Word(prefix: "WHITE", link: "FISH", suffix: "NET"))
        
        info.wordBank.append(Word(prefix: "BELL", link: "FLOWER", suffix: "BED"))
        info.wordBank.append(Word(prefix: "BELL", link: "FLOWER", suffix: "PET"))
        info.wordBank.append(Word(prefix: "MAY", link: "FLOWER", suffix: "BED"))
        info.wordBank.append(Word(prefix: "MAY", link: "FLOWER", suffix: "PET"))
        info.wordBank.append(Word(prefix: "CORN", link: "FLOWER", suffix: "BED"))
        info.wordBank.append(Word(prefix: "CORN", link: "FLOWER", suffix: "PET"))
        info.wordBank.append(Word(prefix: "PASSION", link: "FLOWER", suffix: "BED"))
        info.wordBank.append(Word(prefix: "PASSION", link: "FLOWER", suffix: "PET"))
        info.wordBank.append(Word(prefix: "SUN", link: "FLOWER", suffix: "BED"))
        info.wordBank.append(Word(prefix: "SUN", link: "FLOWER", suffix: "PET"))
        info.wordBank.append(Word(prefix: "WALL", link: "FLOWER", suffix: "BED"))
        info.wordBank.append(Word(prefix: "WALL", link: "FLOWER", suffix: "PET"))
        info.wordBank.append(Word(prefix: "WILD", link: "FLOWER", suffix: "BED"))
        info.wordBank.append(Word(prefix: "WILD", link: "FLOWER", suffix: "PET"))
        
        info.wordBank.append(Word(prefix: "BUTTER", link: "FLY", suffix: "BY"))
        info.wordBank.append(Word(prefix: "BUTTER", link: "FLY", suffix: "WEIGHT"))
        info.wordBank.append(Word(prefix: "BUTTER", link: "FLY", suffix: "WHEEL"))
        
        info.wordBank.append(Word(prefix: "DRAGON", link: "FLY", suffix: "BY"))
        info.wordBank.append(Word(prefix: "DRAGON", link: "FLY", suffix: "WEIGHT"))
        info.wordBank.append(Word(prefix: "DRAGON", link: "FLY", suffix: "WHEEL"))
        
        info.wordBank.append(Word(prefix: "FIRE", link: "FLY", suffix: "BY"))
        info.wordBank.append(Word(prefix: "FIRE", link: "FLY", suffix: "WEIGHT"))
        info.wordBank.append(Word(prefix: "FIRE", link: "FLY", suffix: "WHEEL"))
        
        info.wordBank.append(Word(prefix: "BARE", link: "FOOT", suffix: "BALL"))
        info.wordBank.append(Word(prefix: "BARE", link: "FOOT", suffix: "HILLS"))
        info.wordBank.append(Word(prefix: "BARE", link: "FOOT", suffix: "LIGHTS"))
        info.wordBank.append(Word(prefix: "BARE", link: "FOOT", suffix: "MAN"))
        info.wordBank.append(Word(prefix: "BARE", link: "FOOT", suffix: "NOTE"))
        info.wordBank.append(Word(prefix: "BARE", link: "FOOT", suffix: "PRINT"))
        info.wordBank.append(Word(prefix: "BARE", link: "FOOT", suffix: "REST"))
        info.wordBank.append(Word(prefix: "BARE", link: "FOOT", suffix: "STEP"))
        info.wordBank.append(Word(prefix: "BARE", link: "FOOT", suffix: "STOOL"))
        info.wordBank.append(Word(prefix: "BARE", link: "FOOT", suffix: "WEAR"))
        
        info.wordBank.append(Word(prefix: "BE", link: "FORE", suffix: "CAST"))
        info.wordBank.append(Word(prefix: "BE", link: "FORE", suffix: "CLOSE"))
        info.wordBank.append(Word(prefix: "BE", link: "FORE", suffix: "MAN"))
        info.wordBank.append(Word(prefix: "BE", link: "FORE", suffix: "MOST"))
        info.wordBank.append(Word(prefix: "BE", link: "FORE", suffix: "SHADOW"))
        info.wordBank.append(Word(prefix: "BE", link: "FORE", suffix: "SIGHT"))
        info.wordBank.append(Word(prefix: "HERETO", link: "FORE", suffix: "CAST"))
        info.wordBank.append(Word(prefix: "HERETO", link: "FORE", suffix: "CLOSE"))
        info.wordBank.append(Word(prefix: "HERETO", link: "FORE", suffix: "MAN"))
        info.wordBank.append(Word(prefix: "HERETO", link: "FORE", suffix: "MOST"))
        info.wordBank.append(Word(prefix: "HERETO", link: "FORE", suffix: "SHADOW"))
        info.wordBank.append(Word(prefix: "HERETO", link: "FORE", suffix: "SIGHT"))
        
        info.wordBank.append(Word(prefix: "OUT", link: "FOX", suffix: "GLOVE"))
        info.wordBank.append(Word(prefix: "OUT", link: "FOX", suffix: "HOLE"))
        
        info.wordBank.append(Word(prefix: "COLD", link: "FRAME", suffix: "WORK"))
        
        info.wordBank.append(Word(prefix: "CARE", link: "FREE", suffix: "WAY"))
        info.wordBank.append(Word(prefix: "CHILD", link: "FREE", suffix: "WAY"))
        info.wordBank.append(Word(prefix: "BULL", link: "FROG", suffix: "MAN"))
        info.wordBank.append(Word(prefix: "FROG", link: "FROG", suffix: "MAN"))
        
        info.wordBank.append(Word(prefix: "BREAD", link: "FRUIT", suffix: "CAKE"))
        info.wordBank.append(Word(prefix: "GRAPE", link: "FRUIT", suffix: "CAKE"))
        info.wordBank.append(Word(prefix: "JACK", link: "FRUIT", suffix: "CAKE"))
        info.wordBank.append(Word(prefix: "PASSION", link: "FRUIT", suffix: "CAKE"))
        
        info.wordBank.append(Word(prefix: "CRAB", link: "GRASS", suffix: "HOPPER"))
        info.wordBank.append(Word(prefix: "CRAB", link: "GRASS", suffix: "LANDS"))
        info.wordBank.append(Word(prefix: "SEA", link: "GRASS", suffix: "HOPPER"))
        info.wordBank.append(Word(prefix: "SEA", link: "GRASS", suffix: "LANDS"))
        
        info.wordBank.append(Word(prefix: "EVER", link: "GREEN", suffix: "BACK"))
        info.wordBank.append(Word(prefix: "EVER", link: "GREEN", suffix: "GROCER"))
        info.wordBank.append(Word(prefix: "EVER", link: "GREEN", suffix: "HORN"))
        info.wordBank.append(Word(prefix: "EVER", link: "GREEN", suffix: "HOUSE"))
        info.wordBank.append(Word(prefix: "EVER", link: "GREEN", suffix: "LAND"))
        info.wordBank.append(Word(prefix: "EVER", link: "GREEN", suffix: "LIGHT"))
        
        
        info.wordBank.append(Word(prefix: "BACK", link: "GROUND", suffix: "CHECK"))
        
        info.wordBank.append(Word(prefix: "BACK", link: "GROUND", suffix: "BREAKING"))
        info.wordBank.append(Word(prefix: "BACK", link: "GROUND", suffix: "COVER"))
        info.wordBank.append(Word(prefix: "BACK", link: "GROUND", suffix: "HOG"))
        info.wordBank.append(Word(prefix: "BACK", link: "GROUND", suffix: "SPEED"))
        info.wordBank.append(Word(prefix: "BACK", link: "GROUND", suffix: "WORK"))
        info.wordBank.append(Word(prefix: "HIGH", link: "GROUND", suffix: "BREAKING"))
        info.wordBank.append(Word(prefix: "HIGH", link: "GROUND", suffix: "COVER"))
        info.wordBank.append(Word(prefix: "HIGH", link: "GROUND", suffix: "HOG"))
        info.wordBank.append(Word(prefix: "HIGH", link: "GROUND", suffix: "SPEED"))
        info.wordBank.append(Word(prefix: "HIGH", link: "GROUND", suffix: "WORK"))
        info.wordBank.append(Word(prefix: "PLAY", link: "GROUND", suffix: "BREAKING"))
        info.wordBank.append(Word(prefix: "PLAY", link: "GROUND", suffix: "COVER"))
        info.wordBank.append(Word(prefix: "PLAY", link: "GROUND", suffix: "HOG"))
        info.wordBank.append(Word(prefix: "PLAY", link: "GROUND", suffix: "SPEED"))
        info.wordBank.append(Word(prefix: "PLAY", link: "GROUND", suffix: "WORK"))
        info.wordBank.append(Word(prefix: "UNDER", link: "GROUND", suffix: "BREAKING"))
        info.wordBank.append(Word(prefix: "UNDER", link: "GROUND", suffix: "COVER"))
        info.wordBank.append(Word(prefix: "UNDER", link: "GROUND", suffix: "HOG"))
        info.wordBank.append(Word(prefix: "UNDER", link: "GROUND", suffix: "SPEED"))
        info.wordBank.append(Word(prefix: "UNDER", link: "GROUND", suffix: "WORK"))
        
        info.wordBank.append(Word(prefix: "OUT", link: "GROWN", suffix: "UP"))
        info.wordBank.append(Word(prefix: "OVER", link: "GROWN", suffix: "UP"))
        
        info.wordBank.append(Word(prefix: "BUBBLE", link: "GUM", suffix: "DROP"))
        
        info.wordBank.append(Word(prefix: "HAND", link: "GUN", suffix: "FIRE"))
        info.wordBank.append(Word(prefix: "HAND", link: "GUN", suffix: "METAL"))
        info.wordBank.append(Word(prefix: "HAND", link: "GUN", suffix: "POWDER"))
        
        
        // start hand - back
        info.wordBank.append(Word(prefix: "BACK", link: "HAND", suffix: "BAG"))
        info.wordBank.append(Word(prefix: "BACK", link: "HAND", suffix: "BALL"))
        info.wordBank.append(Word(prefix: "BACK", link: "HAND", suffix: "BOOK"))
        info.wordBank.append(Word(prefix: "BACK", link: "HAND", suffix: "CUFF"))
        info.wordBank.append(Word(prefix: "BACK", link: "HAND", suffix: "GUN"))
        
        info.wordBank.append(Word(prefix: "BACK", link: "HAND", suffix: "GRENADE"))
        info.wordBank.append(Word(prefix: "BACK", link: "HAND", suffix: "HELD"))
        info.wordBank.append(Word(prefix: "BACK", link: "HAND", suffix: "HOLD"))
        info.wordBank.append(Word(prefix: "BACK", link: "HAND", suffix: "MADE"))
        info.wordBank.append(Word(prefix: "BACK", link: "HAND", suffix: "OVER"))
        
        info.wordBank.append(Word(prefix: "BACK", link: "HAND", suffix: "PRINT"))
        info.wordBank.append(Word(prefix: "BACK", link: "HAND", suffix: "PUPPET"))
        info.wordBank.append(Word(prefix: "BACK", link: "HAND", suffix: "RAIL"))
        info.wordBank.append(Word(prefix: "BACK", link: "HAND", suffix: "SET"))
        info.wordBank.append(Word(prefix: "BACK", link: "HAND", suffix: "SHAKE"))
        
        info.wordBank.append(Word(prefix: "BACK", link: "HAND", suffix: "SPRING"))
        info.wordBank.append(Word(prefix: "BACK", link: "HAND", suffix: "STAND"))
        info.wordBank.append(Word(prefix: "BACK", link: "HAND", suffix: "WAVING"))
        info.wordBank.append(Word(prefix: "BACK", link: "HAND", suffix: "WORK"))
        info.wordBank.append(Word(prefix: "BACK", link: "HAND", suffix: "WRITING"))
        // end hand - back
        
        // start hand - before
        info.wordBank.append(Word(prefix: "BEFORE", link: "HAND", suffix: "BAG"))
        info.wordBank.append(Word(prefix: "BEFORE", link: "HAND", suffix: "BALL"))
        info.wordBank.append(Word(prefix: "BEFORE", link: "HAND", suffix: "BOOK"))
        info.wordBank.append(Word(prefix: "BEFORE", link: "HAND", suffix: "CUFF"))
        info.wordBank.append(Word(prefix: "BEFORE", link: "HAND", suffix: "GUN"))
        
        info.wordBank.append(Word(prefix: "BEFORE", link: "HAND", suffix: "GRENADE"))
        info.wordBank.append(Word(prefix: "BEFORE", link: "HAND", suffix: "HELD"))
        info.wordBank.append(Word(prefix: "BEFORE", link: "HAND", suffix: "HOLD"))
        info.wordBank.append(Word(prefix: "BEFORE", link: "HAND", suffix: "MADE"))
        info.wordBank.append(Word(prefix: "BEFORE", link: "HAND", suffix: "OVER"))
        
        info.wordBank.append(Word(prefix: "BEFORE", link: "HAND", suffix: "PRINT"))
        info.wordBank.append(Word(prefix: "BEFORE", link: "HAND", suffix: "PUPPET"))
        info.wordBank.append(Word(prefix: "BEFORE", link: "HAND", suffix: "RAIL"))
        info.wordBank.append(Word(prefix: "BEFORE", link: "HAND", suffix: "SET"))
        info.wordBank.append(Word(prefix: "BEFORE", link: "HAND", suffix: "SHAKE"))
        
        info.wordBank.append(Word(prefix: "BEFORE", link: "HAND", suffix: "SPRING"))
        info.wordBank.append(Word(prefix: "BEFORE", link: "HAND", suffix: "STAND"))
        info.wordBank.append(Word(prefix: "BEFORE", link: "HAND", suffix: "WAVING"))
        info.wordBank.append(Word(prefix: "BEFORE", link: "HAND", suffix: "WORK"))
        info.wordBank.append(Word(prefix: "BEFORE", link: "HAND", suffix: "WRITING"))
        // end hand - before
        
        // start hand - first
        info.wordBank.append(Word(prefix: "FIRST", link: "HAND", suffix: "BAG"))
        info.wordBank.append(Word(prefix: "FIRST", link: "HAND", suffix: "BALL"))
        info.wordBank.append(Word(prefix: "FIRST", link: "HAND", suffix: "BOOK"))
        info.wordBank.append(Word(prefix: "FIRST", link: "HAND", suffix: "CUFF"))
        info.wordBank.append(Word(prefix: "FIRST", link: "HAND", suffix: "GUN"))
        
        info.wordBank.append(Word(prefix: "FIRST", link: "HAND", suffix: "GRENADE"))
        info.wordBank.append(Word(prefix: "FIRST", link: "HAND", suffix: "HELD"))
        info.wordBank.append(Word(prefix: "FIRST", link: "HAND", suffix: "HOLD"))
        info.wordBank.append(Word(prefix: "FIRST", link: "HAND", suffix: "MADE"))
        info.wordBank.append(Word(prefix: "FIRST", link: "HAND", suffix: "OVER"))
        
        info.wordBank.append(Word(prefix: "FIRST", link: "HAND", suffix: "PRINT"))
        info.wordBank.append(Word(prefix: "FIRST", link: "HAND", suffix: "PUPPET"))
        info.wordBank.append(Word(prefix: "FIRST", link: "HAND", suffix: "RAIL"))
        info.wordBank.append(Word(prefix: "FIRST", link: "HAND", suffix: "SET"))
        info.wordBank.append(Word(prefix: "FIRST", link: "HAND", suffix: "SHAKE"))
        
        info.wordBank.append(Word(prefix: "FIRST", link: "HAND", suffix: "SPRING"))
        info.wordBank.append(Word(prefix: "FIRST", link: "HAND", suffix: "STAND"))
        info.wordBank.append(Word(prefix: "FIRST", link: "HAND", suffix: "WAVING"))
        info.wordBank.append(Word(prefix: "FIRST", link: "HAND", suffix: "WORK"))
        info.wordBank.append(Word(prefix: "FIRST", link: "HAND", suffix: "WRITING"))
        // end hand - first
        
        // start hand - long
        info.wordBank.append(Word(prefix: "LONG", link: "HAND", suffix: "BAG"))
        info.wordBank.append(Word(prefix: "LONG", link: "HAND", suffix: "BALL"))
        info.wordBank.append(Word(prefix: "LONG", link: "HAND", suffix: "BOOK"))
        info.wordBank.append(Word(prefix: "LONG", link: "HAND", suffix: "CUFF"))
        info.wordBank.append(Word(prefix: "LONG", link: "HAND", suffix: "GUN"))
        
        info.wordBank.append(Word(prefix: "LONG", link: "HAND", suffix: "GRENADE"))
        info.wordBank.append(Word(prefix: "LONG", link: "HAND", suffix: "HELD"))
        info.wordBank.append(Word(prefix: "LONG", link: "HAND", suffix: "HOLD"))
        info.wordBank.append(Word(prefix: "LONG", link: "HAND", suffix: "MADE"))
        info.wordBank.append(Word(prefix: "LONG", link: "HAND", suffix: "OVER"))
        
        info.wordBank.append(Word(prefix: "LONG", link: "HAND", suffix: "PRINT"))
        info.wordBank.append(Word(prefix: "LONG", link: "HAND", suffix: "PUPPET"))
        info.wordBank.append(Word(prefix: "LONG", link: "HAND", suffix: "RAIL"))
        info.wordBank.append(Word(prefix: "LONG", link: "HAND", suffix: "SET"))
        info.wordBank.append(Word(prefix: "LONG", link: "HAND", suffix: "SHAKE"))
        
        info.wordBank.append(Word(prefix: "LONG", link: "HAND", suffix: "SPRING"))
        info.wordBank.append(Word(prefix: "LONG", link: "HAND", suffix: "STAND"))
        info.wordBank.append(Word(prefix: "LONG", link: "HAND", suffix: "WAVING"))
        info.wordBank.append(Word(prefix: "LONG", link: "HAND", suffix: "WORK"))
        info.wordBank.append(Word(prefix: "LONG", link: "HAND", suffix: "WRITING"))
        // end hand - long
        
        // start hand - over
        info.wordBank.append(Word(prefix: "OVER", link: "HAND", suffix: "BAG"))
        info.wordBank.append(Word(prefix: "OVER", link: "HAND", suffix: "BALL"))
        info.wordBank.append(Word(prefix: "OVER", link: "HAND", suffix: "BOOK"))
        info.wordBank.append(Word(prefix: "OVER", link: "HAND", suffix: "CUFF"))
        info.wordBank.append(Word(prefix: "OVER", link: "HAND", suffix: "GUN"))
        
        info.wordBank.append(Word(prefix: "OVER", link: "HAND", suffix: "GRENADE"))
        info.wordBank.append(Word(prefix: "OVER", link: "HAND", suffix: "HELD"))
        info.wordBank.append(Word(prefix: "OVER", link: "HAND", suffix: "HOLD"))
        info.wordBank.append(Word(prefix: "OVER", link: "HAND", suffix: "MADE"))
        info.wordBank.append(Word(prefix: "OVER", link: "HAND", suffix: "OVER"))
        
        info.wordBank.append(Word(prefix: "OVER", link: "HAND", suffix: "PRINT"))
        info.wordBank.append(Word(prefix: "OVER", link: "HAND", suffix: "PUPPET"))
        info.wordBank.append(Word(prefix: "OVER", link: "HAND", suffix: "RAIL"))
        info.wordBank.append(Word(prefix: "OVER", link: "HAND", suffix: "SET"))
        info.wordBank.append(Word(prefix: "OVER", link: "HAND", suffix: "SHAKE"))
        
        info.wordBank.append(Word(prefix: "OVER", link: "HAND", suffix: "SPRING"))
        info.wordBank.append(Word(prefix: "OVER", link: "HAND", suffix: "STAND"))
        info.wordBank.append(Word(prefix: "OVER", link: "HAND", suffix: "WAVING"))
        info.wordBank.append(Word(prefix: "OVER", link: "HAND", suffix: "WORK"))
        info.wordBank.append(Word(prefix: "OVER", link: "HAND", suffix: "WRITING"))
        // end hand - over
        
        // start hand - second
        info.wordBank.append(Word(prefix: "SECOND", link: "HAND", suffix: "BAG"))
        info.wordBank.append(Word(prefix: "SECOND", link: "HAND", suffix: "BALL"))
        info.wordBank.append(Word(prefix: "SECOND", link: "HAND", suffix: "BOOK"))
        info.wordBank.append(Word(prefix: "SECOND", link: "HAND", suffix: "CUFF"))
        info.wordBank.append(Word(prefix: "SECOND", link: "HAND", suffix: "GUN"))
        
        info.wordBank.append(Word(prefix: "SECOND", link: "HAND", suffix: "GRENADE"))
        info.wordBank.append(Word(prefix: "SECOND", link: "HAND", suffix: "HELD"))
        info.wordBank.append(Word(prefix: "SECOND", link: "HAND", suffix: "HOLD"))
        info.wordBank.append(Word(prefix: "SECOND", link: "HAND", suffix: "MADE"))
        info.wordBank.append(Word(prefix: "SECOND", link: "HAND", suffix: "OVER"))
        
        info.wordBank.append(Word(prefix: "SECOND", link: "HAND", suffix: "PRINT"))
        info.wordBank.append(Word(prefix: "SECOND", link: "HAND", suffix: "PUPPET"))
        info.wordBank.append(Word(prefix: "SECOND", link: "HAND", suffix: "RAIL"))
        info.wordBank.append(Word(prefix: "SECOND", link: "HAND", suffix: "SET"))
        info.wordBank.append(Word(prefix: "SECOND", link: "HAND", suffix: "SHAKE"))
        
        info.wordBank.append(Word(prefix: "SECOND", link: "HAND", suffix: "SPRING"))
        info.wordBank.append(Word(prefix: "SECOND", link: "HAND", suffix: "STAND"))
        info.wordBank.append(Word(prefix: "SECOND", link: "HAND", suffix: "WAVING"))
        info.wordBank.append(Word(prefix: "SECOND", link: "HAND", suffix: "WORK"))
        info.wordBank.append(Word(prefix: "SECOND", link: "HAND", suffix: "WRITING"))
        // end hand - second
        
        // start hand - short
        info.wordBank.append(Word(prefix: "SHORT", link: "HAND", suffix: "BAG"))
        info.wordBank.append(Word(prefix: "SHORT", link: "HAND", suffix: "BALL"))
        info.wordBank.append(Word(prefix: "SHORT", link: "HAND", suffix: "BOOK"))
        info.wordBank.append(Word(prefix: "SHORT", link: "HAND", suffix: "CUFF"))
        info.wordBank.append(Word(prefix: "SHORT", link: "HAND", suffix: "GUN"))
        
        info.wordBank.append(Word(prefix: "SHORT", link: "HAND", suffix: "GRENADE"))
        info.wordBank.append(Word(prefix: "SHORT", link: "HAND", suffix: "HELD"))
        info.wordBank.append(Word(prefix: "SHORT", link: "HAND", suffix: "HOLD"))
        info.wordBank.append(Word(prefix: "SHORT", link: "HAND", suffix: "MADE"))
        info.wordBank.append(Word(prefix: "SHORT", link: "HAND", suffix: "OVER"))
        
        info.wordBank.append(Word(prefix: "SHORT", link: "HAND", suffix: "PRINT"))
        info.wordBank.append(Word(prefix: "SHORT", link: "HAND", suffix: "PUPPET"))
        info.wordBank.append(Word(prefix: "SHORT", link: "HAND", suffix: "RAIL"))
        info.wordBank.append(Word(prefix: "SHORT", link: "HAND", suffix: "SET"))
        info.wordBank.append(Word(prefix: "SHORT", link: "HAND", suffix: "SHAKE"))
        
        info.wordBank.append(Word(prefix: "SHORT", link: "HAND", suffix: "SPRING"))
        info.wordBank.append(Word(prefix: "SHORT", link: "HAND", suffix: "STAND"))
        info.wordBank.append(Word(prefix: "SHORT", link: "HAND", suffix: "WAVING"))
        info.wordBank.append(Word(prefix: "SHORT", link: "HAND", suffix: "WORK"))
        info.wordBank.append(Word(prefix: "SHORT", link: "HAND", suffix: "WRITING"))
        // end hand - short
        
        // start hand - under
        info.wordBank.append(Word(prefix: "UNDER", link: "HAND", suffix: "BAG"))
        info.wordBank.append(Word(prefix: "UNDER", link: "HAND", suffix: "BALL"))
        info.wordBank.append(Word(prefix: "UNDER", link: "HAND", suffix: "BOOK"))
        info.wordBank.append(Word(prefix: "UNDER", link: "HAND", suffix: "CUFF"))
        info.wordBank.append(Word(prefix: "UNDER", link: "HAND", suffix: "GUN"))
        
        info.wordBank.append(Word(prefix: "UNDER", link: "HAND", suffix: "GRENADE"))
        info.wordBank.append(Word(prefix: "UNDER", link: "HAND", suffix: "HELD"))
        info.wordBank.append(Word(prefix: "UNDER", link: "HAND", suffix: "HOLD"))
        info.wordBank.append(Word(prefix: "UNDER", link: "HAND", suffix: "MADE"))
        info.wordBank.append(Word(prefix: "UNDER", link: "HAND", suffix: "OVER"))
        
        info.wordBank.append(Word(prefix: "UNDER", link: "HAND", suffix: "PRINT"))
        info.wordBank.append(Word(prefix: "UNDER", link: "HAND", suffix: "PUPPET"))
        info.wordBank.append(Word(prefix: "UNDER", link: "HAND", suffix: "RAIL"))
        info.wordBank.append(Word(prefix: "UNDER", link: "HAND", suffix: "SET"))
        info.wordBank.append(Word(prefix: "UNDER", link: "HAND", suffix: "SHAKE"))
        
        info.wordBank.append(Word(prefix: "UNDER", link: "HAND", suffix: "SPRING"))
        info.wordBank.append(Word(prefix: "UNDER", link: "HAND", suffix: "STAND"))
        info.wordBank.append(Word(prefix: "UNDER", link: "HAND", suffix: "WAVING"))
        info.wordBank.append(Word(prefix: "UNDER", link: "HAND", suffix: "WORK"))
        info.wordBank.append(Word(prefix: "UNDER", link: "HAND", suffix: "WRITING"))
        // end hand - under
        
        info.wordBank.append(Word(prefix: "PAN", link: "HANDLE", suffix: "BARS"))
        
        info.wordBank.append(Word(prefix: "OVER", link: "HANG", suffix: "MAN"))
        info.wordBank.append(Word(prefix: "OVER", link: "HANG", suffix: "NAIL"))
        info.wordBank.append(Word(prefix: "OVER", link: "HANG", suffix: "OUT"))
        
        info.wordBank.append(Word(prefix: "SWEET", link: "HEART", suffix: "BEAT"))
        info.wordBank.append(Word(prefix: "SWEET", link: "HEART", suffix: "BURN"))
        info.wordBank.append(Word(prefix: "SWEET", link: "HEART", suffix: "SICK"))
        
        info.wordBank.append(Word(prefix: "LION", link: "HEART", suffix: "BEAT"))
        info.wordBank.append(Word(prefix: "LION", link: "HEART", suffix: "BURN"))
        info.wordBank.append(Word(prefix: "LION", link: "HEART", suffix: "SICK"))
        
        // start head - arrow
        info.wordBank.append(Word(prefix: "ARROW", link: "HEAD", suffix: "ACHE"))
        info.wordBank.append(Word(prefix: "ARROW", link: "HEAD", suffix: "BOARD"))
        info.wordBank.append(Word(prefix: "ARROW", link: "HEAD", suffix: "DRESS"))
        info.wordBank.append(Word(prefix: "ARROW", link: "HEAD", suffix: "FIRST"))
        info.wordBank.append(Word(prefix: "ARROW", link: "HEAD", suffix: "HUNTER"))
        info.wordBank.append(Word(prefix: "ARROW", link: "HEAD", suffix: "LAND"))
        info.wordBank.append(Word(prefix: "ARROW", link: "HEAD", suffix: "LIGHT"))
        info.wordBank.append(Word(prefix: "ARROW", link: "HEAD", suffix: "LINE"))
        info.wordBank.append(Word(prefix: "ARROW", link: "HEAD", suffix: "PHONE"))
        info.wordBank.append(Word(prefix: "ARROW", link: "HEAD", suffix: "QUARTERS"))
        info.wordBank.append(Word(prefix: "ARROW", link: "HEAD", suffix: "REST"))
        info.wordBank.append(Word(prefix: "ARROW", link: "HEAD", suffix: "SET"))
        info.wordBank.append(Word(prefix: "ARROW", link: "HEAD", suffix: "STONE"))
        info.wordBank.append(Word(prefix: "ARROW", link: "HEAD", suffix: "STAND"))
        info.wordBank.append(Word(prefix: "ARROW", link: "HEAD", suffix: "WATERS"))
        info.wordBank.append(Word(prefix: "ARROW", link: "HEAD", suffix: "WAY"))
        // end head - arrow
        
        // start head - bulk
        info.wordBank.append(Word(prefix: "BULK", link: "HEAD", suffix: "ACHE"))
        info.wordBank.append(Word(prefix: "BULK", link: "HEAD", suffix: "BOARD"))
        info.wordBank.append(Word(prefix: "BULK", link: "HEAD", suffix: "DRESS"))
        info.wordBank.append(Word(prefix: "BULK", link: "HEAD", suffix: "FIRST"))
        info.wordBank.append(Word(prefix: "BULK", link: "HEAD", suffix: "HUNTER"))
        info.wordBank.append(Word(prefix: "BULK", link: "HEAD", suffix: "LAND"))
        info.wordBank.append(Word(prefix: "BULK", link: "HEAD", suffix: "LIGHT"))
        info.wordBank.append(Word(prefix: "BULK", link: "HEAD", suffix: "LINE"))
        info.wordBank.append(Word(prefix: "BULK", link: "HEAD", suffix: "PHONE"))
        info.wordBank.append(Word(prefix: "BULK", link: "HEAD", suffix: "QUARTERS"))
        info.wordBank.append(Word(prefix: "BULK", link: "HEAD", suffix: "REST"))
        info.wordBank.append(Word(prefix: "BULK", link: "HEAD", suffix: "SET"))
        info.wordBank.append(Word(prefix: "BULK", link: "HEAD", suffix: "STONE"))
        info.wordBank.append(Word(prefix: "BULK", link: "HEAD", suffix: "STAND"))
        info.wordBank.append(Word(prefix: "BULK", link: "HEAD", suffix: "WATERS"))
        info.wordBank.append(Word(prefix: "BULK", link: "HEAD", suffix: "WAY"))
        // end head - bulk
        
        // start head - egg
        info.wordBank.append(Word(prefix: "EGG", link: "HEAD", suffix: "ACHE"))
        info.wordBank.append(Word(prefix: "EGG", link: "HEAD", suffix: "BOARD"))
        info.wordBank.append(Word(prefix: "EGG", link: "HEAD", suffix: "DRESS"))
        info.wordBank.append(Word(prefix: "EGG", link: "HEAD", suffix: "FIRST"))
        info.wordBank.append(Word(prefix: "EGG", link: "HEAD", suffix: "HUNTER"))
        info.wordBank.append(Word(prefix: "EGG", link: "HEAD", suffix: "LAND"))
        info.wordBank.append(Word(prefix: "EGG", link: "HEAD", suffix: "LIGHT"))
        info.wordBank.append(Word(prefix: "EGG", link: "HEAD", suffix: "LINE"))
        info.wordBank.append(Word(prefix: "EGG", link: "HEAD", suffix: "PHONE"))
        info.wordBank.append(Word(prefix: "EGG", link: "HEAD", suffix: "QUARTERS"))
        info.wordBank.append(Word(prefix: "EGG", link: "HEAD", suffix: "REST"))
        info.wordBank.append(Word(prefix: "EGG", link: "HEAD", suffix: "SET"))
        info.wordBank.append(Word(prefix: "EGG", link: "HEAD", suffix: "STONE"))
        info.wordBank.append(Word(prefix: "EGG", link: "HEAD", suffix: "STAND"))
        info.wordBank.append(Word(prefix: "EGG", link: "HEAD", suffix: "WATERS"))
        info.wordBank.append(Word(prefix: "EGG", link: "HEAD", suffix: "WAY"))
        // end head - egg
        
        // start head - hot
        info.wordBank.append(Word(prefix: "HOT", link: "HEAD", suffix: "ACHE"))
        info.wordBank.append(Word(prefix: "HOT", link: "HEAD", suffix: "BOARD"))
        info.wordBank.append(Word(prefix: "HOT", link: "HEAD", suffix: "DRESS"))
        info.wordBank.append(Word(prefix: "HOT", link: "HEAD", suffix: "FIRST"))
        info.wordBank.append(Word(prefix: "HOT", link: "HEAD", suffix: "HUNTER"))
        info.wordBank.append(Word(prefix: "HOT", link: "HEAD", suffix: "LAND"))
        info.wordBank.append(Word(prefix: "HOT", link: "HEAD", suffix: "LIGHT"))
        info.wordBank.append(Word(prefix: "HOT", link: "HEAD", suffix: "LINE"))
        info.wordBank.append(Word(prefix: "HOT", link: "HEAD", suffix: "PHONE"))
        info.wordBank.append(Word(prefix: "HOT", link: "HEAD", suffix: "QUARTERS"))
        info.wordBank.append(Word(prefix: "HOT", link: "HEAD", suffix: "REST"))
        info.wordBank.append(Word(prefix: "HOT", link: "HEAD", suffix: "SET"))
        info.wordBank.append(Word(prefix: "HOT", link: "HEAD", suffix: "STONE"))
        info.wordBank.append(Word(prefix: "HOT", link: "HEAD", suffix: "STAND"))
        info.wordBank.append(Word(prefix: "HOT", link: "HEAD", suffix: "WATERS"))
        info.wordBank.append(Word(prefix: "HOT", link: "HEAD", suffix: "WAY"))
        // end head - hot
        
        // start head - over
        info.wordBank.append(Word(prefix: "OVER", link: "HEAD", suffix: "ACHE"))
        info.wordBank.append(Word(prefix: "OVER", link: "HEAD", suffix: "BOARD"))
        info.wordBank.append(Word(prefix: "OVER", link: "HEAD", suffix: "DRESS"))
        info.wordBank.append(Word(prefix: "OVER", link: "HEAD", suffix: "FIRST"))
        info.wordBank.append(Word(prefix: "OVER", link: "HEAD", suffix: "HUNTER"))
        info.wordBank.append(Word(prefix: "OVER", link: "HEAD", suffix: "LAND"))
        info.wordBank.append(Word(prefix: "OVER", link: "HEAD", suffix: "LIGHT"))
        info.wordBank.append(Word(prefix: "OVER", link: "HEAD", suffix: "LINE"))
        info.wordBank.append(Word(prefix: "OVER", link: "HEAD", suffix: "PHONE"))
        info.wordBank.append(Word(prefix: "OVER", link: "HEAD", suffix: "QUARTERS"))
        info.wordBank.append(Word(prefix: "OVER", link: "HEAD", suffix: "REST"))
        info.wordBank.append(Word(prefix: "OVER", link: "HEAD", suffix: "SET"))
        info.wordBank.append(Word(prefix: "OVER", link: "HEAD", suffix: "STONE"))
        info.wordBank.append(Word(prefix: "OVER", link: "HEAD", suffix: "STAND"))
        info.wordBank.append(Word(prefix: "OVER", link: "HEAD", suffix: "WATERS"))
        info.wordBank.append(Word(prefix: "OVER", link: "HEAD", suffix: "WAY"))
        // end head - over
        
        // start head - red
        info.wordBank.append(Word(prefix: "RED", link: "HEAD", suffix: "ACHE"))
        info.wordBank.append(Word(prefix: "RED", link: "HEAD", suffix: "BOARD"))
        info.wordBank.append(Word(prefix: "RED", link: "HEAD", suffix: "DRESS"))
        info.wordBank.append(Word(prefix: "RED", link: "HEAD", suffix: "FIRST"))
        info.wordBank.append(Word(prefix: "RED", link: "HEAD", suffix: "HUNTER"))
        info.wordBank.append(Word(prefix: "RED", link: "HEAD", suffix: "LAND"))
        info.wordBank.append(Word(prefix: "RED", link: "HEAD", suffix: "LIGHT"))
        info.wordBank.append(Word(prefix: "RED", link: "HEAD", suffix: "LINE"))
        info.wordBank.append(Word(prefix: "RED", link: "HEAD", suffix: "PHONE"))
        info.wordBank.append(Word(prefix: "RED", link: "HEAD", suffix: "QUARTERS"))
        info.wordBank.append(Word(prefix: "RED", link: "HEAD", suffix: "REST"))
        info.wordBank.append(Word(prefix: "RED", link: "HEAD", suffix: "SET"))
        info.wordBank.append(Word(prefix: "RED", link: "HEAD", suffix: "STONE"))
        info.wordBank.append(Word(prefix: "RED", link: "HEAD", suffix: "STAND"))
        info.wordBank.append(Word(prefix: "RED", link: "HEAD", suffix: "WATERS"))
        info.wordBank.append(Word(prefix: "RED", link: "HEAD", suffix: "WAY"))
        // end head - red
        
        // start head - sleepy
        info.wordBank.append(Word(prefix: "SLEEPY", link: "HEAD", suffix: "ACHE"))
        info.wordBank.append(Word(prefix: "SLEEPY", link: "HEAD", suffix: "BOARD"))
        info.wordBank.append(Word(prefix: "SLEEPY", link: "HEAD", suffix: "DRESS"))
        info.wordBank.append(Word(prefix: "SLEEPY", link: "HEAD", suffix: "FIRST"))
        info.wordBank.append(Word(prefix: "SLEEPY", link: "HEAD", suffix: "HUNTER"))
        info.wordBank.append(Word(prefix: "SLEEPY", link: "HEAD", suffix: "LAND"))
        info.wordBank.append(Word(prefix: "SLEEPY", link: "HEAD", suffix: "LIGHT"))
        info.wordBank.append(Word(prefix: "SLEEPY", link: "HEAD", suffix: "LINE"))
        info.wordBank.append(Word(prefix: "SLEEPY", link: "HEAD", suffix: "PHONE"))
        info.wordBank.append(Word(prefix: "SLEEPY", link: "HEAD", suffix: "QUARTERS"))
        info.wordBank.append(Word(prefix: "SLEEPY", link: "HEAD", suffix: "REST"))
        info.wordBank.append(Word(prefix: "SLEEPY", link: "HEAD", suffix: "SET"))
        info.wordBank.append(Word(prefix: "SLEEPY", link: "HEAD", suffix: "STONE"))
        info.wordBank.append(Word(prefix: "SLEEPY", link: "HEAD", suffix: "STAND"))
        info.wordBank.append(Word(prefix: "SLEEPY", link: "HEAD", suffix: "WATERS"))
        info.wordBank.append(Word(prefix: "SLEEPY", link: "HEAD", suffix: "WAY"))
        // end head - sleepy
        
        info.wordBank.append(Word(prefix: "ON", link: "HIGH", suffix: "BROW"))
        info.wordBank.append(Word(prefix: "ON", link: "HIGH", suffix: "CHAIR"))
        info.wordBank.append(Word(prefix: "ON", link: "HIGH", suffix: "FLIER"))
        info.wordBank.append(Word(prefix: "ON", link: "HIGH", suffix: "GROUND"))
        info.wordBank.append(Word(prefix: "ON", link: "HIGH", suffix: "HANDED"))
        
        info.wordBank.append(Word(prefix: "ON", link: "HIGH", suffix: "JACK"))
        info.wordBank.append(Word(prefix: "ON", link: "HIGH", suffix: "LANDER"))
        info.wordBank.append(Word(prefix: "ON", link: "HIGH", suffix: "LANDS"))
        info.wordBank.append(Word(prefix: "ON", link: "HIGH", suffix: "LIGHT"))
        info.wordBank.append(Word(prefix: "ON", link: "HIGH", suffix: "POINT"))
        
        info.wordBank.append(Word(prefix: "ON", link: "HIGH", suffix: "RISE"))
        info.wordBank.append(Word(prefix: "ON", link: "HIGH", suffix: "ROAD"))
        info.wordBank.append(Word(prefix: "ON", link: "HIGH", suffix: "SCHOOL"))
        info.wordBank.append(Word(prefix: "ON", link: "HIGH", suffix: "TAIL"))
        info.wordBank.append(Word(prefix: "ON", link: "HIGH", suffix: "TOPS"))
        
        info.wordBank.append(Word(prefix: "ON", link: "HIGH", suffix: "WATER"))
        info.wordBank.append(Word(prefix: "ON", link: "HIGH", suffix: "WAY"))
        info.wordBank.append(Word(prefix: "ON", link: "HIGH", suffix: "WAYMAN"))
        info.wordBank.append(Word(prefix: "ON", link: "HIGH", suffix: "WIRE"))
        
        info.wordBank.append(Word(prefix: "DOWN", link: "HILL", suffix: "SIDE"))
        info.wordBank.append(Word(prefix: "DOWN", link: "HILL", suffix: "TOP"))
        info.wordBank.append(Word(prefix: "FOOT", link: "HILL", suffix: "SIDE"))
        info.wordBank.append(Word(prefix: "FOOT", link: "HILL", suffix: "TOP"))
        info.wordBank.append(Word(prefix: "UP", link: "HILL", suffix: "SIDE"))
        info.wordBank.append(Word(prefix: "UP", link: "HILL", suffix: "TOP"))
        
        info.wordBank.append(Word(prefix: "GROUND", link: "HOG", suffix: "TIE"))
        info.wordBank.append(Word(prefix: "GROUND", link: "HOG", suffix: "WASH"))
        
        info.wordBank.append(Word(prefix: "HEDGE", link: "HOG", suffix: "TIE"))
        info.wordBank.append(Word(prefix: "HEDGE", link: "HOG", suffix: "WASH"))
        
        info.wordBank.append(Word(prefix: "DOWN", link: "HOME", suffix: "COMING"))
        info.wordBank.append(Word(prefix: "DOWN", link: "HOME", suffix: "LAND"))
        info.wordBank.append(Word(prefix: "DOWN", link: "HOME", suffix: "MADE"))
        info.wordBank.append(Word(prefix: "DOWN", link: "HOME", suffix: "OWNER"))
        info.wordBank.append(Word(prefix: "DOWN", link: "HOME", suffix: "SICK"))
        info.wordBank.append(Word(prefix: "DOWN", link: "HOME", suffix: "WARD"))
        info.wordBank.append(Word(prefix: "DOWN", link: "HOME", suffix: "WORK"))
        
        info.wordBank.append(Word(prefix: "FISH", link: "HOOK", suffix: "WORM"))
        
        info.wordBank.append(Word(prefix: "BELL", link: "HOP", suffix: "SCOTCH"))
        
        // start horse - clothes
        info.wordBank.append(Word(prefix: "CLOTHES", link: "HORSE", suffix: "BACK"))
        info.wordBank.append(Word(prefix: "CLOTHES", link: "HORSE", suffix: "FLY"))
        info.wordBank.append(Word(prefix: "CLOTHES", link: "HORSE", suffix: "LAUGH"))
        info.wordBank.append(Word(prefix: "CLOTHES", link: "HORSE", suffix: "MAN"))
        info.wordBank.append(Word(prefix: "CLOTHES", link: "HORSE", suffix: "PLAY"))
        info.wordBank.append(Word(prefix: "CLOTHES", link: "HORSE", suffix: "POWER"))
        info.wordBank.append(Word(prefix: "CLOTHES", link: "HORSE", suffix: "RADISH"))
        info.wordBank.append(Word(prefix: "CLOTHES", link: "HORSE", suffix: "SHOE"))
        // end horse
        
        // start horse - quarter
        info.wordBank.append(Word(prefix: "QUARTER", link: "HORSE", suffix: "BACK"))
        info.wordBank.append(Word(prefix: "QUARTER", link: "HORSE", suffix: "FLY"))
        info.wordBank.append(Word(prefix: "QUARTER", link: "HORSE", suffix: "LAUGH"))
        info.wordBank.append(Word(prefix: "QUARTER", link: "HORSE", suffix: "MAN"))
        info.wordBank.append(Word(prefix: "QUARTER", link: "HORSE", suffix: "PLAY"))
        info.wordBank.append(Word(prefix: "QUARTER", link: "HORSE", suffix: "POWER"))
        info.wordBank.append(Word(prefix: "QUARTER", link: "HORSE", suffix: "RADISH"))
        info.wordBank.append(Word(prefix: "QUARTER", link: "HORSE", suffix: "SHOE"))
        // end horse
        
        // start horse - race
        info.wordBank.append(Word(prefix: "RACE", link: "HORSE", suffix: "BACK"))
        info.wordBank.append(Word(prefix: "RACE", link: "HORSE", suffix: "FLY"))
        info.wordBank.append(Word(prefix: "RACE", link: "HORSE", suffix: "LAUGH"))
        info.wordBank.append(Word(prefix: "RACE", link: "HORSE", suffix: "MAN"))
        info.wordBank.append(Word(prefix: "RACE", link: "HORSE", suffix: "PLAY"))
        info.wordBank.append(Word(prefix: "RACE", link: "HORSE", suffix: "POWER"))
        info.wordBank.append(Word(prefix: "RACE", link: "HORSE", suffix: "RADISH"))
        info.wordBank.append(Word(prefix: "RACE", link: "HORSE", suffix: "SHOE"))
        // end horse
        
        // start horse - saw
        info.wordBank.append(Word(prefix: "SAW", link: "HORSE", suffix: "BACK"))
        info.wordBank.append(Word(prefix: "SAW", link: "HORSE", suffix: "FLY"))
        info.wordBank.append(Word(prefix: "SAW", link: "HORSE", suffix: "LAUGH"))
        info.wordBank.append(Word(prefix: "SAW", link: "HORSE", suffix: "MAN"))
        info.wordBank.append(Word(prefix: "SAW", link: "HORSE", suffix: "PLAY"))
        info.wordBank.append(Word(prefix: "SAW", link: "HORSE", suffix: "POWER"))
        info.wordBank.append(Word(prefix: "SAW", link: "HORSE", suffix: "RADISH"))
        info.wordBank.append(Word(prefix: "SAW", link: "HORSE", suffix: "SHOE"))
        // end horse
        
        // start horse - sea
        info.wordBank.append(Word(prefix: "SEA", link: "HORSE", suffix: "BACK"))
        info.wordBank.append(Word(prefix: "SEA", link: "HORSE", suffix: "FLY"))
        info.wordBank.append(Word(prefix: "SEA", link: "HORSE", suffix: "LAUGH"))
        info.wordBank.append(Word(prefix: "SEA", link: "HORSE", suffix: "MAN"))
        info.wordBank.append(Word(prefix: "SEA", link: "HORSE", suffix: "PLAY"))
        info.wordBank.append(Word(prefix: "SEA", link: "HORSE", suffix: "POWER"))
        info.wordBank.append(Word(prefix: "SEA", link: "HORSE", suffix: "RADISH"))
        info.wordBank.append(Word(prefix: "SEA", link: "HORSE", suffix: "SHOE"))
        // end horse
        
        // start horse - work
        info.wordBank.append(Word(prefix: "WORK", link: "HORSE", suffix: "BACK"))
        info.wordBank.append(Word(prefix: "WORK", link: "HORSE", suffix: "FLY"))
        info.wordBank.append(Word(prefix: "WORK", link: "HORSE", suffix: "LAUGH"))
        info.wordBank.append(Word(prefix: "WORK", link: "HORSE", suffix: "MAN"))
        info.wordBank.append(Word(prefix: "WORK", link: "HORSE", suffix: "PLAY"))
        info.wordBank.append(Word(prefix: "WORK", link: "HORSE", suffix: "POWER"))
        info.wordBank.append(Word(prefix: "WORK", link: "HORSE", suffix: "RADISH"))
        info.wordBank.append(Word(prefix: "WORK", link: "HORSE", suffix: "SHOE"))
        // end horse
        
        // start house - court
        info.wordBank.append(Word(prefix: "COURT", link: "HOUSE", suffix: "BOAT"))
        info.wordBank.append(Word(prefix: "COURT", link: "HOUSE", suffix: "BREAKING"))
        info.wordBank.append(Word(prefix: "COURT", link: "HOUSE", suffix: "COAT"))
        info.wordBank.append(Word(prefix: "COURT", link: "HOUSE", suffix: "FLIES"))
        info.wordBank.append(Word(prefix: "COURT", link: "HOUSE", suffix: "HOLD"))
        info.wordBank.append(Word(prefix: "COURT", link: "HOUSE", suffix: "KEEPER"))
        info.wordBank.append(Word(prefix: "COURT", link: "HOUSE", suffix: "WARMING"))
        info.wordBank.append(Word(prefix: "COURT", link: "HOUSE", suffix: "WIFE"))
        info.wordBank.append(Word(prefix: "COURT", link: "HOUSE", suffix: "WORK"))
        // end house
        
        // start house - dog
        info.wordBank.append(Word(prefix: "DOG", link: "HOUSE", suffix: "BOAT"))
        info.wordBank.append(Word(prefix: "DOG", link: "HOUSE", suffix: "BREAKING"))
        info.wordBank.append(Word(prefix: "DOG", link: "HOUSE", suffix: "COAT"))
        info.wordBank.append(Word(prefix: "DOG", link: "HOUSE", suffix: "FLIES"))
        info.wordBank.append(Word(prefix: "DOG", link: "HOUSE", suffix: "HOLD"))
        info.wordBank.append(Word(prefix: "DOG", link: "HOUSE", suffix: "KEEPER"))
        info.wordBank.append(Word(prefix: "DOG", link: "HOUSE", suffix: "WARMING"))
        info.wordBank.append(Word(prefix: "DOG", link: "HOUSE", suffix: "WIFE"))
        info.wordBank.append(Word(prefix: "DOG", link: "HOUSE", suffix: "WORK"))
        // end house
        
        // start house - farm
        info.wordBank.append(Word(prefix: "FARM", link: "HOUSE", suffix: "BOAT"))
        info.wordBank.append(Word(prefix: "FARM", link: "HOUSE", suffix: "BREAKING"))
        info.wordBank.append(Word(prefix: "FARM", link: "HOUSE", suffix: "COAT"))
        info.wordBank.append(Word(prefix: "FARM", link: "HOUSE", suffix: "FLIES"))
        info.wordBank.append(Word(prefix: "FARM", link: "HOUSE", suffix: "HOLD"))
        info.wordBank.append(Word(prefix: "FARM", link: "HOUSE", suffix: "KEEPER"))
        info.wordBank.append(Word(prefix: "FARM", link: "HOUSE", suffix: "WARMING"))
        info.wordBank.append(Word(prefix: "FARM", link: "HOUSE", suffix: "WIFE"))
        info.wordBank.append(Word(prefix: "FARM", link: "HOUSE", suffix: "WORK"))
        // end house
        
        // start house - green
        info.wordBank.append(Word(prefix: "GREEN", link: "HOUSE", suffix: "BOAT"))
        info.wordBank.append(Word(prefix: "GREEN", link: "HOUSE", suffix: "BREAKING"))
        info.wordBank.append(Word(prefix: "GREEN", link: "HOUSE", suffix: "COAT"))
        info.wordBank.append(Word(prefix: "GREEN", link: "HOUSE", suffix: "FLIES"))
        info.wordBank.append(Word(prefix: "GREEN", link: "HOUSE", suffix: "HOLD"))
        info.wordBank.append(Word(prefix: "GREEN", link: "HOUSE", suffix: "KEEPER"))
        info.wordBank.append(Word(prefix: "GREEN", link: "HOUSE", suffix: "WARMING"))
        info.wordBank.append(Word(prefix: "GREEN", link: "HOUSE", suffix: "WIFE"))
        info.wordBank.append(Word(prefix: "GREEN", link: "HOUSE", suffix: "WORK"))
        // end house
        
        // start house - hot
        info.wordBank.append(Word(prefix: "HOT", link: "HOUSE", suffix: "BOAT"))
        info.wordBank.append(Word(prefix: "HOT", link: "HOUSE", suffix: "BREAKING"))
        info.wordBank.append(Word(prefix: "HOT", link: "HOUSE", suffix: "COAT"))
        info.wordBank.append(Word(prefix: "HOT", link: "HOUSE", suffix: "FLIES"))
        info.wordBank.append(Word(prefix: "HOT", link: "HOUSE", suffix: "HOLD"))
        info.wordBank.append(Word(prefix: "HOT", link: "HOUSE", suffix: "KEEPER"))
        info.wordBank.append(Word(prefix: "HOT", link: "HOUSE", suffix: "WARMING"))
        info.wordBank.append(Word(prefix: "HOT", link: "HOUSE", suffix: "WIFE"))
        info.wordBank.append(Word(prefix: "HOT", link: "HOUSE", suffix: "WORK"))
        // end house
        
        // start house - light
        info.wordBank.append(Word(prefix: "LIGHT", link: "HOUSE", suffix: "BOAT"))
        info.wordBank.append(Word(prefix: "LIGHT", link: "HOUSE", suffix: "BREAKING"))
        info.wordBank.append(Word(prefix: "LIGHT", link: "HOUSE", suffix: "COAT"))
        info.wordBank.append(Word(prefix: "LIGHT", link: "HOUSE", suffix: "FLIES"))
        info.wordBank.append(Word(prefix: "LIGHT", link: "HOUSE", suffix: "HOLD"))
        info.wordBank.append(Word(prefix: "LIGHT", link: "HOUSE", suffix: "KEEPER"))
        info.wordBank.append(Word(prefix: "LIGHT", link: "HOUSE", suffix: "WARMING"))
        info.wordBank.append(Word(prefix: "LIGHT", link: "HOUSE", suffix: "WIFE"))
        info.wordBank.append(Word(prefix: "LIGHT", link: "HOUSE", suffix: "WORK"))
        // end house
        
        // start house - out
        info.wordBank.append(Word(prefix: "OUT", link: "HOUSE", suffix: "BOAT"))
        info.wordBank.append(Word(prefix: "OUT", link: "HOUSE", suffix: "BREAKING"))
        info.wordBank.append(Word(prefix: "OUT", link: "HOUSE", suffix: "COAT"))
        info.wordBank.append(Word(prefix: "OUT", link: "HOUSE", suffix: "FLIES"))
        info.wordBank.append(Word(prefix: "OUT", link: "HOUSE", suffix: "HOLD"))
        info.wordBank.append(Word(prefix: "OUT", link: "HOUSE", suffix: "KEEPER"))
        info.wordBank.append(Word(prefix: "OUT", link: "HOUSE", suffix: "WARMING"))
        info.wordBank.append(Word(prefix: "OUT", link: "HOUSE", suffix: "WIFE"))
        info.wordBank.append(Word(prefix: "OUT", link: "HOUSE", suffix: "WORK"))
        // end house
        
        // start house - power
        info.wordBank.append(Word(prefix: "POWER", link: "HOUSE", suffix: "BOAT"))
        info.wordBank.append(Word(prefix: "POWER", link: "HOUSE", suffix: "BREAKING"))
        info.wordBank.append(Word(prefix: "POWER", link: "HOUSE", suffix: "COAT"))
        info.wordBank.append(Word(prefix: "POWER", link: "HOUSE", suffix: "FLIES"))
        info.wordBank.append(Word(prefix: "POWER", link: "HOUSE", suffix: "HOLD"))
        info.wordBank.append(Word(prefix: "POWER", link: "HOUSE", suffix: "KEEPER"))
        info.wordBank.append(Word(prefix: "POWER", link: "HOUSE", suffix: "WARMING"))
        info.wordBank.append(Word(prefix: "POWER", link: "HOUSE", suffix: "WIFE"))
        info.wordBank.append(Word(prefix: "POWER", link: "HOUSE", suffix: "WORK"))
        // end house
        
        // start house - rough
        info.wordBank.append(Word(prefix: "ROUGH", link: "HOUSE", suffix: "BOAT"))
        info.wordBank.append(Word(prefix: "ROUGH", link: "HOUSE", suffix: "BREAKING"))
        info.wordBank.append(Word(prefix: "ROUGH", link: "HOUSE", suffix: "COAT"))
        info.wordBank.append(Word(prefix: "ROUGH", link: "HOUSE", suffix: "FLIES"))
        info.wordBank.append(Word(prefix: "ROUGH", link: "HOUSE", suffix: "HOLD"))
        info.wordBank.append(Word(prefix: "ROUGH", link: "HOUSE", suffix: "KEEPER"))
        info.wordBank.append(Word(prefix: "ROUGH", link: "HOUSE", suffix: "WARMING"))
        info.wordBank.append(Word(prefix: "ROUGH", link: "HOUSE", suffix: "WIFE"))
        info.wordBank.append(Word(prefix: "ROUGH", link: "HOUSE", suffix: "WORK"))
        // end house
        
        // start house - school
        info.wordBank.append(Word(prefix: "SCHOOL", link: "HOUSE", suffix: "BOAT"))
        info.wordBank.append(Word(prefix: "SCHOOL", link: "HOUSE", suffix: "BREAKING"))
        info.wordBank.append(Word(prefix: "SCHOOL", link: "HOUSE", suffix: "COAT"))
        info.wordBank.append(Word(prefix: "SCHOOL", link: "HOUSE", suffix: "FLIES"))
        info.wordBank.append(Word(prefix: "SCHOOL", link: "HOUSE", suffix: "HOLD"))
        info.wordBank.append(Word(prefix: "SCHOOL", link: "HOUSE", suffix: "KEEPER"))
        info.wordBank.append(Word(prefix: "SCHOOL", link: "HOUSE", suffix: "WARMING"))
        info.wordBank.append(Word(prefix: "SCHOOL", link: "HOUSE", suffix: "WIFE"))
        info.wordBank.append(Word(prefix: "SCHOOL", link: "HOUSE", suffix: "WORK"))
        // end house
        
        // start house - slaughter
        info.wordBank.append(Word(prefix: "SLAUGHTER", link: "HOUSE", suffix: "BOAT"))
        info.wordBank.append(Word(prefix: "SLAUGHTER", link: "HOUSE", suffix: "BREAKING"))
        info.wordBank.append(Word(prefix: "SLAUGHTER", link: "HOUSE", suffix: "COAT"))
        info.wordBank.append(Word(prefix: "SLAUGHTER", link: "HOUSE", suffix: "FLIES"))
        info.wordBank.append(Word(prefix: "SLAUGHTER", link: "HOUSE", suffix: "HOLD"))
        info.wordBank.append(Word(prefix: "SLAUGHTER", link: "HOUSE", suffix: "KEEPER"))
        info.wordBank.append(Word(prefix: "SLAUGHTER", link: "HOUSE", suffix: "WARMING"))
        info.wordBank.append(Word(prefix: "SLAUGHTER", link: "HOUSE", suffix: "WIFE"))
        info.wordBank.append(Word(prefix: "SLAUGHTER", link: "HOUSE", suffix: "WORK"))
        // end house
        
        // start house - store
        info.wordBank.append(Word(prefix: "STORE", link: "HOUSE", suffix: "BOAT"))
        info.wordBank.append(Word(prefix: "STORE", link: "HOUSE", suffix: "BREAKING"))
        info.wordBank.append(Word(prefix: "STORE", link: "HOUSE", suffix: "COAT"))
        info.wordBank.append(Word(prefix: "STORE", link: "HOUSE", suffix: "FLIES"))
        info.wordBank.append(Word(prefix: "STORE", link: "HOUSE", suffix: "HOLD"))
        info.wordBank.append(Word(prefix: "STORE", link: "HOUSE", suffix: "KEEPER"))
        info.wordBank.append(Word(prefix: "STORE", link: "HOUSE", suffix: "WARMING"))
        info.wordBank.append(Word(prefix: "STORE", link: "HOUSE", suffix: "WIFE"))
        info.wordBank.append(Word(prefix: "STORE", link: "HOUSE", suffix: "WORK"))
        // end house
        
        // start house - ware
        info.wordBank.append(Word(prefix: "WARE", link: "HOUSE", suffix: "BOAT"))
        info.wordBank.append(Word(prefix: "WARE", link: "HOUSE", suffix: "BREAKING"))
        info.wordBank.append(Word(prefix: "WARE", link: "HOUSE", suffix: "COAT"))
        info.wordBank.append(Word(prefix: "WARE", link: "HOUSE", suffix: "FLIES"))
        info.wordBank.append(Word(prefix: "WARE", link: "HOUSE", suffix: "HOLD"))
        info.wordBank.append(Word(prefix: "WARE", link: "HOUSE", suffix: "KEEPER"))
        info.wordBank.append(Word(prefix: "WARE", link: "HOUSE", suffix: "WARMING"))
        info.wordBank.append(Word(prefix: "WARE", link: "HOUSE", suffix: "WIFE"))
        info.wordBank.append(Word(prefix: "WARE", link: "HOUSE", suffix: "WORK"))
        // end house
        
        info.wordBank.append(Word(prefix: "FLAP", link: "JACK", suffix: "FRUIT"))
        info.wordBank.append(Word(prefix: "FLAP", link: "JACK", suffix: "KNIFE"))
        info.wordBank.append(Word(prefix: "FLAP", link: "JACK", suffix: "POT"))
        
        info.wordBank.append(Word(prefix: "HIGH", link: "JACK", suffix: "FRUIT"))
        info.wordBank.append(Word(prefix: "HIGH", link: "JACK", suffix: "KNIFE"))
        info.wordBank.append(Word(prefix: "HIGH", link: "JACK", suffix: "POT"))
        
        info.wordBank.append(Word(prefix: "LUMBER", link: "JACK", suffix: "FRUIT"))
        info.wordBank.append(Word(prefix: "LUMBER", link: "JACK", suffix: "KNIFE"))
        info.wordBank.append(Word(prefix: "LUMBER", link: "JACK", suffix: "POT"))
        
        info.wordBank.append(Word(prefix: "KILL", link: "JOY", suffix: "STICK"))
        
        info.wordBank.append(Word(prefix: "UP", link: "KEEP", suffix: "SAKE"))
        
        info.wordBank.append(Word(prefix: "PASS", link: "KEY", suffix: "BOARD"))
        info.wordBank.append(Word(prefix: "PASS", link: "KEY", suffix: "HOLE"))
        info.wordBank.append(Word(prefix: "PASS", link: "KEY", suffix: "STONE"))
        info.wordBank.append(Word(prefix: "PASS", link: "KEY", suffix: "WORD"))
        
        info.wordBank.append(Word(prefix: "SIDE", link: "KICK", suffix: "OFF"))
        
        info.wordBank.append(Word(prefix: "OVER", link: "KILL", suffix: "JOY"))
        
        info.wordBank.append(Word(prefix: "MAN", link: "KIND", suffix: "HEARTED"))
        info.wordBank.append(Word(prefix: "HUMAN", link: "KIND", suffix: "HEARTED"))
        
        // start land - father
        info.wordBank.append(Word(prefix: "FATHER", link: "LAND", suffix: "FALL"))
        info.wordBank.append(Word(prefix: "FATHER", link: "LAND", suffix: "FORM"))
        info.wordBank.append(Word(prefix: "FATHER", link: "LAND", suffix: "LORD"))
        info.wordBank.append(Word(prefix: "FATHER", link: "LAND", suffix: "MARK"))
        info.wordBank.append(Word(prefix: "FATHER", link: "LAND", suffix: "OWNER"))
        info.wordBank.append(Word(prefix: "FATHER", link: "LAND", suffix: "SLIDE"))
        // end land
        
        // start land - head
        info.wordBank.append(Word(prefix: "HEAD", link: "LAND", suffix: "FALL"))
        info.wordBank.append(Word(prefix: "HEAD", link: "LAND", suffix: "FORM"))
        info.wordBank.append(Word(prefix: "HEAD", link: "LAND", suffix: "LORD"))
        info.wordBank.append(Word(prefix: "HEAD", link: "LAND", suffix: "MARK"))
        info.wordBank.append(Word(prefix: "HEAD", link: "LAND", suffix: "OWNER"))
        info.wordBank.append(Word(prefix: "HEAD", link: "LAND", suffix: "SLIDE"))
        // end land
        
        // start land - home
        info.wordBank.append(Word(prefix: "HOME", link: "LAND", suffix: "FALL"))
        info.wordBank.append(Word(prefix: "HOME", link: "LAND", suffix: "FORM"))
        info.wordBank.append(Word(prefix: "HOME", link: "LAND", suffix: "LORD"))
        info.wordBank.append(Word(prefix: "HOME", link: "LAND", suffix: "MARK"))
        info.wordBank.append(Word(prefix: "HOME", link: "LAND", suffix: "OWNER"))
        info.wordBank.append(Word(prefix: "HOME", link: "LAND", suffix: "SLIDE"))
        // end land
        
        // start land - in
        info.wordBank.append(Word(prefix: "IN", link: "LAND", suffix: "FALL"))
        info.wordBank.append(Word(prefix: "IN", link: "LAND", suffix: "FORM"))
        info.wordBank.append(Word(prefix: "IN", link: "LAND", suffix: "LORD"))
        info.wordBank.append(Word(prefix: "IN", link: "LAND", suffix: "MARK"))
        info.wordBank.append(Word(prefix: "IN", link: "LAND", suffix: "OWNER"))
        info.wordBank.append(Word(prefix: "IN", link: "LAND", suffix: "SLIDE"))
        // end land
        
        // start land - low
        info.wordBank.append(Word(prefix: "LOW", link: "LAND", suffix: "FALL"))
        info.wordBank.append(Word(prefix: "LOW", link: "LAND", suffix: "FORM"))
        info.wordBank.append(Word(prefix: "LOW", link: "LAND", suffix: "LORD"))
        info.wordBank.append(Word(prefix: "LOW", link: "LAND", suffix: "MARK"))
        info.wordBank.append(Word(prefix: "LOW", link: "LAND", suffix: "OWNER"))
        info.wordBank.append(Word(prefix: "LOW", link: "LAND", suffix: "SLIDE"))
        // end land
        
        // start land - main
        info.wordBank.append(Word(prefix: "MAIN", link: "LAND", suffix: "FALL"))
        info.wordBank.append(Word(prefix: "MAIN", link: "LAND", suffix: "FORM"))
        info.wordBank.append(Word(prefix: "MAIN", link: "LAND", suffix: "LORD"))
        info.wordBank.append(Word(prefix: "MAIN", link: "LAND", suffix: "MARK"))
        info.wordBank.append(Word(prefix: "MAIN", link: "LAND", suffix: "OWNER"))
        info.wordBank.append(Word(prefix: "MAIN", link: "LAND", suffix: "SLIDE"))
        // end land
        
        // start land - over
        info.wordBank.append(Word(prefix: "OVER", link: "LAND", suffix: "FALL"))
        info.wordBank.append(Word(prefix: "OVER", link: "LAND", suffix: "FORM"))
        info.wordBank.append(Word(prefix: "OVER", link: "LAND", suffix: "LORD"))
        info.wordBank.append(Word(prefix: "OVER", link: "LAND", suffix: "MARK"))
        info.wordBank.append(Word(prefix: "OVER", link: "LAND", suffix: "OWNER"))
        info.wordBank.append(Word(prefix: "OVER", link: "LAND", suffix: "SLIDE"))
        // end land
        
        // start land - pasture
        info.wordBank.append(Word(prefix: "PASTURE", link: "LAND", suffix: "FALL"))
        info.wordBank.append(Word(prefix: "PASTURE", link: "LAND", suffix: "FORM"))
        info.wordBank.append(Word(prefix: "PASTURE", link: "LAND", suffix: "LORD"))
        info.wordBank.append(Word(prefix: "PASTURE", link: "LAND", suffix: "MARK"))
        info.wordBank.append(Word(prefix: "PASTURE", link: "LAND", suffix: "OWNER"))
        info.wordBank.append(Word(prefix: "PASTURE", link: "LAND", suffix: "SLIDE"))
        // end land
        
        // start land - table
        info.wordBank.append(Word(prefix: "TABLE", link: "LAND", suffix: "FALL"))
        info.wordBank.append(Word(prefix: "TABLE", link: "LAND", suffix: "FORM"))
        info.wordBank.append(Word(prefix: "TABLE", link: "LAND", suffix: "LORD"))
        info.wordBank.append(Word(prefix: "TABLE", link: "LAND", suffix: "MARK"))
        info.wordBank.append(Word(prefix: "TABLE", link: "LAND", suffix: "OWNER"))
        info.wordBank.append(Word(prefix: "TABLE", link: "LAND", suffix: "SLIDE"))
        // end land
        
        // start land - tide
        info.wordBank.append(Word(prefix: "TIDE", link: "LAND", suffix: "FALL"))
        info.wordBank.append(Word(prefix: "TIDE", link: "LAND", suffix: "FORM"))
        info.wordBank.append(Word(prefix: "TIDE", link: "LAND", suffix: "LORD"))
        info.wordBank.append(Word(prefix: "TIDE", link: "LAND", suffix: "MARK"))
        info.wordBank.append(Word(prefix: "TIDE", link: "LAND", suffix: "OWNER"))
        info.wordBank.append(Word(prefix: "TIDE", link: "LAND", suffix: "SLIDE"))
        // end land
        
        // start land - waste
        info.wordBank.append(Word(prefix: "WASTE", link: "LAND", suffix: "FALL"))
        info.wordBank.append(Word(prefix: "WASTE", link: "LAND", suffix: "FORM"))
        info.wordBank.append(Word(prefix: "WASTE", link: "LAND", suffix: "LORD"))
        info.wordBank.append(Word(prefix: "WASTE", link: "LAND", suffix: "MARK"))
        info.wordBank.append(Word(prefix: "WASTE", link: "LAND", suffix: "OWNER"))
        info.wordBank.append(Word(prefix: "WASTE", link: "LAND", suffix: "SLIDE"))
        // end land
        
        // start land - wet
        info.wordBank.append(Word(prefix: "WET", link: "LAND", suffix: "FALL"))
        info.wordBank.append(Word(prefix: "WET", link: "LAND", suffix: "FORM"))
        info.wordBank.append(Word(prefix: "WET", link: "LAND", suffix: "LORD"))
        info.wordBank.append(Word(prefix: "WET", link: "LAND", suffix: "MARK"))
        info.wordBank.append(Word(prefix: "WET", link: "LAND", suffix: "OWNER"))
        info.wordBank.append(Word(prefix: "WET", link: "LAND", suffix: "SLIDE"))
        // end land
        
        // start land - wonder
        info.wordBank.append(Word(prefix: "WONDER", link: "LAND", suffix: "FALL"))
        info.wordBank.append(Word(prefix: "WONDER", link: "LAND", suffix: "FORM"))
        info.wordBank.append(Word(prefix: "WONDER", link: "LAND", suffix: "LORD"))
        info.wordBank.append(Word(prefix: "WONDER", link: "LAND", suffix: "MARK"))
        info.wordBank.append(Word(prefix: "WONDER", link: "LAND", suffix: "OWNER"))
        info.wordBank.append(Word(prefix: "WONDER", link: "LAND", suffix: "SLIDE"))
        // end land
        
        // start land - wood
        info.wordBank.append(Word(prefix: "WOOD", link: "LAND", suffix: "FALL"))
        info.wordBank.append(Word(prefix: "WOOD", link: "LAND", suffix: "FORM"))
        info.wordBank.append(Word(prefix: "WOOD", link: "LAND", suffix: "LORD"))
        info.wordBank.append(Word(prefix: "WOOD", link: "LAND", suffix: "MARK"))
        info.wordBank.append(Word(prefix: "WOOD", link: "LAND", suffix: "OWNER"))
        info.wordBank.append(Word(prefix: "WOOD", link: "LAND", suffix: "SLIDE"))
        // end land
        
        info.wordBank.append(Word(prefix: "OUT", link: "LAW", suffix: "SUIT"))
        
        info.wordBank.append(Word(prefix: "OUT", link: "LAY", suffix: "OVER"))
        info.wordBank.append(Word(prefix: "OVER", link: "LAY", suffix: "OVER"))
        
        info.wordBank.append(Word(prefix: "LOW", link: "LIFE", suffix: "BOAT"))
        info.wordBank.append(Word(prefix: "LOW", link: "LIFE", suffix: "GUARD"))
        info.wordBank.append(Word(prefix: "LOW", link: "LIFE", suffix: "LONG"))
        info.wordBank.append(Word(prefix: "LOW", link: "LIFE", suffix: "STYLE"))
        info.wordBank.append(Word(prefix: "LOW", link: "LIFE", suffix: "TIME"))
        
        info.wordBank.append(Word(prefix: "WILD", link: "LIFE", suffix: "BOAT"))
        info.wordBank.append(Word(prefix: "WILD", link: "LIFE", suffix: "GUARD"))
        info.wordBank.append(Word(prefix: "WILD", link: "LIFE", suffix: "LONG"))
        info.wordBank.append(Word(prefix: "WILD", link: "LIFE", suffix: "STYLE"))
        info.wordBank.append(Word(prefix: "WILD", link: "LIFE", suffix: "TIME"))
        
        info.wordBank.append(Word(prefix: "UP", link: "LIFT", suffix: "OFF"))
        
        // start light - day
        info.wordBank.append(Word(prefix: "DAY", link: "LIGHT", suffix: "HEADED"))
        info.wordBank.append(Word(prefix: "DAY", link: "LIGHT", suffix: "HEARTED"))
        info.wordBank.append(Word(prefix: "DAY", link: "LIGHT", suffix: "HOUSE"))
        info.wordBank.append(Word(prefix: "DAY", link: "LIGHT", suffix: "WEIGHT"))
        // end light
        
        // start light - flash
        info.wordBank.append(Word(prefix: "FLASH", link: "LIGHT", suffix: "HEADED"))
        info.wordBank.append(Word(prefix: "FLASH", link: "LIGHT", suffix: "HEARTED"))
        info.wordBank.append(Word(prefix: "FLASH", link: "LIGHT", suffix: "HOUSE"))
        info.wordBank.append(Word(prefix: "FLASH", link: "LIGHT", suffix: "WEIGHT"))
        // end light
        
        // start light - flood
        info.wordBank.append(Word(prefix: "FLOOD", link: "LIGHT", suffix: "HEADED"))
        info.wordBank.append(Word(prefix: "FLOOD", link: "LIGHT", suffix: "HEARTED"))
        info.wordBank.append(Word(prefix: "FLOOD", link: "LIGHT", suffix: "HOUSE"))
        info.wordBank.append(Word(prefix: "FLOOD", link: "LIGHT", suffix: "WEIGHT"))
        // end light
        
        // start light - head
        info.wordBank.append(Word(prefix: "HEAD", link: "LIGHT", suffix: "HEADED"))
        info.wordBank.append(Word(prefix: "HEAD", link: "LIGHT", suffix: "HEARTED"))
        info.wordBank.append(Word(prefix: "HEAD", link: "LIGHT", suffix: "HOUSE"))
        info.wordBank.append(Word(prefix: "HEAD", link: "LIGHT", suffix: "WEIGHT"))
        // end light
        
        // start light - high
        info.wordBank.append(Word(prefix: "HIGH", link: "LIGHT", suffix: "HEADED"))
        info.wordBank.append(Word(prefix: "HIGH", link: "LIGHT", suffix: "HEARTED"))
        info.wordBank.append(Word(prefix: "HIGH", link: "LIGHT", suffix: "HOUSE"))
        info.wordBank.append(Word(prefix: "HIGH", link: "LIGHT", suffix: "WEIGHT"))
        // end light
        
        // start light - lime
        info.wordBank.append(Word(prefix: "LIME", link: "LIGHT", suffix: "HEADED"))
        info.wordBank.append(Word(prefix: "LIME", link: "LIGHT", suffix: "HEARTED"))
        info.wordBank.append(Word(prefix: "LIME", link: "LIGHT", suffix: "HOUSE"))
        info.wordBank.append(Word(prefix: "LIME", link: "LIGHT", suffix: "WEIGHT"))
        // end light
        
        // start light - moon
        info.wordBank.append(Word(prefix: "MOON", link: "LIGHT", suffix: "HEADED"))
        info.wordBank.append(Word(prefix: "MOON", link: "LIGHT", suffix: "HEARTED"))
        info.wordBank.append(Word(prefix: "MOON", link: "LIGHT", suffix: "HOUSE"))
        info.wordBank.append(Word(prefix: "MOON", link: "LIGHT", suffix: "WEIGHT"))
        // end light
        
        // start light - search
        info.wordBank.append(Word(prefix: "SEARCH", link: "LIGHT", suffix: "HEADED"))
        info.wordBank.append(Word(prefix: "SEARCH", link: "LIGHT", suffix: "HEARTED"))
        info.wordBank.append(Word(prefix: "SEARCH", link: "LIGHT", suffix: "HOUSE"))
        info.wordBank.append(Word(prefix: "SEARCH", link: "LIGHT", suffix: "WEIGHT"))
        // end light
        
        // start light - sky
        info.wordBank.append(Word(prefix: "SKY", link: "LIGHT", suffix: "HEADED"))
        info.wordBank.append(Word(prefix: "SKY", link: "LIGHT", suffix: "HEARTED"))
        info.wordBank.append(Word(prefix: "SKY", link: "LIGHT", suffix: "HOUSE"))
        info.wordBank.append(Word(prefix: "SKY", link: "LIGHT", suffix: "WEIGHT"))
        // end light
        
        // start light - spot
        info.wordBank.append(Word(prefix: "SPOT", link: "LIGHT", suffix: "HEADED"))
        info.wordBank.append(Word(prefix: "SPOT", link: "LIGHT", suffix: "HEARTED"))
        info.wordBank.append(Word(prefix: "SPOT", link: "LIGHT", suffix: "HOUSE"))
        info.wordBank.append(Word(prefix: "SPOT", link: "LIGHT", suffix: "WEIGHT"))
        // end light
        
        // start light - star
        info.wordBank.append(Word(prefix: "STAR", link: "LIGHT", suffix: "HEADED"))
        info.wordBank.append(Word(prefix: "STAR", link: "LIGHT", suffix: "HEARTED"))
        info.wordBank.append(Word(prefix: "STAR", link: "LIGHT", suffix: "HOUSE"))
        info.wordBank.append(Word(prefix: "STAR", link: "LIGHT", suffix: "WEIGHT"))
        // end light
        
        // start light - sun
        info.wordBank.append(Word(prefix: "SUN", link: "LIGHT", suffix: "HEADED"))
        info.wordBank.append(Word(prefix: "SUN", link: "LIGHT", suffix: "HEARTED"))
        info.wordBank.append(Word(prefix: "SUN", link: "LIGHT", suffix: "HOUSE"))
        info.wordBank.append(Word(prefix: "SUN", link: "LIGHT", suffix: "WEIGHT"))
        // end light
        
        // start line - air
        info.wordBank.append(Word(prefix: "AIR", link: "LINE", suffix: "BACKER"))
        info.wordBank.append(Word(prefix: "AIR", link: "LINE", suffix: "DANCING"))
        info.wordBank.append(Word(prefix: "AIR", link: "LINE", suffix: "MAN"))
        info.wordBank.append(Word(prefix: "AIR", link: "LINE", suffix: "UP"))
        // end line
        
        // start line - coast
        info.wordBank.append(Word(prefix: "COAST", link: "LINE", suffix: "BACKER"))
        info.wordBank.append(Word(prefix: "COAST", link: "LINE", suffix: "DANCING"))
        info.wordBank.append(Word(prefix: "COAST", link: "LINE", suffix: "MAN"))
        info.wordBank.append(Word(prefix: "COAST", link: "LINE", suffix: "UP"))
        // end line
        
        // start line - dead
        info.wordBank.append(Word(prefix: "DEAD", link: "LINE", suffix: "BACKER"))
        info.wordBank.append(Word(prefix: "DEAD", link: "LINE", suffix: "DANCING"))
        info.wordBank.append(Word(prefix: "DEAD", link: "LINE", suffix: "MAN"))
        info.wordBank.append(Word(prefix: "DEAD", link: "LINE", suffix: "UP"))
        // end line
        
        // start line - guide
        info.wordBank.append(Word(prefix: "GUIDE", link: "LINE", suffix: "BACKER"))
        info.wordBank.append(Word(prefix: "GUIDE", link: "LINE", suffix: "DANCING"))
        info.wordBank.append(Word(prefix: "GUIDE", link: "LINE", suffix: "MAN"))
        info.wordBank.append(Word(prefix: "GUIDE", link: "LINE", suffix: "UP"))
        // end line
        
        // start line - hair
        info.wordBank.append(Word(prefix: "HAIR", link: "LINE", suffix: "BACKER"))
        info.wordBank.append(Word(prefix: "HAIR", link: "LINE", suffix: "DANCING"))
        info.wordBank.append(Word(prefix: "HAIR", link: "LINE", suffix: "MAN"))
        info.wordBank.append(Word(prefix: "HAIR", link: "LINE", suffix: "UP"))
        // end line
        
        // start line - head
        info.wordBank.append(Word(prefix: "HEAD", link: "LINE", suffix: "BACKER"))
        info.wordBank.append(Word(prefix: "HEAD", link: "LINE", suffix: "DANCING"))
        info.wordBank.append(Word(prefix: "HEAD", link: "LINE", suffix: "MAN"))
        info.wordBank.append(Word(prefix: "HEAD", link: "LINE", suffix: "UP"))
        // end line
        
        // start line - hot
        info.wordBank.append(Word(prefix: "HOT", link: "LINE", suffix: "BACKER"))
        info.wordBank.append(Word(prefix: "HOT", link: "LINE", suffix: "DANCING"))
        info.wordBank.append(Word(prefix: "HOT", link: "LINE", suffix: "MAN"))
        info.wordBank.append(Word(prefix: "HOT", link: "LINE", suffix: "UP"))
        // end line
        
        // start line - neck
        info.wordBank.append(Word(prefix: "NECK", link: "LINE", suffix: "BACKER"))
        info.wordBank.append(Word(prefix: "NECK", link: "LINE", suffix: "DANCING"))
        info.wordBank.append(Word(prefix: "NECK", link: "LINE", suffix: "MAN"))
        info.wordBank.append(Word(prefix: "NECK", link: "LINE", suffix: "UP"))
        // end line
        
        // start line - off
        info.wordBank.append(Word(prefix: "OFF", link: "LINE", suffix: "BACKER"))
        info.wordBank.append(Word(prefix: "OFF", link: "LINE", suffix: "DANCING"))
        info.wordBank.append(Word(prefix: "OFF", link: "LINE", suffix: "MAN"))
        info.wordBank.append(Word(prefix: "OFF", link: "LINE", suffix: "UP"))
        // end line
        
        // start line - on
        info.wordBank.append(Word(prefix: "ON", link: "LINE", suffix: "BACKER"))
        info.wordBank.append(Word(prefix: "ON", link: "LINE", suffix: "DANCING"))
        info.wordBank.append(Word(prefix: "ON", link: "LINE", suffix: "MAN"))
        info.wordBank.append(Word(prefix: "ON", link: "LINE", suffix: "UP"))
        // end line
        
        // start line - out
        info.wordBank.append(Word(prefix: "OUT", link: "LINE", suffix: "BACKER"))
        info.wordBank.append(Word(prefix: "OUT", link: "LINE", suffix: "DANCING"))
        info.wordBank.append(Word(prefix: "OUT", link: "LINE", suffix: "MAN"))
        info.wordBank.append(Word(prefix: "OUT", link: "LINE", suffix: "UP"))
        // end line
        
        // start line - pipe
        info.wordBank.append(Word(prefix: "PIPE", link: "LINE", suffix: "BACKER"))
        info.wordBank.append(Word(prefix: "PIPE", link: "LINE", suffix: "DANCING"))
        info.wordBank.append(Word(prefix: "PIPE", link: "LINE", suffix: "MAN"))
        info.wordBank.append(Word(prefix: "PIPE", link: "LINE", suffix: "UP"))
        // end line
        
        // start line - shore
        info.wordBank.append(Word(prefix: "SHORE", link: "LINE", suffix: "BACKER"))
        info.wordBank.append(Word(prefix: "SHORE", link: "LINE", suffix: "DANCING"))
        info.wordBank.append(Word(prefix: "SHORE", link: "LINE", suffix: "MAN"))
        info.wordBank.append(Word(prefix: "SHORE", link: "LINE", suffix: "UP"))
        // end line
        
        // start line - side
        info.wordBank.append(Word(prefix: "SIDE", link: "LINE", suffix: "BACKER"))
        info.wordBank.append(Word(prefix: "SIDE", link: "LINE", suffix: "DANCING"))
        info.wordBank.append(Word(prefix: "SIDE", link: "LINE", suffix: "MAN"))
        info.wordBank.append(Word(prefix: "SIDE", link: "LINE", suffix: "UP"))
        // end line
        
        // start line - sky
        info.wordBank.append(Word(prefix: "SKY", link: "LINE", suffix: "BACKER"))
        info.wordBank.append(Word(prefix: "SKY", link: "LINE", suffix: "DANCING"))
        info.wordBank.append(Word(prefix: "SKY", link: "LINE", suffix: "MAN"))
        info.wordBank.append(Word(prefix: "SKY", link: "LINE", suffix: "UP"))
        // end line
        
        // start line - stream
        info.wordBank.append(Word(prefix: "STREAM", link: "LINE", suffix: "BACKER"))
        info.wordBank.append(Word(prefix: "STREAM", link: "LINE", suffix: "DANCING"))
        info.wordBank.append(Word(prefix: "STREAM", link: "LINE", suffix: "MAN"))
        info.wordBank.append(Word(prefix: "STREAM", link: "LINE", suffix: "UP"))
        // end line
        
        // start line - time
        info.wordBank.append(Word(prefix: "TIME", link: "LINE", suffix: "BACKER"))
        info.wordBank.append(Word(prefix: "TIME", link: "LINE", suffix: "DANCING"))
        info.wordBank.append(Word(prefix: "TIME", link: "LINE", suffix: "MAN"))
        info.wordBank.append(Word(prefix: "TIME", link: "LINE", suffix: "UP"))
        // end line
        
        // start line - waist
        info.wordBank.append(Word(prefix: "WAIST", link: "LINE", suffix: "BACKER"))
        info.wordBank.append(Word(prefix: "WAIST", link: "LINE", suffix: "DANCING"))
        info.wordBank.append(Word(prefix: "WAIST", link: "LINE", suffix: "MAN"))
        info.wordBank.append(Word(prefix: "WAIST", link: "LINE", suffix: "UP"))
        // end line
        
        info.wordBank.append(Word(prefix: "LIFE", link: "LONG", suffix: "HAND"))
        info.wordBank.append(Word(prefix: "LIFE", link: "LONG", suffix: "SHOREMAN"))
        
        info.wordBank.append(Word(prefix: "OUT", link: "LOOK", suffix: "OUT"))
        info.wordBank.append(Word(prefix: "OVER", link: "LOOK", suffix: "OUT"))
        
        // start main - business
        info.wordBank.append(Word(prefix: "BUSINESS", link: "MAN", suffix: "HOLE"))
        info.wordBank.append(Word(prefix: "BUSINESS", link: "MAN", suffix: "HUNT"))
        info.wordBank.append(Word(prefix: "BUSINESS", link: "MAN", suffix: "KIND"))
        info.wordBank.append(Word(prefix: "BUSINESS", link: "MAN", suffix: "POWER"))
        // end man
        
        // start main - chair
        info.wordBank.append(Word(prefix: "CHAIR", link: "MAN", suffix: "HOLE"))
        info.wordBank.append(Word(prefix: "CHAIR", link: "MAN", suffix: "HUNT"))
        info.wordBank.append(Word(prefix: "CHAIR", link: "MAN", suffix: "KIND"))
        info.wordBank.append(Word(prefix: "CHAIR", link: "MAN", suffix: "POWER"))
        // end man
        
        // start main - crafts
        info.wordBank.append(Word(prefix: "CRAFTS", link: "MAN", suffix: "HOLE"))
        info.wordBank.append(Word(prefix: "CRAFTS", link: "MAN", suffix: "HUNT"))
        info.wordBank.append(Word(prefix: "CRAFTS", link: "MAN", suffix: "KIND"))
        info.wordBank.append(Word(prefix: "CRAFTS", link: "MAN", suffix: "POWER"))
        // end man
        
        // start main - door
        info.wordBank.append(Word(prefix: "DOOR", link: "MAN", suffix: "HOLE"))
        info.wordBank.append(Word(prefix: "DOOR", link: "MAN", suffix: "HUNT"))
        info.wordBank.append(Word(prefix: "DOOR", link: "MAN", suffix: "KIND"))
        info.wordBank.append(Word(prefix: "DOOR", link: "MAN", suffix: "POWER"))
        // end man
        
        // start main - fire
        info.wordBank.append(Word(prefix: "FIRE", link: "MAN", suffix: "HOLE"))
        info.wordBank.append(Word(prefix: "FIRE", link: "MAN", suffix: "HUNT"))
        info.wordBank.append(Word(prefix: "FIRE", link: "MAN", suffix: "KIND"))
        info.wordBank.append(Word(prefix: "FIRE", link: "MAN", suffix: "POWER"))
        // end man
        
        // start main - fisher
        info.wordBank.append(Word(prefix: "FISHER", link: "MAN", suffix: "HOLE"))
        info.wordBank.append(Word(prefix: "FISHER", link: "MAN", suffix: "HUNT"))
        info.wordBank.append(Word(prefix: "FISHER", link: "MAN", suffix: "KIND"))
        info.wordBank.append(Word(prefix: "FISHER", link: "MAN", suffix: "POWER"))
        // end man
        
        // start main - foot
        info.wordBank.append(Word(prefix: "FOOT", link: "MAN", suffix: "HOLE"))
        info.wordBank.append(Word(prefix: "FOOT", link: "MAN", suffix: "HUNT"))
        info.wordBank.append(Word(prefix: "FOOT", link: "MAN", suffix: "KIND"))
        info.wordBank.append(Word(prefix: "FOOT", link: "MAN", suffix: "POWER"))
        // end man
        
        // start main - fore
        info.wordBank.append(Word(prefix: "FORE", link: "MAN", suffix: "HOLE"))
        info.wordBank.append(Word(prefix: "FORE", link: "MAN", suffix: "HUNT"))
        info.wordBank.append(Word(prefix: "FORE", link: "MAN", suffix: "KIND"))
        info.wordBank.append(Word(prefix: "FORE", link: "MAN", suffix: "POWER"))
        // end man
        
        // start main - fresh
        info.wordBank.append(Word(prefix: "FRESH", link: "MAN", suffix: "HOLE"))
        info.wordBank.append(Word(prefix: "FRESH", link: "MAN", suffix: "HUNT"))
        info.wordBank.append(Word(prefix: "FRESH", link: "MAN", suffix: "KIND"))
        info.wordBank.append(Word(prefix: "FRESH", link: "MAN", suffix: "POWER"))
        // end man
        
        // start main - frog
        info.wordBank.append(Word(prefix: "FROG", link: "MAN", suffix: "HOLE"))
        info.wordBank.append(Word(prefix: "FROG", link: "MAN", suffix: "HUNT"))
        info.wordBank.append(Word(prefix: "FROG", link: "MAN", suffix: "KIND"))
        info.wordBank.append(Word(prefix: "FROG", link: "MAN", suffix: "POWER"))
        // end man
        
        // start main - gentle
        info.wordBank.append(Word(prefix: "GENTLE", link: "MAN", suffix: "HOLE"))
        info.wordBank.append(Word(prefix: "GENTLE", link: "MAN", suffix: "HUNT"))
        info.wordBank.append(Word(prefix: "GENTLE", link: "MAN", suffix: "KIND"))
        info.wordBank.append(Word(prefix: "GENTLE", link: "MAN", suffix: "POWER"))
        // end man
        
        // start main - handy
        info.wordBank.append(Word(prefix: "HANDY", link: "MAN", suffix: "HOLE"))
        info.wordBank.append(Word(prefix: "HANDY", link: "MAN", suffix: "HUNT"))
        info.wordBank.append(Word(prefix: "HANDY", link: "MAN", suffix: "KIND"))
        info.wordBank.append(Word(prefix: "HANDY", link: "MAN", suffix: "POWER"))
        // end man
        
        // start main - hang
        info.wordBank.append(Word(prefix: "HANG", link: "MAN", suffix: "HOLE"))
        info.wordBank.append(Word(prefix: "HANG", link: "MAN", suffix: "HUNT"))
        info.wordBank.append(Word(prefix: "HANG", link: "MAN", suffix: "KIND"))
        info.wordBank.append(Word(prefix: "HANG", link: "MAN", suffix: "POWER"))
        // end man
        
        // start main - horse
        info.wordBank.append(Word(prefix: "HORSE", link: "MAN", suffix: "HOLE"))
        info.wordBank.append(Word(prefix: "HORSE", link: "MAN", suffix: "HUNT"))
        info.wordBank.append(Word(prefix: "HORSE", link: "MAN", suffix: "KIND"))
        info.wordBank.append(Word(prefix: "HORSE", link: "MAN", suffix: "POWER"))
        // end man
        
        // start main - line
        info.wordBank.append(Word(prefix: "LINE", link: "MAN", suffix: "HOLE"))
        info.wordBank.append(Word(prefix: "LINE", link: "MAN", suffix: "HUNT"))
        info.wordBank.append(Word(prefix: "LINE", link: "MAN", suffix: "KIND"))
        info.wordBank.append(Word(prefix: "LINE", link: "MAN", suffix: "POWER"))
        // end man
        
        // start main - mail
        info.wordBank.append(Word(prefix: "MAIL", link: "MAN", suffix: "HOLE"))
        info.wordBank.append(Word(prefix: "MAIL", link: "MAN", suffix: "HUNT"))
        info.wordBank.append(Word(prefix: "MAIL", link: "MAN", suffix: "KIND"))
        info.wordBank.append(Word(prefix: "MAIL", link: "MAN", suffix: "POWER"))
        // end man
        
        // start main - marks
        info.wordBank.append(Word(prefix: "MARKS", link: "MAN", suffix: "HOLE"))
        info.wordBank.append(Word(prefix: "MARKS", link: "MAN", suffix: "HUNT"))
        info.wordBank.append(Word(prefix: "MARKS", link: "MAN", suffix: "KIND"))
        info.wordBank.append(Word(prefix: "MARKS", link: "MAN", suffix: "POWER"))
        // end man
        
        // start main - middle
        info.wordBank.append(Word(prefix: "MIDDLE", link: "MAN", suffix: "HOLE"))
        info.wordBank.append(Word(prefix: "MIDDLE", link: "MAN", suffix: "HUNT"))
        info.wordBank.append(Word(prefix: "MIDDLE", link: "MAN", suffix: "KIND"))
        info.wordBank.append(Word(prefix: "MIDDLE", link: "MAN", suffix: "POWER"))
        // end man
        
        // start main - midship
        info.wordBank.append(Word(prefix: "MIDSHIP", link: "MAN", suffix: "HOLE"))
        info.wordBank.append(Word(prefix: "MIDSHIP", link: "MAN", suffix: "HUNT"))
        info.wordBank.append(Word(prefix: "MIDSHIP", link: "MAN", suffix: "KIND"))
        info.wordBank.append(Word(prefix: "MIDSHIP", link: "MAN", suffix: "POWER"))
        // end man
        
        // start main - noble
        info.wordBank.append(Word(prefix: "NOBLE", link: "MAN", suffix: "HOLE"))
        info.wordBank.append(Word(prefix: "NOBLE", link: "MAN", suffix: "HUNT"))
        info.wordBank.append(Word(prefix: "NOBLE", link: "MAN", suffix: "KIND"))
        info.wordBank.append(Word(prefix: "NOBLE", link: "MAN", suffix: "POWER"))
        // end man
        
        // start main - police
        info.wordBank.append(Word(prefix: "POLICE", link: "MAN", suffix: "HOLE"))
        info.wordBank.append(Word(prefix: "POLICE", link: "MAN", suffix: "HUNT"))
        info.wordBank.append(Word(prefix: "POLICE", link: "MAN", suffix: "KIND"))
        info.wordBank.append(Word(prefix: "POLICE", link: "MAN", suffix: "POWER"))
        // end man
        
        // start main - sales
        info.wordBank.append(Word(prefix: "SALES", link: "MAN", suffix: "HOLE"))
        info.wordBank.append(Word(prefix: "SALES", link: "MAN", suffix: "HUNT"))
        info.wordBank.append(Word(prefix: "SALES", link: "MAN", suffix: "KIND"))
        info.wordBank.append(Word(prefix: "SALES", link: "MAN", suffix: "POWER"))
        // end man
        
        // start main - sand
        info.wordBank.append(Word(prefix: "SAND", link: "MAN", suffix: "HOLE"))
        info.wordBank.append(Word(prefix: "SAND", link: "MAN", suffix: "HUNT"))
        info.wordBank.append(Word(prefix: "SAND", link: "MAN", suffix: "KIND"))
        info.wordBank.append(Word(prefix: "SAND", link: "MAN", suffix: "POWER"))
        // end man
        
        // start main - show
        info.wordBank.append(Word(prefix: "SHOW", link: "MAN", suffix: "HOLE"))
        info.wordBank.append(Word(prefix: "SHOW", link: "MAN", suffix: "HUNT"))
        info.wordBank.append(Word(prefix: "SHOW", link: "MAN", suffix: "KIND"))
        info.wordBank.append(Word(prefix: "SHOW", link: "MAN", suffix: "POWER"))
        // end man
        
        // start main - sports
        info.wordBank.append(Word(prefix: "SPORTS", link: "MAN", suffix: "HOLE"))
        info.wordBank.append(Word(prefix: "SPORTS", link: "MAN", suffix: "HUNT"))
        info.wordBank.append(Word(prefix: "SPORTS", link: "MAN", suffix: "KIND"))
        info.wordBank.append(Word(prefix: "SPORTS", link: "MAN", suffix: "POWER"))
        // end man
        
        // start main - states
        info.wordBank.append(Word(prefix: "STATES", link: "MAN", suffix: "HOLE"))
        info.wordBank.append(Word(prefix: "STATES", link: "MAN", suffix: "HUNT"))
        info.wordBank.append(Word(prefix: "STATES", link: "MAN", suffix: "KIND"))
        info.wordBank.append(Word(prefix: "STATES", link: "MAN", suffix: "POWER"))
        // end man
        
        // start main - super
        info.wordBank.append(Word(prefix: "SUPER", link: "MAN", suffix: "HOLE"))
        info.wordBank.append(Word(prefix: "TRADES", link: "MAN", suffix: "HUNT"))
        info.wordBank.append(Word(prefix: "*", link: "MAN", suffix: "KIND"))
        info.wordBank.append(Word(prefix: "*", link: "MAN", suffix: "POWER"))
        // end man
        
        // start main - trades
        info.wordBank.append(Word(prefix: "TRADES", link: "MAN", suffix: "HOLE"))
        info.wordBank.append(Word(prefix: "TRADES", link: "MAN", suffix: "HUNT"))
        info.wordBank.append(Word(prefix: "TRADES", link: "MAN", suffix: "KIND"))
        info.wordBank.append(Word(prefix: "TRADES", link: "MAN", suffix: "POWER"))
        // end man
        
        // start main - weather
        info.wordBank.append(Word(prefix: "WEATHER", link: "MAN", suffix: "HOLE"))
        info.wordBank.append(Word(prefix: "WEATHER", link: "MAN", suffix: "HUNT"))
        info.wordBank.append(Word(prefix: "WEATHER", link: "MAN", suffix: "KIND"))
        info.wordBank.append(Word(prefix: "WEATHER", link: "MAN", suffix: "POWER"))
        // end man
        
        // start main - woods
        info.wordBank.append(Word(prefix: "WOODS", link: "MAN", suffix: "HOLE"))
        info.wordBank.append(Word(prefix: "WOODS", link: "MAN", suffix: "HUNT"))
        info.wordBank.append(Word(prefix: "WOODS", link: "MAN", suffix: "KIND"))
        info.wordBank.append(Word(prefix: "WOODS", link: "MAN", suffix: "POWER"))
        // end man
        
        // start main - work
        info.wordBank.append(Word(prefix: "WORK", link: "MAN", suffix: "HOLE"))
        info.wordBank.append(Word(prefix: "WORK", link: "MAN", suffix: "HUNT"))
        info.wordBank.append(Word(prefix: "WORK", link: "MAN", suffix: "KIND"))
        info.wordBank.append(Word(prefix: "WORK", link: "MAN", suffix: "POWER"))
        // end man
        
        // start main - yachts
        info.wordBank.append(Word(prefix: "YACHTS", link: "MAN", suffix: "HOLE"))
        info.wordBank.append(Word(prefix: "YACHTS", link: "MAN", suffix: "HUNT"))
        info.wordBank.append(Word(prefix: "YACHTS", link: "MAN", suffix: "KIND"))
        info.wordBank.append(Word(prefix: "YACHTS", link: "MAN", suffix: "POWER"))
        // end man
        
        info.wordBank.append(Word(prefix: "POST", link: "MASTER", suffix: "MIND"))
        info.wordBank.append(Word(prefix: "POST", link: "MASTER", suffix: "PIECE"))
        info.wordBank.append(Word(prefix: "QUARTER", link: "MASTER", suffix: "MIND"))
        info.wordBank.append(Word(prefix: "QUARTER", link: "MASTER", suffix: "PIECE"))
        
        info.wordBank.append(Word(prefix: "CORN", link: "MEAL", suffix: "TIME"))
        info.wordBank.append(Word(prefix: "OAT", link: "MEAL", suffix: "TIME"))
        
        info.wordBank.append(Word(prefix: "BUTTER", link: "MILK", suffix: "SHAKE"))
        
        info.wordBank.append(Word(prefix: "HONEY", link: "MOON", suffix: "BEAM"))
        info.wordBank.append(Word(prefix: "HONEY", link: "MOON", suffix: "LIGHT"))
        info.wordBank.append(Word(prefix: "HONEY", link: "MOON", suffix: "STRUCK"))
        
        info.wordBank.append(Word(prefix: "COTTON", link: "MOUTH", suffix: "PIECE"))
        info.wordBank.append(Word(prefix: "LOUD", link: "MOUTH", suffix: "PIECE"))
        
        info.wordBank.append(Word(prefix: "USER", link: "NAME", suffix: "SAKE"))
        
        info.wordBank.append(Word(prefix: "BREAK", link: "NECK", suffix: "LINE"))
        info.wordBank.append(Word(prefix: "BREAK", link: "NECK", suffix: "TIE"))
        
        info.wordBank.append(Word(prefix: "ROUGH", link: "NECK", suffix: "LINE"))
        info.wordBank.append(Word(prefix: "ROUGH", link: "NECK", suffix: "TIE"))
        
        info.wordBank.append(Word(prefix: "TURTLE", link: "NECK", suffix: "LINE"))
        info.wordBank.append(Word(prefix: "TURTLE", link: "NECK", suffix: "TIE"))
        
        info.wordBank.append(Word(prefix: "FISH", link: "NET", suffix: "WORK"))
        
        
        info.wordBank.append(Word(prefix: "GOOD", link: "NIGHT", suffix: "FALL"))
        info.wordBank.append(Word(prefix: "GOOD", link: "NIGHT", suffix: "GOWN"))
        info.wordBank.append(Word(prefix: "GOOD", link: "NIGHT", suffix: "MARE"))
        info.wordBank.append(Word(prefix: "GOOD", link: "NIGHT", suffix: "SHIFT"))
        info.wordBank.append(Word(prefix: "GOOD", link: "NIGHT", suffix: "STAND"))
        info.wordBank.append(Word(prefix: "GOOD", link: "NIGHT", suffix: "TIME"))
        
        info.wordBank.append(Word(prefix: "OVER", link: "NIGHT", suffix: "FALL"))
        info.wordBank.append(Word(prefix: "OVER", link: "NIGHT", suffix: "GOWN"))
        info.wordBank.append(Word(prefix: "OVER", link: "NIGHT", suffix: "MARE"))
        info.wordBank.append(Word(prefix: "OVER", link: "NIGHT", suffix: "SHIFT"))
        info.wordBank.append(Word(prefix: "OVER", link: "NIGHT", suffix: "STAND"))
        info.wordBank.append(Word(prefix: "OVER", link: "NIGHT", suffix: "TIME"))
        
        info.wordBank.append(Word(prefix: "FOOT", link: "NOTE", suffix: "BOOK"))
        info.wordBank.append(Word(prefix: "FOOT", link: "NOTE", suffix: "WORTHY"))
        
        info.wordBank.append(Word(prefix: "CHEST", link: "NUT", suffix: "SHELL"))
        info.wordBank.append(Word(prefix: "DOUGH", link: "NUT", suffix: "SHELL"))
        info.wordBank.append(Word(prefix: "HAZEL", link: "NUT", suffix: "SHELL"))
        info.wordBank.append(Word(prefix: "PEA", link: "NUT", suffix: "SHELL"))
        
        // start off - cut
        info.wordBank.append(Word(prefix: "CUT", link: "OFF", suffix: "LINE"))
        info.wordBank.append(Word(prefix: "CUT", link: "OFF", suffix: "SHOOT"))
        info.wordBank.append(Word(prefix: "CUT", link: "OFF", suffix: "SHORE"))
        info.wordBank.append(Word(prefix: "CUT", link: "OFF", suffix: "SIDE"))
        info.wordBank.append(Word(prefix: "CUT", link: "OFF", suffix: "SPRING"))
        // end off
        
        // start off - kick
        info.wordBank.append(Word(prefix: "KICK", link: "OFF", suffix: "LINE"))
        info.wordBank.append(Word(prefix: "KICK", link: "OFF", suffix: "SHOOT"))
        info.wordBank.append(Word(prefix: "KICK", link: "OFF", suffix: "SHORE"))
        info.wordBank.append(Word(prefix: "KICK", link: "OFF", suffix: "SIDE"))
        info.wordBank.append(Word(prefix: "KICK", link: "OFF", suffix: "SPRING"))
        // end off
        
        // start off - lift
        info.wordBank.append(Word(prefix: "LIFT", link: "OFF", suffix: "LINE"))
        info.wordBank.append(Word(prefix: "LIFT", link: "OFF", suffix: "SHOOT"))
        info.wordBank.append(Word(prefix: "LIFT", link: "OFF", suffix: "SHORE"))
        info.wordBank.append(Word(prefix: "LIFT", link: "OFF", suffix: "SIDE"))
        info.wordBank.append(Word(prefix: "LIFT", link: "OFF", suffix: "SPRING"))
        // end off
        
        // start off - run
        info.wordBank.append(Word(prefix: "RUN", link: "OFF", suffix: "LINE"))
        info.wordBank.append(Word(prefix: "RUN", link: "OFF", suffix: "SHOOT"))
        info.wordBank.append(Word(prefix: "RUN", link: "OFF", suffix: "SHORE"))
        info.wordBank.append(Word(prefix: "RUN", link: "OFF", suffix: "SIDE"))
        info.wordBank.append(Word(prefix: "RUN", link: "OFF", suffix: "SPRING"))
        // end off
        
        // start off - show
        info.wordBank.append(Word(prefix: "SHOW", link: "OFF", suffix: "LINE"))
        info.wordBank.append(Word(prefix: "SHOW", link: "OFF", suffix: "SHOOT"))
        info.wordBank.append(Word(prefix: "SHOW", link: "OFF", suffix: "SHORE"))
        info.wordBank.append(Word(prefix: "SHOW", link: "OFF", suffix: "SIDE"))
        info.wordBank.append(Word(prefix: "SHOW", link: "OFF", suffix: "SPRING"))
        // end off
        
        // start off - stand
        info.wordBank.append(Word(prefix: "STAND", link: "OFF", suffix: "LINE"))
        info.wordBank.append(Word(prefix: "STAND", link: "OFF", suffix: "SHOOT"))
        info.wordBank.append(Word(prefix: "STAND", link: "OFF", suffix: "SHORE"))
        info.wordBank.append(Word(prefix: "STAND", link: "OFF", suffix: "SIDE"))
        info.wordBank.append(Word(prefix: "STAND", link: "OFF", suffix: "SPRING"))
        // end off
        
        // start off - take
        info.wordBank.append(Word(prefix: "TAKE", link: "OFF", suffix: "LINE"))
        info.wordBank.append(Word(prefix: "TAKE", link: "OFF", suffix: "SHOOT"))
        info.wordBank.append(Word(prefix: "TAKE", link: "OFF", suffix: "SHORE"))
        info.wordBank.append(Word(prefix: "TAKE", link: "OFF", suffix: "SIDE"))
        info.wordBank.append(Word(prefix: "TAKE", link: "OFF", suffix: "SPRING"))
        // end off
        
        // start off - trade
        info.wordBank.append(Word(prefix: "TRADE", link: "OFF", suffix: "LINE"))
        info.wordBank.append(Word(prefix: "TRADE", link: "OFF", suffix: "SHOOT"))
        info.wordBank.append(Word(prefix: "TRADE", link: "OFF", suffix: "SHORE"))
        info.wordBank.append(Word(prefix: "TRADE", link: "OFF", suffix: "SIDE"))
        info.wordBank.append(Word(prefix: "TRADE", link: "OFF", suffix: "SPRING"))
        // end off
        
        // out start
        info.wordBank.append(Word(prefix: "PRINT", link: "OUT", suffix: "BID"))
        info.wordBank.append(Word(prefix: "PRINT", link: "OUT", suffix: "BREAK"))
        info.wordBank.append(Word(prefix: "PRINT", link: "OUT", suffix: "BURST"))
        info.wordBank.append(Word(prefix: "PRINT", link: "OUT", suffix: "CAST"))
        info.wordBank.append(Word(prefix: "PRINT", link: "OUT", suffix: "COME"))
        
        info.wordBank.append(Word(prefix: "PRINT", link: "OUT", suffix: "CROPPING"))
        info.wordBank.append(Word(prefix: "PRINT", link: "OUT", suffix: "CRY"))
        info.wordBank.append(Word(prefix: "PRINT", link: "OUT", suffix: "DATED"))
        info.wordBank.append(Word(prefix: "PRINT", link: "OUT", suffix: "DO"))
        info.wordBank.append(Word(prefix: "PRINT", link: "OUT", suffix: "DOORS"))
        
        info.wordBank.append(Word(prefix: "PRINT", link: "OUT", suffix: "DOORSMAN"))
        info.wordBank.append(Word(prefix: "PRINT", link: "OUT", suffix: "FIELD"))
        info.wordBank.append(Word(prefix: "PRINT", link: "OUT", suffix: "FIT"))
        info.wordBank.append(Word(prefix: "PRINT", link: "OUT", suffix: "FLOW"))
        info.wordBank.append(Word(prefix: "PRINT", link: "OUT", suffix: "FOX"))
        
        info.wordBank.append(Word(prefix: "PRINT", link: "OUT", suffix: "GAS"))
        info.wordBank.append(Word(prefix: "PRINT", link: "OUT", suffix: "GOING"))
        info.wordBank.append(Word(prefix: "PRINT", link: "OUT", suffix: "GROWN"))
        info.wordBank.append(Word(prefix: "PRINT", link: "OUT", suffix: "HOUSE"))
        info.wordBank.append(Word(prefix: "PRINT", link: "OUT", suffix: "LAST"))
        
        info.wordBank.append(Word(prefix: "PRINT", link: "OUT", suffix: "LAW"))
        info.wordBank.append(Word(prefix: "PRINT", link: "OUT", suffix: "LAY"))
        info.wordBank.append(Word(prefix: "PRINT", link: "OUT", suffix: "LET"))
        info.wordBank.append(Word(prefix: "PRINT", link: "OUT", suffix: "LINE"))
        info.wordBank.append(Word(prefix: "PRINT", link: "OUT", suffix: "LIVE"))
        
        info.wordBank.append(Word(prefix: "PRINT", link: "OUT", suffix: "LOOK"))
        info.wordBank.append(Word(prefix: "PRINT", link: "OUT", suffix: "LYING"))
        info.wordBank.append(Word(prefix: "PRINT", link: "OUT", suffix: "NUMBER"))
        info.wordBank.append(Word(prefix: "PRINT", link: "OUT", suffix: "POST"))
        info.wordBank.append(Word(prefix: "PRINT", link: "OUT", suffix: "PUT"))
        
        
        info.wordBank.append(Word(prefix: "PRINT", link: "OUT", suffix: "RAGE"))
        info.wordBank.append(Word(prefix: "PRINT", link: "OUT", suffix: "RANK"))
        info.wordBank.append(Word(prefix: "PRINT", link: "OUT", suffix: "RUN"))
        info.wordBank.append(Word(prefix: "PRINT", link: "OUT", suffix: "SIDE"))
        info.wordBank.append(Word(prefix: "PRINT", link: "OUT", suffix: "SIDER"))
        
        
        info.wordBank.append(Word(prefix: "PRINT", link: "OUT", suffix: "SHINE"))
        info.wordBank.append(Word(prefix: "PRINT", link: "OUT", suffix: "SIDE"))
        info.wordBank.append(Word(prefix: "PRINT", link: "OUT", suffix: "SIDER"))
        info.wordBank.append(Word(prefix: "PRINT", link: "OUT", suffix: "SKIRTS"))
        info.wordBank.append(Word(prefix: "PRINT", link: "OUT", suffix: "SMART"))
        
        
        info.wordBank.append(Word(prefix: "PRINT", link: "OUT", suffix: "SOURCE"))
        info.wordBank.append(Word(prefix: "PRINT", link: "OUT", suffix: "SPOKEN"))
        info.wordBank.append(Word(prefix: "PRINT", link: "OUT", suffix: "STANDING"))
        info.wordBank.append(Word(prefix: "PRINT", link: "OUT", suffix: "STAY"))
        info.wordBank.append(Word(prefix: "PRINT", link: "OUT", suffix: "STRETCHED"))
        
        info.wordBank.append(Word(prefix: "PRINT", link: "OUT", suffix: "TAKE"))
        info.wordBank.append(Word(prefix: "PRINT", link: "OUT", suffix: "WARD"))
        // out end
        
        // out start
        info.wordBank.append(Word(prefix: "RAIN", link: "OUT", suffix: "BID"))
        info.wordBank.append(Word(prefix: "RAIN", link: "OUT", suffix: "BREAK"))
        info.wordBank.append(Word(prefix: "RAIN", link: "OUT", suffix: "BURST"))
        info.wordBank.append(Word(prefix: "RAIN", link: "OUT", suffix: "CAST"))
        info.wordBank.append(Word(prefix: "RAIN", link: "OUT", suffix: "COME"))
        
        info.wordBank.append(Word(prefix: "RAIN", link: "OUT", suffix: "CROPPING"))
        info.wordBank.append(Word(prefix: "RAIN", link: "OUT", suffix: "CRY"))
        info.wordBank.append(Word(prefix: "RAIN", link: "OUT", suffix: "DATED"))
        info.wordBank.append(Word(prefix: "RAIN", link: "OUT", suffix: "DO"))
        info.wordBank.append(Word(prefix: "RAIN", link: "OUT", suffix: "DOORS"))
        
        info.wordBank.append(Word(prefix: "RAIN", link: "OUT", suffix: "DOORSMAN"))
        info.wordBank.append(Word(prefix: "RAIN", link: "OUT", suffix: "FIELD"))
        info.wordBank.append(Word(prefix: "RAIN", link: "OUT", suffix: "FIT"))
        info.wordBank.append(Word(prefix: "RAIN", link: "OUT", suffix: "FLOW"))
        info.wordBank.append(Word(prefix: "RAIN", link: "OUT", suffix: "FOX"))
        
        info.wordBank.append(Word(prefix: "RAIN", link: "OUT", suffix: "GAS"))
        info.wordBank.append(Word(prefix: "RAIN", link: "OUT", suffix: "GOING"))
        info.wordBank.append(Word(prefix: "RAIN", link: "OUT", suffix: "GROWN"))
        info.wordBank.append(Word(prefix: "RAIN", link: "OUT", suffix: "HOUSE"))
        info.wordBank.append(Word(prefix: "RAIN", link: "OUT", suffix: "LAST"))
        
        info.wordBank.append(Word(prefix: "RAIN", link: "OUT", suffix: "LAW"))
        info.wordBank.append(Word(prefix: "RAIN", link: "OUT", suffix: "LAY"))
        info.wordBank.append(Word(prefix: "RAIN", link: "OUT", suffix: "LET"))
        info.wordBank.append(Word(prefix: "RAIN", link: "OUT", suffix: "LINE"))
        info.wordBank.append(Word(prefix: "RAIN", link: "OUT", suffix: "LIVE"))
        
        info.wordBank.append(Word(prefix: "RAIN", link: "OUT", suffix: "LOOK"))
        info.wordBank.append(Word(prefix: "RAIN", link: "OUT", suffix: "LYING"))
        info.wordBank.append(Word(prefix: "RAIN", link: "OUT", suffix: "NUMBER"))
        info.wordBank.append(Word(prefix: "RAIN", link: "OUT", suffix: "POST"))
        info.wordBank.append(Word(prefix: "RAIN", link: "OUT", suffix: "PUT"))
        
        
        info.wordBank.append(Word(prefix: "RAIN", link: "OUT", suffix: "RAGE"))
        info.wordBank.append(Word(prefix: "RAIN", link: "OUT", suffix: "RANK"))
        info.wordBank.append(Word(prefix: "RAIN", link: "OUT", suffix: "RUN"))
        info.wordBank.append(Word(prefix: "RAIN", link: "OUT", suffix: "SIDE"))
        info.wordBank.append(Word(prefix: "RAIN", link: "OUT", suffix: "SIDER"))
        
        
        info.wordBank.append(Word(prefix: "RAIN", link: "OUT", suffix: "SHINE"))
        info.wordBank.append(Word(prefix: "RAIN", link: "OUT", suffix: "SIDE"))
        info.wordBank.append(Word(prefix: "RAIN", link: "OUT", suffix: "SIDER"))
        info.wordBank.append(Word(prefix: "RAIN", link: "OUT", suffix: "SKIRTS"))
        info.wordBank.append(Word(prefix: "RAIN", link: "OUT", suffix: "SMART"))
        
        
        info.wordBank.append(Word(prefix: "RAIN", link: "OUT", suffix: "SOURCE"))
        info.wordBank.append(Word(prefix: "RAIN", link: "OUT", suffix: "SPOKEN"))
        info.wordBank.append(Word(prefix: "RAIN", link: "OUT", suffix: "STANDING"))
        info.wordBank.append(Word(prefix: "RAIN", link: "OUT", suffix: "STAY"))
        info.wordBank.append(Word(prefix: "RAIN", link: "OUT", suffix: "STRETCHED"))
        
        info.wordBank.append(Word(prefix: "RAIN", link: "OUT", suffix: "TAKE"))
        info.wordBank.append(Word(prefix: "RAIN", link: "OUT", suffix: "WARD"))
        // out end
        
        // out start
        info.wordBank.append(Word(prefix: "TAKE", link: "OUT", suffix: "BID"))
        info.wordBank.append(Word(prefix: "TAKE", link: "OUT", suffix: "BREAK"))
        info.wordBank.append(Word(prefix: "TAKE", link: "OUT", suffix: "BURST"))
        info.wordBank.append(Word(prefix: "TAKE", link: "OUT", suffix: "CAST"))
        info.wordBank.append(Word(prefix: "TAKE", link: "OUT", suffix: "COME"))
        
        info.wordBank.append(Word(prefix: "TAKE", link: "OUT", suffix: "CROPPING"))
        info.wordBank.append(Word(prefix: "TAKE", link: "OUT", suffix: "CRY"))
        info.wordBank.append(Word(prefix: "TAKE", link: "OUT", suffix: "DATED"))
        info.wordBank.append(Word(prefix: "TAKE", link: "OUT", suffix: "DO"))
        info.wordBank.append(Word(prefix: "TAKE", link: "OUT", suffix: "DOORS"))
        
        info.wordBank.append(Word(prefix: "TAKE", link: "OUT", suffix: "DOORSMAN"))
        info.wordBank.append(Word(prefix: "TAKE", link: "OUT", suffix: "FIELD"))
        info.wordBank.append(Word(prefix: "TAKE", link: "OUT", suffix: "FIT"))
        info.wordBank.append(Word(prefix: "TAKE", link: "OUT", suffix: "FLOW"))
        info.wordBank.append(Word(prefix: "TAKE", link: "OUT", suffix: "FOX"))
        
        info.wordBank.append(Word(prefix: "TAKE", link: "OUT", suffix: "GAS"))
        info.wordBank.append(Word(prefix: "TAKE", link: "OUT", suffix: "GOING"))
        info.wordBank.append(Word(prefix: "TAKE", link: "OUT", suffix: "GROWN"))
        info.wordBank.append(Word(prefix: "TAKE", link: "OUT", suffix: "HOUSE"))
        info.wordBank.append(Word(prefix: "TAKE", link: "OUT", suffix: "LAST"))
        
        info.wordBank.append(Word(prefix: "TAKE", link: "OUT", suffix: "LAW"))
        info.wordBank.append(Word(prefix: "TAKE", link: "OUT", suffix: "LAY"))
        info.wordBank.append(Word(prefix: "TAKE", link: "OUT", suffix: "LET"))
        info.wordBank.append(Word(prefix: "TAKE", link: "OUT", suffix: "LINE"))
        info.wordBank.append(Word(prefix: "TAKE", link: "OUT", suffix: "LIVE"))
        
        info.wordBank.append(Word(prefix: "TAKE", link: "OUT", suffix: "LOOK"))
        info.wordBank.append(Word(prefix: "TAKE", link: "OUT", suffix: "LYING"))
        info.wordBank.append(Word(prefix: "TAKE", link: "OUT", suffix: "NUMBER"))
        info.wordBank.append(Word(prefix: "TAKE", link: "OUT", suffix: "POST"))
        info.wordBank.append(Word(prefix: "TAKE", link: "OUT", suffix: "PUT"))
        
        
        info.wordBank.append(Word(prefix: "TAKE", link: "OUT", suffix: "RAGE"))
        info.wordBank.append(Word(prefix: "TAKE", link: "OUT", suffix: "RANK"))
        info.wordBank.append(Word(prefix: "TAKE", link: "OUT", suffix: "RUN"))
        info.wordBank.append(Word(prefix: "TAKE", link: "OUT", suffix: "SIDE"))
        info.wordBank.append(Word(prefix: "TAKE", link: "OUT", suffix: "SIDER"))
        
        
        info.wordBank.append(Word(prefix: "TAKE", link: "OUT", suffix: "SHINE"))
        info.wordBank.append(Word(prefix: "TAKE", link: "OUT", suffix: "SIDE"))
        info.wordBank.append(Word(prefix: "TAKE", link: "OUT", suffix: "SIDER"))
        info.wordBank.append(Word(prefix: "TAKE", link: "OUT", suffix: "SKIRTS"))
        info.wordBank.append(Word(prefix: "TAKE", link: "OUT", suffix: "SMART"))
        
        
        info.wordBank.append(Word(prefix: "TAKE", link: "OUT", suffix: "SOURCE"))
        info.wordBank.append(Word(prefix: "TAKE", link: "OUT", suffix: "SPOKEN"))
        info.wordBank.append(Word(prefix: "TAKE", link: "OUT", suffix: "STANDING"))
        info.wordBank.append(Word(prefix: "TAKE", link: "OUT", suffix: "STAY"))
        info.wordBank.append(Word(prefix: "TAKE", link: "OUT", suffix: "STRETCHED"))
        
        info.wordBank.append(Word(prefix: "TAKE", link: "OUT", suffix: "TAKE"))
        info.wordBank.append(Word(prefix: "TAKE", link: "OUT", suffix: "WARD"))
        // out end
        
        // out start
        info.wordBank.append(Word(prefix: "THROUGH", link: "OUT", suffix: "BID"))
        info.wordBank.append(Word(prefix: "THROUGH", link: "OUT", suffix: "BREAK"))
        info.wordBank.append(Word(prefix: "THROUGH", link: "OUT", suffix: "BURST"))
        info.wordBank.append(Word(prefix: "THROUGH", link: "OUT", suffix: "CAST"))
        info.wordBank.append(Word(prefix: "THROUGH", link: "OUT", suffix: "COME"))
        
        info.wordBank.append(Word(prefix: "THROUGH", link: "OUT", suffix: "CROPPING"))
        info.wordBank.append(Word(prefix: "THROUGH", link: "OUT", suffix: "CRY"))
        info.wordBank.append(Word(prefix: "THROUGH", link: "OUT", suffix: "DATED"))
        info.wordBank.append(Word(prefix: "THROUGH", link: "OUT", suffix: "DO"))
        info.wordBank.append(Word(prefix: "THROUGH", link: "OUT", suffix: "DOORS"))
        
        info.wordBank.append(Word(prefix: "THROUGH", link: "OUT", suffix: "DOORSMAN"))
        info.wordBank.append(Word(prefix: "THROUGH", link: "OUT", suffix: "FIELD"))
        info.wordBank.append(Word(prefix: "THROUGH", link: "OUT", suffix: "FIT"))
        info.wordBank.append(Word(prefix: "THROUGH", link: "OUT", suffix: "FLOW"))
        info.wordBank.append(Word(prefix: "THROUGH", link: "OUT", suffix: "FOX"))
        
        info.wordBank.append(Word(prefix: "THROUGH", link: "OUT", suffix: "GAS"))
        info.wordBank.append(Word(prefix: "THROUGH", link: "OUT", suffix: "GOING"))
        info.wordBank.append(Word(prefix: "THROUGH", link: "OUT", suffix: "GROWN"))
        info.wordBank.append(Word(prefix: "THROUGH", link: "OUT", suffix: "HOUSE"))
        info.wordBank.append(Word(prefix: "THROUGH", link: "OUT", suffix: "LAST"))
        
        info.wordBank.append(Word(prefix: "THROUGH", link: "OUT", suffix: "LAW"))
        info.wordBank.append(Word(prefix: "THROUGH", link: "OUT", suffix: "LAY"))
        info.wordBank.append(Word(prefix: "THROUGH", link: "OUT", suffix: "LET"))
        info.wordBank.append(Word(prefix: "THROUGH", link: "OUT", suffix: "LINE"))
        info.wordBank.append(Word(prefix: "THROUGH", link: "OUT", suffix: "LIVE"))
        
        info.wordBank.append(Word(prefix: "THROUGH", link: "OUT", suffix: "LOOK"))
        info.wordBank.append(Word(prefix: "THROUGH", link: "OUT", suffix: "LYING"))
        info.wordBank.append(Word(prefix: "THROUGH", link: "OUT", suffix: "NUMBER"))
        info.wordBank.append(Word(prefix: "THROUGH", link: "OUT", suffix: "POST"))
        info.wordBank.append(Word(prefix: "THROUGH", link: "OUT", suffix: "PUT"))
        
        
        info.wordBank.append(Word(prefix: "THROUGH", link: "OUT", suffix: "RAGE"))
        info.wordBank.append(Word(prefix: "THROUGH", link: "OUT", suffix: "RANK"))
        info.wordBank.append(Word(prefix: "THROUGH", link: "OUT", suffix: "RUN"))
        info.wordBank.append(Word(prefix: "THROUGH", link: "OUT", suffix: "SIDE"))
        info.wordBank.append(Word(prefix: "THROUGH", link: "OUT", suffix: "SIDER"))
        
        
        info.wordBank.append(Word(prefix: "THROUGH", link: "OUT", suffix: "SHINE"))
        info.wordBank.append(Word(prefix: "THROUGH", link: "OUT", suffix: "SIDE"))
        info.wordBank.append(Word(prefix: "THROUGH", link: "OUT", suffix: "SIDER"))
        info.wordBank.append(Word(prefix: "THROUGH", link: "OUT", suffix: "SKIRTS"))
        info.wordBank.append(Word(prefix: "THROUGH", link: "OUT", suffix: "SMART"))
        
        
        info.wordBank.append(Word(prefix: "THROUGH", link: "OUT", suffix: "SOURCE"))
        info.wordBank.append(Word(prefix: "THROUGH", link: "OUT", suffix: "SPOKEN"))
        info.wordBank.append(Word(prefix: "THROUGH", link: "OUT", suffix: "STANDING"))
        info.wordBank.append(Word(prefix: "THROUGH", link: "OUT", suffix: "STAY"))
        info.wordBank.append(Word(prefix: "THROUGH", link: "OUT", suffix: "STRETCHED"))
        
        info.wordBank.append(Word(prefix: "THROUGH", link: "OUT", suffix: "TAKE"))
        info.wordBank.append(Word(prefix: "THROUGH", link: "OUT", suffix: "WARD"))
        // out end
        
        // out start
        info.wordBank.append(Word(prefix: "TIME", link: "OUT", suffix: "BID"))
        info.wordBank.append(Word(prefix: "TIME", link: "OUT", suffix: "BREAK"))
        info.wordBank.append(Word(prefix: "TIME", link: "OUT", suffix: "BURST"))
        info.wordBank.append(Word(prefix: "TIME", link: "OUT", suffix: "CAST"))
        info.wordBank.append(Word(prefix: "TIME", link: "OUT", suffix: "COME"))
        
        info.wordBank.append(Word(prefix: "TIME", link: "OUT", suffix: "CROPPING"))
        info.wordBank.append(Word(prefix: "TIME", link: "OUT", suffix: "CRY"))
        info.wordBank.append(Word(prefix: "TIME", link: "OUT", suffix: "DATED"))
        info.wordBank.append(Word(prefix: "TIME", link: "OUT", suffix: "DO"))
        info.wordBank.append(Word(prefix: "TIME", link: "OUT", suffix: "DOORS"))
        
        info.wordBank.append(Word(prefix: "TIME", link: "OUT", suffix: "DOORSMAN"))
        info.wordBank.append(Word(prefix: "TIME", link: "OUT", suffix: "FIELD"))
        info.wordBank.append(Word(prefix: "TIME", link: "OUT", suffix: "FIT"))
        info.wordBank.append(Word(prefix: "TIME", link: "OUT", suffix: "FLOW"))
        info.wordBank.append(Word(prefix: "TIME", link: "OUT", suffix: "FOX"))
        
        info.wordBank.append(Word(prefix: "TIME", link: "OUT", suffix: "GAS"))
        info.wordBank.append(Word(prefix: "TIME", link: "OUT", suffix: "GOING"))
        info.wordBank.append(Word(prefix: "TIME", link: "OUT", suffix: "GROWN"))
        info.wordBank.append(Word(prefix: "TIME", link: "OUT", suffix: "HOUSE"))
        info.wordBank.append(Word(prefix: "TIME", link: "OUT", suffix: "LAST"))
        
        info.wordBank.append(Word(prefix: "TIME", link: "OUT", suffix: "LAW"))
        info.wordBank.append(Word(prefix: "TIME", link: "OUT", suffix: "LAY"))
        info.wordBank.append(Word(prefix: "TIME", link: "OUT", suffix: "LET"))
        info.wordBank.append(Word(prefix: "TIME", link: "OUT", suffix: "LINE"))
        info.wordBank.append(Word(prefix: "TIME", link: "OUT", suffix: "LIVE"))
        
        info.wordBank.append(Word(prefix: "TIME", link: "OUT", suffix: "LOOK"))
        info.wordBank.append(Word(prefix: "TIME", link: "OUT", suffix: "LYING"))
        info.wordBank.append(Word(prefix: "TIME", link: "OUT", suffix: "NUMBER"))
        info.wordBank.append(Word(prefix: "TIME", link: "OUT", suffix: "POST"))
        info.wordBank.append(Word(prefix: "TIME", link: "OUT", suffix: "PUT"))
        
        info.wordBank.append(Word(prefix: "TIME", link: "OUT", suffix: "RAGE"))
        info.wordBank.append(Word(prefix: "TIME", link: "OUT", suffix: "RANK"))
        info.wordBank.append(Word(prefix: "TIME", link: "OUT", suffix: "RUN"))
        info.wordBank.append(Word(prefix: "TIME", link: "OUT", suffix: "SIDE"))
        info.wordBank.append(Word(prefix: "TIME", link: "OUT", suffix: "SIDER"))
        
        info.wordBank.append(Word(prefix: "TIME", link: "OUT", suffix: "SHINE"))
        info.wordBank.append(Word(prefix: "TIME", link: "OUT", suffix: "SIDE"))
        info.wordBank.append(Word(prefix: "TIME", link: "OUT", suffix: "SIDER"))
        info.wordBank.append(Word(prefix: "TIME", link: "OUT", suffix: "SKIRTS"))
        info.wordBank.append(Word(prefix: "TIME", link: "OUT", suffix: "SMART"))
        
        
        info.wordBank.append(Word(prefix: "TIME", link: "OUT", suffix: "SOURCE"))
        info.wordBank.append(Word(prefix: "TIME", link: "OUT", suffix: "SPOKEN"))
        info.wordBank.append(Word(prefix: "TIME", link: "OUT", suffix: "STANDING"))
        info.wordBank.append(Word(prefix: "TIME", link: "OUT", suffix: "STAY"))
        info.wordBank.append(Word(prefix: "TIME", link: "OUT", suffix: "STRETCHED"))
        
        info.wordBank.append(Word(prefix: "TIME", link: "OUT", suffix: "TAKE"))
        info.wordBank.append(Word(prefix: "TIME", link: "OUT", suffix: "WARD"))
        // out end
        
        // out start
        info.wordBank.append(Word(prefix: "TRY", link: "OUT", suffix: "BID"))
        info.wordBank.append(Word(prefix: "TRY", link: "OUT", suffix: "BREAK"))
        info.wordBank.append(Word(prefix: "TRY", link: "OUT", suffix: "BURST"))
        info.wordBank.append(Word(prefix: "TRY", link: "OUT", suffix: "CAST"))
        info.wordBank.append(Word(prefix: "TRY", link: "OUT", suffix: "COME"))
        
        info.wordBank.append(Word(prefix: "TRY", link: "OUT", suffix: "CROPPING"))
        info.wordBank.append(Word(prefix: "TRY", link: "OUT", suffix: "CRY"))
        info.wordBank.append(Word(prefix: "TRY", link: "OUT", suffix: "DATED"))
        info.wordBank.append(Word(prefix: "TRY", link: "OUT", suffix: "DO"))
        info.wordBank.append(Word(prefix: "TRY", link: "OUT", suffix: "DOORS"))
        
        info.wordBank.append(Word(prefix: "TRY", link: "OUT", suffix: "DOORSMAN"))
        info.wordBank.append(Word(prefix: "TRY", link: "OUT", suffix: "FIELD"))
        info.wordBank.append(Word(prefix: "TRY", link: "OUT", suffix: "FIT"))
        info.wordBank.append(Word(prefix: "TRY", link: "OUT", suffix: "FLOW"))
        info.wordBank.append(Word(prefix: "TRY", link: "OUT", suffix: "FOX"))
        
        info.wordBank.append(Word(prefix: "TRY", link: "OUT", suffix: "GAS"))
        info.wordBank.append(Word(prefix: "TRY", link: "OUT", suffix: "GOING"))
        info.wordBank.append(Word(prefix: "TRY", link: "OUT", suffix: "GROWN"))
        info.wordBank.append(Word(prefix: "TRY", link: "OUT", suffix: "HOUSE"))
        info.wordBank.append(Word(prefix: "TRY", link: "OUT", suffix: "LAST"))
        
        info.wordBank.append(Word(prefix: "TRY", link: "OUT", suffix: "LAW"))
        info.wordBank.append(Word(prefix: "TRY", link: "OUT", suffix: "LAY"))
        info.wordBank.append(Word(prefix: "TRY", link: "OUT", suffix: "LET"))
        info.wordBank.append(Word(prefix: "TRY", link: "OUT", suffix: "LINE"))
        info.wordBank.append(Word(prefix: "TRY", link: "OUT", suffix: "LIVE"))
        
        info.wordBank.append(Word(prefix: "TRY", link: "OUT", suffix: "LOOK"))
        info.wordBank.append(Word(prefix: "TRY", link: "OUT", suffix: "LYING"))
        info.wordBank.append(Word(prefix: "TRY", link: "OUT", suffix: "NUMBER"))
        info.wordBank.append(Word(prefix: "TRY", link: "OUT", suffix: "POST"))
        info.wordBank.append(Word(prefix: "TRY", link: "OUT", suffix: "PUT"))
        
        
        info.wordBank.append(Word(prefix: "TRY", link: "OUT", suffix: "RAGE"))
        info.wordBank.append(Word(prefix: "TRY", link: "OUT", suffix: "RANK"))
        info.wordBank.append(Word(prefix: "TRY", link: "OUT", suffix: "RUN"))
        info.wordBank.append(Word(prefix: "TRY", link: "OUT", suffix: "SIDE"))
        info.wordBank.append(Word(prefix: "TRY", link: "OUT", suffix: "SIDER"))
        
        
        info.wordBank.append(Word(prefix: "TRY", link: "OUT", suffix: "SHINE"))
        info.wordBank.append(Word(prefix: "TRY", link: "OUT", suffix: "SIDE"))
        info.wordBank.append(Word(prefix: "TRY", link: "OUT", suffix: "SIDER"))
        info.wordBank.append(Word(prefix: "TRY", link: "OUT", suffix: "SKIRTS"))
        info.wordBank.append(Word(prefix: "TRY", link: "OUT", suffix: "SMART"))
        
        
        info.wordBank.append(Word(prefix: "TRY", link: "OUT", suffix: "SOURCE"))
        info.wordBank.append(Word(prefix: "TRY", link: "OUT", suffix: "SPOKEN"))
        info.wordBank.append(Word(prefix: "TRY", link: "OUT", suffix: "STANDING"))
        info.wordBank.append(Word(prefix: "TRY", link: "OUT", suffix: "STAY"))
        info.wordBank.append(Word(prefix: "TRY", link: "OUT", suffix: "STRETCHED"))
        
        info.wordBank.append(Word(prefix: "TRY", link: "OUT", suffix: "TAKE"))
        info.wordBank.append(Word(prefix: "TRY", link: "OUT", suffix: "WARD"))
        // out end
        
        // out start
        info.wordBank.append(Word(prefix: "TURN", link: "OUT", suffix: "BID"))
        info.wordBank.append(Word(prefix: "TURN", link: "OUT", suffix: "BREAK"))
        info.wordBank.append(Word(prefix: "TURN", link: "OUT", suffix: "BURST"))
        info.wordBank.append(Word(prefix: "TURN", link: "OUT", suffix: "CAST"))
        info.wordBank.append(Word(prefix: "TURN", link: "OUT", suffix: "COME"))
        
        info.wordBank.append(Word(prefix: "TURN", link: "OUT", suffix: "CROPPING"))
        info.wordBank.append(Word(prefix: "TURN", link: "OUT", suffix: "CRY"))
        info.wordBank.append(Word(prefix: "TURN", link: "OUT", suffix: "DATED"))
        info.wordBank.append(Word(prefix: "TURN", link: "OUT", suffix: "DO"))
        info.wordBank.append(Word(prefix: "TURN", link: "OUT", suffix: "DOORS"))
        
        info.wordBank.append(Word(prefix: "TURN", link: "OUT", suffix: "DOORSMAN"))
        info.wordBank.append(Word(prefix: "TURN", link: "OUT", suffix: "FIELD"))
        info.wordBank.append(Word(prefix: "TURN", link: "OUT", suffix: "FIT"))
        info.wordBank.append(Word(prefix: "TURN", link: "OUT", suffix: "FLOW"))
        info.wordBank.append(Word(prefix: "TURN", link: "OUT", suffix: "FOX"))
        
        info.wordBank.append(Word(prefix: "TURN", link: "OUT", suffix: "GAS"))
        info.wordBank.append(Word(prefix: "TURN", link: "OUT", suffix: "GOING"))
        info.wordBank.append(Word(prefix: "TURN", link: "OUT", suffix: "GROWN"))
        info.wordBank.append(Word(prefix: "TURN", link: "OUT", suffix: "HOUSE"))
        info.wordBank.append(Word(prefix: "TURN", link: "OUT", suffix: "LAST"))
        
        info.wordBank.append(Word(prefix: "TURN", link: "OUT", suffix: "LAW"))
        info.wordBank.append(Word(prefix: "TURN", link: "OUT", suffix: "LAY"))
        info.wordBank.append(Word(prefix: "TURN", link: "OUT", suffix: "LET"))
        info.wordBank.append(Word(prefix: "TURN", link: "OUT", suffix: "LINE"))
        info.wordBank.append(Word(prefix: "TURN", link: "OUT", suffix: "LIVE"))
        
        info.wordBank.append(Word(prefix: "TURN", link: "OUT", suffix: "LOOK"))
        info.wordBank.append(Word(prefix: "TURN", link: "OUT", suffix: "LYING"))
        info.wordBank.append(Word(prefix: "TURN", link: "OUT", suffix: "NUMBER"))
        info.wordBank.append(Word(prefix: "TURN", link: "OUT", suffix: "POST"))
        info.wordBank.append(Word(prefix: "TURN", link: "OUT", suffix: "PUT"))
        
        
        info.wordBank.append(Word(prefix: "TURN", link: "OUT", suffix: "RAGE"))
        info.wordBank.append(Word(prefix: "TURN", link: "OUT", suffix: "RANK"))
        info.wordBank.append(Word(prefix: "TURN", link: "OUT", suffix: "RUN"))
        info.wordBank.append(Word(prefix: "TURN", link: "OUT", suffix: "SIDE"))
        info.wordBank.append(Word(prefix: "TURN", link: "OUT", suffix: "SIDER"))
        
        
        info.wordBank.append(Word(prefix: "TURN", link: "OUT", suffix: "SHINE"))
        info.wordBank.append(Word(prefix: "TURN", link: "OUT", suffix: "SIDE"))
        info.wordBank.append(Word(prefix: "TURN", link: "OUT", suffix: "SIDER"))
        info.wordBank.append(Word(prefix: "TURN", link: "OUT", suffix: "SKIRTS"))
        info.wordBank.append(Word(prefix: "TURN", link: "OUT", suffix: "SMART"))
        
        
        info.wordBank.append(Word(prefix: "TURN", link: "OUT", suffix: "SOURCE"))
        info.wordBank.append(Word(prefix: "TURN", link: "OUT", suffix: "SPOKEN"))
        info.wordBank.append(Word(prefix: "TURN", link: "OUT", suffix: "STANDING"))
        info.wordBank.append(Word(prefix: "TURN", link: "OUT", suffix: "STAY"))
        info.wordBank.append(Word(prefix: "TURN", link: "OUT", suffix: "STRETCHED"))
        
        info.wordBank.append(Word(prefix: "TURN", link: "OUT", suffix: "TAKE"))
        info.wordBank.append(Word(prefix: "TURN", link: "OUT", suffix: "WARD"))
        // out end
        
        // out start
        info.wordBank.append(Word(prefix: "WALK", link: "OUT", suffix: "BID"))
        info.wordBank.append(Word(prefix: "WALK", link: "OUT", suffix: "BREAK"))
        info.wordBank.append(Word(prefix: "WALK", link: "OUT", suffix: "BURST"))
        info.wordBank.append(Word(prefix: "WALK", link: "OUT", suffix: "CAST"))
        info.wordBank.append(Word(prefix: "WALK", link: "OUT", suffix: "COME"))
        
        info.wordBank.append(Word(prefix: "WALK", link: "OUT", suffix: "CROPPING"))
        info.wordBank.append(Word(prefix: "WALK", link: "OUT", suffix: "CRY"))
        info.wordBank.append(Word(prefix: "WALK", link: "OUT", suffix: "DATED"))
        info.wordBank.append(Word(prefix: "WALK", link: "OUT", suffix: "DO"))
        info.wordBank.append(Word(prefix: "WALK", link: "OUT", suffix: "DOORS"))
        
        info.wordBank.append(Word(prefix: "WALK", link: "OUT", suffix: "DOORSMAN"))
        info.wordBank.append(Word(prefix: "WALK", link: "OUT", suffix: "FIELD"))
        info.wordBank.append(Word(prefix: "WALK", link: "OUT", suffix: "FIT"))
        info.wordBank.append(Word(prefix: "WALK", link: "OUT", suffix: "FLOW"))
        info.wordBank.append(Word(prefix: "WALK", link: "OUT", suffix: "FOX"))
        
        info.wordBank.append(Word(prefix: "WALK", link: "OUT", suffix: "GAS"))
        info.wordBank.append(Word(prefix: "WALK", link: "OUT", suffix: "GOING"))
        info.wordBank.append(Word(prefix: "WALK", link: "OUT", suffix: "GROWN"))
        info.wordBank.append(Word(prefix: "WALK", link: "OUT", suffix: "HOUSE"))
        info.wordBank.append(Word(prefix: "WALK", link: "OUT", suffix: "LAST"))
        
        info.wordBank.append(Word(prefix: "WALK", link: "OUT", suffix: "LAW"))
        info.wordBank.append(Word(prefix: "WALK", link: "OUT", suffix: "LAY"))
        info.wordBank.append(Word(prefix: "WALK", link: "OUT", suffix: "LET"))
        info.wordBank.append(Word(prefix: "WALK", link: "OUT", suffix: "LINE"))
        info.wordBank.append(Word(prefix: "WALK", link: "OUT", suffix: "LIVE"))
        
        info.wordBank.append(Word(prefix: "WALK", link: "OUT", suffix: "LOOK"))
        info.wordBank.append(Word(prefix: "WALK", link: "OUT", suffix: "LYING"))
        info.wordBank.append(Word(prefix: "WALK", link: "OUT", suffix: "NUMBER"))
        info.wordBank.append(Word(prefix: "WALK", link: "OUT", suffix: "POST"))
        info.wordBank.append(Word(prefix: "WALK", link: "OUT", suffix: "PUT"))
        
        info.wordBank.append(Word(prefix: "WALK", link: "OUT", suffix: "RAGE"))
        info.wordBank.append(Word(prefix: "WALK", link: "OUT", suffix: "RANK"))
        info.wordBank.append(Word(prefix: "WALK", link: "OUT", suffix: "RUN"))
        info.wordBank.append(Word(prefix: "WALK", link: "OUT", suffix: "SIDE"))
        info.wordBank.append(Word(prefix: "WALK", link: "OUT", suffix: "SIDER"))
        
        info.wordBank.append(Word(prefix: "WALK", link: "OUT", suffix: "SHINE"))
        info.wordBank.append(Word(prefix: "WALK", link: "OUT", suffix: "SIDE"))
        info.wordBank.append(Word(prefix: "WALK", link: "OUT", suffix: "SIDER"))
        info.wordBank.append(Word(prefix: "WALK", link: "OUT", suffix: "SKIRTS"))
        info.wordBank.append(Word(prefix: "WALK", link: "OUT", suffix: "SMART"))
        
        
        info.wordBank.append(Word(prefix: "WALK", link: "OUT", suffix: "SOURCE"))
        info.wordBank.append(Word(prefix: "WALK", link: "OUT", suffix: "SPOKEN"))
        info.wordBank.append(Word(prefix: "WALK", link: "OUT", suffix: "STANDING"))
        info.wordBank.append(Word(prefix: "WALK", link: "OUT", suffix: "STAY"))
        info.wordBank.append(Word(prefix: "WALK", link: "OUT", suffix: "STRETCHED"))
        
        info.wordBank.append(Word(prefix: "WALK", link: "OUT", suffix: "TAKE"))
        info.wordBank.append(Word(prefix: "WALK", link: "OUT", suffix: "WARD"))
        // out end
        
        // out start
        info.wordBank.append(Word(prefix: "WITH", link: "OUT", suffix: "BID"))
        info.wordBank.append(Word(prefix: "WITH", link: "OUT", suffix: "BREAK"))
        info.wordBank.append(Word(prefix: "WITH", link: "OUT", suffix: "BURST"))
        info.wordBank.append(Word(prefix: "WITH", link: "OUT", suffix: "CAST"))
        info.wordBank.append(Word(prefix: "WITH", link: "OUT", suffix: "COME"))
        
        info.wordBank.append(Word(prefix: "WITH", link: "OUT", suffix: "CROPPING"))
        info.wordBank.append(Word(prefix: "WITH", link: "OUT", suffix: "CRY"))
        info.wordBank.append(Word(prefix: "WITH", link: "OUT", suffix: "DATED"))
        info.wordBank.append(Word(prefix: "WITH", link: "OUT", suffix: "DO"))
        info.wordBank.append(Word(prefix: "WITH", link: "OUT", suffix: "DOORS"))
        
        info.wordBank.append(Word(prefix: "WITH", link: "OUT", suffix: "DOORSMAN"))
        info.wordBank.append(Word(prefix: "WITH", link: "OUT", suffix: "FIELD"))
        info.wordBank.append(Word(prefix: "WITH", link: "OUT", suffix: "FIT"))
        info.wordBank.append(Word(prefix: "WITH", link: "OUT", suffix: "FLOW"))
        info.wordBank.append(Word(prefix: "WITH", link: "OUT", suffix: "FOX"))
        
        info.wordBank.append(Word(prefix: "WITH", link: "OUT", suffix: "GAS"))
        info.wordBank.append(Word(prefix: "WITH", link: "OUT", suffix: "GOING"))
        info.wordBank.append(Word(prefix: "WITH", link: "OUT", suffix: "GROWN"))
        info.wordBank.append(Word(prefix: "WITH", link: "OUT", suffix: "HOUSE"))
        info.wordBank.append(Word(prefix: "WITH", link: "OUT", suffix: "LAST"))
        
        info.wordBank.append(Word(prefix: "WITH", link: "OUT", suffix: "LAW"))
        info.wordBank.append(Word(prefix: "WITH", link: "OUT", suffix: "LAY"))
        info.wordBank.append(Word(prefix: "WITH", link: "OUT", suffix: "LET"))
        info.wordBank.append(Word(prefix: "WITH", link: "OUT", suffix: "LINE"))
        info.wordBank.append(Word(prefix: "WITH", link: "OUT", suffix: "LIVE"))
        
        info.wordBank.append(Word(prefix: "WITH", link: "OUT", suffix: "LOOK"))
        info.wordBank.append(Word(prefix: "WITH", link: "OUT", suffix: "LYING"))
        info.wordBank.append(Word(prefix: "WITH", link: "OUT", suffix: "NUMBER"))
        info.wordBank.append(Word(prefix: "WITH", link: "OUT", suffix: "POST"))
        info.wordBank.append(Word(prefix: "WITH", link: "OUT", suffix: "PUT"))
        
        
        info.wordBank.append(Word(prefix: "WITH", link: "OUT", suffix: "RAGE"))
        info.wordBank.append(Word(prefix: "WITH", link: "OUT", suffix: "RANK"))
        info.wordBank.append(Word(prefix: "WITH", link: "OUT", suffix: "RUN"))
        info.wordBank.append(Word(prefix: "WITH", link: "OUT", suffix: "SIDE"))
        info.wordBank.append(Word(prefix: "WITH", link: "OUT", suffix: "SIDER"))
        
        
        info.wordBank.append(Word(prefix: "WITH", link: "OUT", suffix: "SHINE"))
        info.wordBank.append(Word(prefix: "WITH", link: "OUT", suffix: "SIDE"))
        info.wordBank.append(Word(prefix: "WITH", link: "OUT", suffix: "SIDER"))
        info.wordBank.append(Word(prefix: "WITH", link: "OUT", suffix: "SKIRTS"))
        info.wordBank.append(Word(prefix: "WITH", link: "OUT", suffix: "SMART"))
        
        
        info.wordBank.append(Word(prefix: "WITH", link: "OUT", suffix: "SOURCE"))
        info.wordBank.append(Word(prefix: "WITH", link: "OUT", suffix: "SPOKEN"))
        info.wordBank.append(Word(prefix: "WITH", link: "OUT", suffix: "STANDING"))
        info.wordBank.append(Word(prefix: "WITH", link: "OUT", suffix: "STAY"))
        info.wordBank.append(Word(prefix: "WITH", link: "OUT", suffix: "STRETCHED"))
        
        info.wordBank.append(Word(prefix: "WITH", link: "OUT", suffix: "TAKE"))
        info.wordBank.append(Word(prefix: "WITH", link: "OUT", suffix: "WARD"))
        // out end
        
        // over start - HAND
        info.wordBank.append(Word(prefix: "HAND", link: "OVER", suffix: "ABUNDANT"))
        info.wordBank.append(Word(prefix: "HAND", link: "OVER", suffix: "ACHIEVE"))
        info.wordBank.append(Word(prefix: "HAND", link: "OVER", suffix: "ACT"))
        info.wordBank.append(Word(prefix: "HAND", link: "OVER", suffix: "ACTIVE"))
        info.wordBank.append(Word(prefix: "HAND", link: "OVER", suffix: "AGE"))
        
        info.wordBank.append(Word(prefix: "HAND", link: "OVER", suffix: "ALL"))
        info.wordBank.append(Word(prefix: "HAND", link: "OVER", suffix: "ALLS"))
        info.wordBank.append(Word(prefix: "HAND", link: "OVER", suffix: "ARCHING"))
        info.wordBank.append(Word(prefix: "HAND", link: "OVER", suffix: "BEARING"))
        info.wordBank.append(Word(prefix: "HAND", link: "OVER", suffix: "BITE"))
        
        info.wordBank.append(Word(prefix: "HAND", link: "OVER", suffix: "BLOWN"))
        info.wordBank.append(Word(prefix: "HAND", link: "OVER", suffix: "BOARD"))
        info.wordBank.append(Word(prefix: "HAND", link: "OVER", suffix: "BOOKED"))
        info.wordBank.append(Word(prefix: "HAND", link: "OVER", suffix: "BURDEN"))
        info.wordBank.append(Word(prefix: "HAND", link: "OVER", suffix: "CAST"))
        
        info.wordBank.append(Word(prefix: "HAND", link: "OVER", suffix: "CHARGE"))
        info.wordBank.append(Word(prefix: "HAND", link: "OVER", suffix: "COAT"))
        info.wordBank.append(Word(prefix: "HAND", link: "OVER", suffix: "COME"))
        info.wordBank.append(Word(prefix: "HAND", link: "OVER", suffix: "COMPENSATE"))
        info.wordBank.append(Word(prefix: "HAND", link: "OVER", suffix: "COOK"))
        
        info.wordBank.append(Word(prefix: "HAND", link: "OVER", suffix: "CROWD"))
        info.wordBank.append(Word(prefix: "HAND", link: "OVER", suffix: "DO"))
        info.wordBank.append(Word(prefix: "HAND", link: "OVER", suffix: "DOSE"))
        info.wordBank.append(Word(prefix: "HAND", link: "OVER", suffix: "DRAFT"))
        info.wordBank.append(Word(prefix: "HAND", link: "OVER", suffix: "DRESSED"))
        
        info.wordBank.append(Word(prefix: "HAND", link: "OVER", suffix: "DRIVE"))
        info.wordBank.append(Word(prefix: "HAND", link: "OVER", suffix: "DUE"))
        info.wordBank.append(Word(prefix: "HAND", link: "OVER", suffix: "EAGER"))
        info.wordBank.append(Word(prefix: "HAND", link: "OVER", suffix: "EAT"))
        info.wordBank.append(Word(prefix: "HAND", link: "OVER", suffix: "EXPOSED"))
        
        info.wordBank.append(Word(prefix: "HAND", link: "OVER", suffix: "FILL"))
        info.wordBank.append(Word(prefix: "HAND", link: "OVER", suffix: "FLOW"))
        info.wordBank.append(Word(prefix: "HAND", link: "OVER", suffix: "FULL"))
        info.wordBank.append(Word(prefix: "HAND", link: "OVER", suffix: "GROWN"))
        info.wordBank.append(Word(prefix: "HAND", link: "OVER", suffix: "HAND"))
        
        info.wordBank.append(Word(prefix: "HAND", link: "OVER", suffix: "HANG"))
        info.wordBank.append(Word(prefix: "HAND", link: "OVER", suffix: "HAUL"))
        info.wordBank.append(Word(prefix: "HAND", link: "OVER", suffix: "HEAD"))
        info.wordBank.append(Word(prefix: "HAND", link: "OVER", suffix: "HEAR"))
        info.wordBank.append(Word(prefix: "HAND", link: "OVER", suffix: "HEAT"))
        
        info.wordBank.append(Word(prefix: "HAND", link: "OVER", suffix: "KILL"))
        info.wordBank.append(Word(prefix: "HAND", link: "OVER", suffix: "LAND"))
        info.wordBank.append(Word(prefix: "HAND", link: "OVER", suffix: "LAP"))
        info.wordBank.append(Word(prefix: "HAND", link: "OVER", suffix: "LAY"))
        info.wordBank.append(Word(prefix: "HAND", link: "OVER", suffix: "LOAD"))
        
        info.wordBank.append(Word(prefix: "HAND", link: "OVER", suffix: "LOOK"))
        info.wordBank.append(Word(prefix: "HAND", link: "OVER", suffix: "LORD"))
        info.wordBank.append(Word(prefix: "HAND", link: "OVER", suffix: "LYING"))
        info.wordBank.append(Word(prefix: "HAND", link: "OVER", suffix: "NIGHT"))
        info.wordBank.append(Word(prefix: "HAND", link: "OVER", suffix: "PACK"))
        
        info.wordBank.append(Word(prefix: "HAND", link: "OVER", suffix: "PAID"))
        info.wordBank.append(Word(prefix: "HAND", link: "OVER", suffix: "PAY"))
        info.wordBank.append(Word(prefix: "HAND", link: "OVER", suffix: "POWER"))
        info.wordBank.append(Word(prefix: "HAND", link: "OVER", suffix: "RATE"))
        info.wordBank.append(Word(prefix: "HAND", link: "OVER", suffix: "REACH"))
        
        info.wordBank.append(Word(prefix: "HAND", link: "OVER", suffix: "REACT"))
        info.wordBank.append(Word(prefix: "HAND", link: "OVER", suffix: "RIDE"))
        info.wordBank.append(Word(prefix: "HAND", link: "OVER", suffix: "RULE"))
        info.wordBank.append(Word(prefix: "HAND", link: "OVER", suffix: "RUN"))
        info.wordBank.append(Word(prefix: "HAND", link: "OVER", suffix: "SEAS"))
        
        info.wordBank.append(Word(prefix: "HAND", link: "OVER", suffix: "SEER"))
        info.wordBank.append(Word(prefix: "HAND", link: "OVER", suffix: "SIGHT"))
        info.wordBank.append(Word(prefix: "HAND", link: "OVER", suffix: "SHOE"))
        info.wordBank.append(Word(prefix: "HAND", link: "OVER", suffix: "SLEEP"))
        info.wordBank.append(Word(prefix: "HAND", link: "OVER", suffix: "STATE"))
        
        info.wordBank.append(Word(prefix: "HAND", link: "OVER", suffix: "STRETCHED"))
        info.wordBank.append(Word(prefix: "HAND", link: "OVER", suffix: "TAKE"))
        info.wordBank.append(Word(prefix: "HAND", link: "OVER", suffix: "TAXED"))
        info.wordBank.append(Word(prefix: "HAND", link: "OVER", suffix: "THROW"))
        info.wordBank.append(Word(prefix: "HAND", link: "OVER", suffix: "TIME"))
        
        info.wordBank.append(Word(prefix: "HAND", link: "OVER", suffix: "TURN"))
        info.wordBank.append(Word(prefix: "HAND", link: "OVER", suffix: "USE"))
        info.wordBank.append(Word(prefix: "HAND", link: "OVER", suffix: "VALUE"))
        info.wordBank.append(Word(prefix: "HAND", link: "OVER", suffix: "VIEW"))
        info.wordBank.append(Word(prefix: "HAND", link: "OVER", suffix: "WEIGHT"))
        // over end
        
        // over start - LAY
        info.wordBank.append(Word(prefix: "LAY", link: "OVER", suffix: "ABUNDANT"))
        info.wordBank.append(Word(prefix: "LAY", link: "OVER", suffix: "ACHIEVE"))
        info.wordBank.append(Word(prefix: "LAY", link: "OVER", suffix: "ACT"))
        info.wordBank.append(Word(prefix: "LAY", link: "OVER", suffix: "ACTIVE"))
        info.wordBank.append(Word(prefix: "LAY", link: "OVER", suffix: "AGE"))
        
        info.wordBank.append(Word(prefix: "LAY", link: "OVER", suffix: "ALL"))
        info.wordBank.append(Word(prefix: "LAY", link: "OVER", suffix: "ALLS"))
        info.wordBank.append(Word(prefix: "LAY", link: "OVER", suffix: "ARCHING"))
        info.wordBank.append(Word(prefix: "LAY", link: "OVER", suffix: "BEARING"))
        info.wordBank.append(Word(prefix: "LAY", link: "OVER", suffix: "BITE"))
        
        info.wordBank.append(Word(prefix: "LAY", link: "OVER", suffix: "BLOWN"))
        info.wordBank.append(Word(prefix: "LAY", link: "OVER", suffix: "BOARD"))
        info.wordBank.append(Word(prefix: "LAY", link: "OVER", suffix: "BOOKED"))
        info.wordBank.append(Word(prefix: "LAY", link: "OVER", suffix: "BURDEN"))
        info.wordBank.append(Word(prefix: "LAY", link: "OVER", suffix: "CAST"))
        
        info.wordBank.append(Word(prefix: "LAY", link: "OVER", suffix: "CHARGE"))
        info.wordBank.append(Word(prefix: "LAY", link: "OVER", suffix: "COAT"))
        info.wordBank.append(Word(prefix: "LAY", link: "OVER", suffix: "COME"))
        info.wordBank.append(Word(prefix: "LAY", link: "OVER", suffix: "COMPENSATE"))
        info.wordBank.append(Word(prefix: "LAY", link: "OVER", suffix: "COOK"))
        
        info.wordBank.append(Word(prefix: "LAY", link: "OVER", suffix: "CROWD"))
        info.wordBank.append(Word(prefix: "LAY", link: "OVER", suffix: "DO"))
        info.wordBank.append(Word(prefix: "LAY", link: "OVER", suffix: "DOSE"))
        info.wordBank.append(Word(prefix: "LAY", link: "OVER", suffix: "DRAFT"))
        info.wordBank.append(Word(prefix: "LAY", link: "OVER", suffix: "DRESSED"))
        
        info.wordBank.append(Word(prefix: "LAY", link: "OVER", suffix: "DRIVE"))
        info.wordBank.append(Word(prefix: "LAY", link: "OVER", suffix: "DUE"))
        info.wordBank.append(Word(prefix: "LAY", link: "OVER", suffix: "EAGER"))
        info.wordBank.append(Word(prefix: "LAY", link: "OVER", suffix: "EAT"))
        info.wordBank.append(Word(prefix: "LAY", link: "OVER", suffix: "EXPOSED"))
        
        info.wordBank.append(Word(prefix: "LAY", link: "OVER", suffix: "FILL"))
        info.wordBank.append(Word(prefix: "LAY", link: "OVER", suffix: "FLOW"))
        info.wordBank.append(Word(prefix: "LAY", link: "OVER", suffix: "FULL"))
        info.wordBank.append(Word(prefix: "LAY", link: "OVER", suffix: "GROWN"))
        info.wordBank.append(Word(prefix: "LAY", link: "OVER", suffix: "HAND"))
        
        info.wordBank.append(Word(prefix: "LAY", link: "OVER", suffix: "HANG"))
        info.wordBank.append(Word(prefix: "LAY", link: "OVER", suffix: "HAUL"))
        info.wordBank.append(Word(prefix: "LAY", link: "OVER", suffix: "HEAD"))
        info.wordBank.append(Word(prefix: "LAY", link: "OVER", suffix: "HEAR"))
        info.wordBank.append(Word(prefix: "LAY", link: "OVER", suffix: "HEAT"))
        
        info.wordBank.append(Word(prefix: "LAY", link: "OVER", suffix: "KILL"))
        info.wordBank.append(Word(prefix: "LAY", link: "OVER", suffix: "LAND"))
        info.wordBank.append(Word(prefix: "LAY", link: "OVER", suffix: "LAP"))
        info.wordBank.append(Word(prefix: "LAY", link: "OVER", suffix: "LAY"))
        info.wordBank.append(Word(prefix: "LAY", link: "OVER", suffix: "LOAD"))
        
        info.wordBank.append(Word(prefix: "LAY", link: "OVER", suffix: "LOOK"))
        info.wordBank.append(Word(prefix: "LAY", link: "OVER", suffix: "LORD"))
        info.wordBank.append(Word(prefix: "LAY", link: "OVER", suffix: "LYING"))
        info.wordBank.append(Word(prefix: "LAY", link: "OVER", suffix: "NIGHT"))
        info.wordBank.append(Word(prefix: "LAY", link: "OVER", suffix: "PACK"))
        
        info.wordBank.append(Word(prefix: "LAY", link: "OVER", suffix: "PAID"))
        info.wordBank.append(Word(prefix: "LAY", link: "OVER", suffix: "PAY"))
        info.wordBank.append(Word(prefix: "LAY", link: "OVER", suffix: "POWER"))
        info.wordBank.append(Word(prefix: "LAY", link: "OVER", suffix: "RATE"))
        info.wordBank.append(Word(prefix: "LAY", link: "OVER", suffix: "REACH"))
        
        info.wordBank.append(Word(prefix: "LAY", link: "OVER", suffix: "REACT"))
        info.wordBank.append(Word(prefix: "LAY", link: "OVER", suffix: "RIDE"))
        info.wordBank.append(Word(prefix: "LAY", link: "OVER", suffix: "RULE"))
        info.wordBank.append(Word(prefix: "LAY", link: "OVER", suffix: "RUN"))
        info.wordBank.append(Word(prefix: "LAY", link: "OVER", suffix: "SEAS"))
        
        info.wordBank.append(Word(prefix: "LAY", link: "OVER", suffix: "SEER"))
        info.wordBank.append(Word(prefix: "LAY", link: "OVER", suffix: "SIGHT"))
        info.wordBank.append(Word(prefix: "LAY", link: "OVER", suffix: "SHOE"))
        info.wordBank.append(Word(prefix: "LAY", link: "OVER", suffix: "SLEEP"))
        info.wordBank.append(Word(prefix: "LAY", link: "OVER", suffix: "STATE"))
        
        info.wordBank.append(Word(prefix: "LAY", link: "OVER", suffix: "STRETCHED"))
        info.wordBank.append(Word(prefix: "LAY", link: "OVER", suffix: "TAKE"))
        info.wordBank.append(Word(prefix: "LAY", link: "OVER", suffix: "TAXED"))
        info.wordBank.append(Word(prefix: "LAY", link: "OVER", suffix: "THROW"))
        info.wordBank.append(Word(prefix: "LAY", link: "OVER", suffix: "TIME"))
        
        info.wordBank.append(Word(prefix: "LAY", link: "OVER", suffix: "TURN"))
        info.wordBank.append(Word(prefix: "LAY", link: "OVER", suffix: "USE"))
        info.wordBank.append(Word(prefix: "LAY", link: "OVER", suffix: "VALUE"))
        info.wordBank.append(Word(prefix: "LAY", link: "OVER", suffix: "VIEW"))
        info.wordBank.append(Word(prefix: "LAY", link: "OVER", suffix: "WEIGHT"))
        // over end
        
        // over start - MORE
        info.wordBank.append(Word(prefix: "MORE", link: "OVER", suffix: "ABUNDANT"))
        info.wordBank.append(Word(prefix: "MORE", link: "OVER", suffix: "ACHIEVE"))
        info.wordBank.append(Word(prefix: "MORE", link: "OVER", suffix: "ACT"))
        info.wordBank.append(Word(prefix: "MORE", link: "OVER", suffix: "ACTIVE"))
        info.wordBank.append(Word(prefix: "MORE", link: "OVER", suffix: "AGE"))
        
        info.wordBank.append(Word(prefix: "MORE", link: "OVER", suffix: "ALL"))
        info.wordBank.append(Word(prefix: "MORE", link: "OVER", suffix: "ALLS"))
        info.wordBank.append(Word(prefix: "MORE", link: "OVER", suffix: "ARCHING"))
        info.wordBank.append(Word(prefix: "MORE", link: "OVER", suffix: "BEARING"))
        info.wordBank.append(Word(prefix: "MORE", link: "OVER", suffix: "BITE"))
        
        info.wordBank.append(Word(prefix: "MORE", link: "OVER", suffix: "BLOWN"))
        info.wordBank.append(Word(prefix: "MORE", link: "OVER", suffix: "BOARD"))
        info.wordBank.append(Word(prefix: "MORE", link: "OVER", suffix: "BOOKED"))
        info.wordBank.append(Word(prefix: "MORE", link: "OVER", suffix: "BURDEN"))
        info.wordBank.append(Word(prefix: "MORE", link: "OVER", suffix: "CAST"))
        
        info.wordBank.append(Word(prefix: "MORE", link: "OVER", suffix: "CHARGE"))
        info.wordBank.append(Word(prefix: "MORE", link: "OVER", suffix: "COAT"))
        info.wordBank.append(Word(prefix: "MORE", link: "OVER", suffix: "COME"))
        info.wordBank.append(Word(prefix: "MORE", link: "OVER", suffix: "COMPENSATE"))
        info.wordBank.append(Word(prefix: "MORE", link: "OVER", suffix: "COOK"))
        
        info.wordBank.append(Word(prefix: "MORE", link: "OVER", suffix: "CROWD"))
        info.wordBank.append(Word(prefix: "MORE", link: "OVER", suffix: "DO"))
        info.wordBank.append(Word(prefix: "MORE", link: "OVER", suffix: "DOSE"))
        info.wordBank.append(Word(prefix: "MORE", link: "OVER", suffix: "DRAFT"))
        info.wordBank.append(Word(prefix: "MORE", link: "OVER", suffix: "DRESSED"))
        
        info.wordBank.append(Word(prefix: "MORE", link: "OVER", suffix: "DRIVE"))
        info.wordBank.append(Word(prefix: "MORE", link: "OVER", suffix: "DUE"))
        info.wordBank.append(Word(prefix: "MORE", link: "OVER", suffix: "EAGER"))
        info.wordBank.append(Word(prefix: "MORE", link: "OVER", suffix: "EAT"))
        info.wordBank.append(Word(prefix: "MORE", link: "OVER", suffix: "EXPOSED"))
        
        info.wordBank.append(Word(prefix: "MORE", link: "OVER", suffix: "FILL"))
        info.wordBank.append(Word(prefix: "MORE", link: "OVER", suffix: "FLOW"))
        info.wordBank.append(Word(prefix: "MORE", link: "OVER", suffix: "FULL"))
        info.wordBank.append(Word(prefix: "MORE", link: "OVER", suffix: "GROWN"))
        info.wordBank.append(Word(prefix: "MORE", link: "OVER", suffix: "HAND"))
        
        info.wordBank.append(Word(prefix: "MORE", link: "OVER", suffix: "HANG"))
        info.wordBank.append(Word(prefix: "MORE", link: "OVER", suffix: "HAUL"))
        info.wordBank.append(Word(prefix: "MORE", link: "OVER", suffix: "HEAD"))
        info.wordBank.append(Word(prefix: "MORE", link: "OVER", suffix: "HEAR"))
        info.wordBank.append(Word(prefix: "MORE", link: "OVER", suffix: "HEAT"))
        
        info.wordBank.append(Word(prefix: "MORE", link: "OVER", suffix: "KILL"))
        info.wordBank.append(Word(prefix: "MORE", link: "OVER", suffix: "LAND"))
        info.wordBank.append(Word(prefix: "MORE", link: "OVER", suffix: "LAP"))
        info.wordBank.append(Word(prefix: "MORE", link: "OVER", suffix: "LAY"))
        info.wordBank.append(Word(prefix: "MORE", link: "OVER", suffix: "LOAD"))
        
        info.wordBank.append(Word(prefix: "MORE", link: "OVER", suffix: "LOOK"))
        info.wordBank.append(Word(prefix: "MORE", link: "OVER", suffix: "LORD"))
        info.wordBank.append(Word(prefix: "MORE", link: "OVER", suffix: "LYING"))
        info.wordBank.append(Word(prefix: "MORE", link: "OVER", suffix: "NIGHT"))
        info.wordBank.append(Word(prefix: "MORE", link: "OVER", suffix: "PACK"))
        
        info.wordBank.append(Word(prefix: "MORE", link: "OVER", suffix: "PAID"))
        info.wordBank.append(Word(prefix: "MORE", link: "OVER", suffix: "PAY"))
        info.wordBank.append(Word(prefix: "MORE", link: "OVER", suffix: "POWER"))
        info.wordBank.append(Word(prefix: "MORE", link: "OVER", suffix: "RATE"))
        info.wordBank.append(Word(prefix: "MORE", link: "OVER", suffix: "REACH"))
        
        info.wordBank.append(Word(prefix: "MORE", link: "OVER", suffix: "REACT"))
        info.wordBank.append(Word(prefix: "MORE", link: "OVER", suffix: "RIDE"))
        info.wordBank.append(Word(prefix: "MORE", link: "OVER", suffix: "RULE"))
        info.wordBank.append(Word(prefix: "MORE", link: "OVER", suffix: "RUN"))
        info.wordBank.append(Word(prefix: "MORE", link: "OVER", suffix: "SEAS"))
        
        info.wordBank.append(Word(prefix: "MORE", link: "OVER", suffix: "SEER"))
        info.wordBank.append(Word(prefix: "MORE", link: "OVER", suffix: "SIGHT"))
        info.wordBank.append(Word(prefix: "MORE", link: "OVER", suffix: "SHOE"))
        info.wordBank.append(Word(prefix: "MORE", link: "OVER", suffix: "SLEEP"))
        info.wordBank.append(Word(prefix: "MORE", link: "OVER", suffix: "STATE"))
        
        info.wordBank.append(Word(prefix: "MORE", link: "OVER", suffix: "STRETCHED"))
        info.wordBank.append(Word(prefix: "MORE", link: "OVER", suffix: "TAKE"))
        info.wordBank.append(Word(prefix: "MORE", link: "OVER", suffix: "TAXED"))
        info.wordBank.append(Word(prefix: "MORE", link: "OVER", suffix: "THROW"))
        info.wordBank.append(Word(prefix: "MORE", link: "OVER", suffix: "TIME"))
        
        info.wordBank.append(Word(prefix: "MORE", link: "OVER", suffix: "TURN"))
        info.wordBank.append(Word(prefix: "MORE", link: "OVER", suffix: "USE"))
        info.wordBank.append(Word(prefix: "MORE", link: "OVER", suffix: "VALUE"))
        info.wordBank.append(Word(prefix: "MORE", link: "OVER", suffix: "VIEW"))
        info.wordBank.append(Word(prefix: "MORE", link: "OVER", suffix: "WEIGHT"))
        // over end
        
        // over start - POP
        info.wordBank.append(Word(prefix: "POP", link: "OVER", suffix: "ABUNDANT"))
        info.wordBank.append(Word(prefix: "POP", link: "OVER", suffix: "ACHIEVE"))
        info.wordBank.append(Word(prefix: "POP", link: "OVER", suffix: "ACT"))
        info.wordBank.append(Word(prefix: "POP", link: "OVER", suffix: "ACTIVE"))
        info.wordBank.append(Word(prefix: "POP", link: "OVER", suffix: "AGE"))
        
        info.wordBank.append(Word(prefix: "POP", link: "OVER", suffix: "ALL"))
        info.wordBank.append(Word(prefix: "POP", link: "OVER", suffix: "ALLS"))
        info.wordBank.append(Word(prefix: "POP", link: "OVER", suffix: "ARCHING"))
        info.wordBank.append(Word(prefix: "POP", link: "OVER", suffix: "BEARING"))
        info.wordBank.append(Word(prefix: "POP", link: "OVER", suffix: "BITE"))
        
        info.wordBank.append(Word(prefix: "POP", link: "OVER", suffix: "BLOWN"))
        info.wordBank.append(Word(prefix: "POP", link: "OVER", suffix: "BOARD"))
        info.wordBank.append(Word(prefix: "POP", link: "OVER", suffix: "BOOKED"))
        info.wordBank.append(Word(prefix: "POP", link: "OVER", suffix: "BURDEN"))
        info.wordBank.append(Word(prefix: "POP", link: "OVER", suffix: "CAST"))
        
        info.wordBank.append(Word(prefix: "POP", link: "OVER", suffix: "CHARGE"))
        info.wordBank.append(Word(prefix: "POP", link: "OVER", suffix: "COAT"))
        info.wordBank.append(Word(prefix: "POP", link: "OVER", suffix: "COME"))
        info.wordBank.append(Word(prefix: "POP", link: "OVER", suffix: "COMPENSATE"))
        info.wordBank.append(Word(prefix: "POP", link: "OVER", suffix: "COOK"))
        
        info.wordBank.append(Word(prefix: "POP", link: "OVER", suffix: "CROWD"))
        info.wordBank.append(Word(prefix: "POP", link: "OVER", suffix: "DO"))
        info.wordBank.append(Word(prefix: "POP", link: "OVER", suffix: "DOSE"))
        info.wordBank.append(Word(prefix: "POP", link: "OVER", suffix: "DRAFT"))
        info.wordBank.append(Word(prefix: "POP", link: "OVER", suffix: "DRESSED"))
        
        info.wordBank.append(Word(prefix: "POP", link: "OVER", suffix: "DRIVE"))
        info.wordBank.append(Word(prefix: "POP", link: "OVER", suffix: "DUE"))
        info.wordBank.append(Word(prefix: "POP", link: "OVER", suffix: "EAGER"))
        info.wordBank.append(Word(prefix: "POP", link: "OVER", suffix: "EAT"))
        info.wordBank.append(Word(prefix: "POP", link: "OVER", suffix: "EXPOSED"))
        
        info.wordBank.append(Word(prefix: "POP", link: "OVER", suffix: "FILL"))
        info.wordBank.append(Word(prefix: "POP", link: "OVER", suffix: "FLOW"))
        info.wordBank.append(Word(prefix: "POP", link: "OVER", suffix: "FULL"))
        info.wordBank.append(Word(prefix: "POP", link: "OVER", suffix: "GROWN"))
        info.wordBank.append(Word(prefix: "POP", link: "OVER", suffix: "HAND"))
        
        info.wordBank.append(Word(prefix: "POP", link: "OVER", suffix: "HANG"))
        info.wordBank.append(Word(prefix: "POP", link: "OVER", suffix: "HAUL"))
        info.wordBank.append(Word(prefix: "POP", link: "OVER", suffix: "HEAD"))
        info.wordBank.append(Word(prefix: "POP", link: "OVER", suffix: "HEAR"))
        info.wordBank.append(Word(prefix: "POP", link: "OVER", suffix: "HEAT"))
        
        info.wordBank.append(Word(prefix: "POP", link: "OVER", suffix: "KILL"))
        info.wordBank.append(Word(prefix: "POP", link: "OVER", suffix: "LAND"))
        info.wordBank.append(Word(prefix: "POP", link: "OVER", suffix: "LAP"))
        info.wordBank.append(Word(prefix: "POP", link: "OVER", suffix: "LAY"))
        info.wordBank.append(Word(prefix: "POP", link: "OVER", suffix: "LOAD"))
        
        info.wordBank.append(Word(prefix: "POP", link: "OVER", suffix: "LOOK"))
        info.wordBank.append(Word(prefix: "POP", link: "OVER", suffix: "LORD"))
        info.wordBank.append(Word(prefix: "POP", link: "OVER", suffix: "LYING"))
        info.wordBank.append(Word(prefix: "POP", link: "OVER", suffix: "NIGHT"))
        info.wordBank.append(Word(prefix: "POP", link: "OVER", suffix: "PACK"))
        
        info.wordBank.append(Word(prefix: "POP", link: "OVER", suffix: "PAID"))
        info.wordBank.append(Word(prefix: "POP", link: "OVER", suffix: "PAY"))
        info.wordBank.append(Word(prefix: "POP", link: "OVER", suffix: "POWER"))
        info.wordBank.append(Word(prefix: "POP", link: "OVER", suffix: "RATE"))
        info.wordBank.append(Word(prefix: "POP", link: "OVER", suffix: "REACH"))
        
        info.wordBank.append(Word(prefix: "POP", link: "OVER", suffix: "REACT"))
        info.wordBank.append(Word(prefix: "POP", link: "OVER", suffix: "RIDE"))
        info.wordBank.append(Word(prefix: "POP", link: "OVER", suffix: "RULE"))
        info.wordBank.append(Word(prefix: "POP", link: "OVER", suffix: "RUN"))
        info.wordBank.append(Word(prefix: "POP", link: "OVER", suffix: "SEAS"))
        
        info.wordBank.append(Word(prefix: "POP", link: "OVER", suffix: "SEER"))
        info.wordBank.append(Word(prefix: "POP", link: "OVER", suffix: "SIGHT"))
        info.wordBank.append(Word(prefix: "POP", link: "OVER", suffix: "SHOE"))
        info.wordBank.append(Word(prefix: "POP", link: "OVER", suffix: "SLEEP"))
        info.wordBank.append(Word(prefix: "POP", link: "OVER", suffix: "STATE"))
        
        info.wordBank.append(Word(prefix: "POP", link: "OVER", suffix: "STRETCHED"))
        info.wordBank.append(Word(prefix: "POP", link: "OVER", suffix: "TAKE"))
        info.wordBank.append(Word(prefix: "POP", link: "OVER", suffix: "TAXED"))
        info.wordBank.append(Word(prefix: "POP", link: "OVER", suffix: "THROW"))
        info.wordBank.append(Word(prefix: "POP", link: "OVER", suffix: "TIME"))
        
        info.wordBank.append(Word(prefix: "POP", link: "OVER", suffix: "TURN"))
        info.wordBank.append(Word(prefix: "POP", link: "OVER", suffix: "USE"))
        info.wordBank.append(Word(prefix: "POP", link: "OVER", suffix: "VALUE"))
        info.wordBank.append(Word(prefix: "POP", link: "OVER", suffix: "VIEW"))
        info.wordBank.append(Word(prefix: "POP", link: "OVER", suffix: "WEIGHT"))
        // over end
        
        // over start - PULL
        info.wordBank.append(Word(prefix: "PULL", link: "OVER", suffix: "ABUNDANT"))
        info.wordBank.append(Word(prefix: "PULL", link: "OVER", suffix: "ACHIEVE"))
        info.wordBank.append(Word(prefix: "PULL", link: "OVER", suffix: "ACT"))
        info.wordBank.append(Word(prefix: "PULL", link: "OVER", suffix: "ACTIVE"))
        info.wordBank.append(Word(prefix: "PULL", link: "OVER", suffix: "AGE"))
        
        info.wordBank.append(Word(prefix: "PULL", link: "OVER", suffix: "ALL"))
        info.wordBank.append(Word(prefix: "PULL", link: "OVER", suffix: "ALLS"))
        info.wordBank.append(Word(prefix: "PULL", link: "OVER", suffix: "ARCHING"))
        info.wordBank.append(Word(prefix: "PULL", link: "OVER", suffix: "BEARING"))
        info.wordBank.append(Word(prefix: "PULL", link: "OVER", suffix: "BITE"))
        
        info.wordBank.append(Word(prefix: "PULL", link: "OVER", suffix: "BLOWN"))
        info.wordBank.append(Word(prefix: "PULL", link: "OVER", suffix: "BOARD"))
        info.wordBank.append(Word(prefix: "PULL", link: "OVER", suffix: "BOOKED"))
        info.wordBank.append(Word(prefix: "PULL", link: "OVER", suffix: "BURDEN"))
        info.wordBank.append(Word(prefix: "PULL", link: "OVER", suffix: "CAST"))
        
        info.wordBank.append(Word(prefix: "PULL", link: "OVER", suffix: "CHARGE"))
        info.wordBank.append(Word(prefix: "PULL", link: "OVER", suffix: "COAT"))
        info.wordBank.append(Word(prefix: "PULL", link: "OVER", suffix: "COME"))
        info.wordBank.append(Word(prefix: "PULL", link: "OVER", suffix: "COMPENSATE"))
        info.wordBank.append(Word(prefix: "PULL", link: "OVER", suffix: "COOK"))
        
        info.wordBank.append(Word(prefix: "PULL", link: "OVER", suffix: "CROWD"))
        info.wordBank.append(Word(prefix: "PULL", link: "OVER", suffix: "DO"))
        info.wordBank.append(Word(prefix: "PULL", link: "OVER", suffix: "DOSE"))
        info.wordBank.append(Word(prefix: "PULL", link: "OVER", suffix: "DRAFT"))
        info.wordBank.append(Word(prefix: "PULL", link: "OVER", suffix: "DRESSED"))
        
        info.wordBank.append(Word(prefix: "PULL", link: "OVER", suffix: "DRIVE"))
        info.wordBank.append(Word(prefix: "PULL", link: "OVER", suffix: "DUE"))
        info.wordBank.append(Word(prefix: "PULL", link: "OVER", suffix: "EAGER"))
        info.wordBank.append(Word(prefix: "PULL", link: "OVER", suffix: "EAT"))
        info.wordBank.append(Word(prefix: "PULL", link: "OVER", suffix: "EXPOSED"))
        
        info.wordBank.append(Word(prefix: "PULL", link: "OVER", suffix: "FILL"))
        info.wordBank.append(Word(prefix: "PULL", link: "OVER", suffix: "FLOW"))
        info.wordBank.append(Word(prefix: "PULL", link: "OVER", suffix: "FULL"))
        info.wordBank.append(Word(prefix: "PULL", link: "OVER", suffix: "GROWN"))
        info.wordBank.append(Word(prefix: "PULL", link: "OVER", suffix: "HAND"))
        
        info.wordBank.append(Word(prefix: "PULL", link: "OVER", suffix: "HANG"))
        info.wordBank.append(Word(prefix: "PULL", link: "OVER", suffix: "HAUL"))
        info.wordBank.append(Word(prefix: "PULL", link: "OVER", suffix: "HEAD"))
        info.wordBank.append(Word(prefix: "PULL", link: "OVER", suffix: "HEAR"))
        info.wordBank.append(Word(prefix: "PULL", link: "OVER", suffix: "HEAT"))
        
        info.wordBank.append(Word(prefix: "PULL", link: "OVER", suffix: "KILL"))
        info.wordBank.append(Word(prefix: "PULL", link: "OVER", suffix: "LAND"))
        info.wordBank.append(Word(prefix: "PULL", link: "OVER", suffix: "LAP"))
        info.wordBank.append(Word(prefix: "PULL", link: "OVER", suffix: "LAY"))
        info.wordBank.append(Word(prefix: "PULL", link: "OVER", suffix: "LOAD"))
        
        info.wordBank.append(Word(prefix: "PULL", link: "OVER", suffix: "LOOK"))
        info.wordBank.append(Word(prefix: "PULL", link: "OVER", suffix: "LORD"))
        info.wordBank.append(Word(prefix: "PULL", link: "OVER", suffix: "LYING"))
        info.wordBank.append(Word(prefix: "PULL", link: "OVER", suffix: "NIGHT"))
        info.wordBank.append(Word(prefix: "PULL", link: "OVER", suffix: "PACK"))
        
        info.wordBank.append(Word(prefix: "PULL", link: "OVER", suffix: "PAID"))
        info.wordBank.append(Word(prefix: "PULL", link: "OVER", suffix: "PAY"))
        info.wordBank.append(Word(prefix: "PULL", link: "OVER", suffix: "POWER"))
        info.wordBank.append(Word(prefix: "PULL", link: "OVER", suffix: "RATE"))
        info.wordBank.append(Word(prefix: "PULL", link: "OVER", suffix: "REACH"))
        
        info.wordBank.append(Word(prefix: "PULL", link: "OVER", suffix: "REACT"))
        info.wordBank.append(Word(prefix: "PULL", link: "OVER", suffix: "RIDE"))
        info.wordBank.append(Word(prefix: "PULL", link: "OVER", suffix: "RULE"))
        info.wordBank.append(Word(prefix: "PULL", link: "OVER", suffix: "RUN"))
        info.wordBank.append(Word(prefix: "PULL", link: "OVER", suffix: "SEAS"))
        
        info.wordBank.append(Word(prefix: "PULL", link: "OVER", suffix: "SEER"))
        info.wordBank.append(Word(prefix: "PULL", link: "OVER", suffix: "SIGHT"))
        info.wordBank.append(Word(prefix: "PULL", link: "OVER", suffix: "SHOE"))
        info.wordBank.append(Word(prefix: "PULL", link: "OVER", suffix: "SLEEP"))
        info.wordBank.append(Word(prefix: "PULL", link: "OVER", suffix: "STATE"))
        
        info.wordBank.append(Word(prefix: "PULL", link: "OVER", suffix: "STRETCHED"))
        info.wordBank.append(Word(prefix: "PULL", link: "OVER", suffix: "TAKE"))
        info.wordBank.append(Word(prefix: "PULL", link: "OVER", suffix: "TAXED"))
        info.wordBank.append(Word(prefix: "PULL", link: "OVER", suffix: "THROW"))
        info.wordBank.append(Word(prefix: "PULL", link: "OVER", suffix: "TIME"))
        
        info.wordBank.append(Word(prefix: "PULL", link: "OVER", suffix: "TURN"))
        info.wordBank.append(Word(prefix: "PULL", link: "OVER", suffix: "USE"))
        info.wordBank.append(Word(prefix: "PULL", link: "OVER", suffix: "VALUE"))
        info.wordBank.append(Word(prefix: "PULL", link: "OVER", suffix: "VIEW"))
        info.wordBank.append(Word(prefix: "PULL", link: "OVER", suffix: "WEIGHT"))
        // over end
        
        // over start - PUSH
        info.wordBank.append(Word(prefix: "PUSH", link: "OVER", suffix: "ABUNDANT"))
        info.wordBank.append(Word(prefix: "*", link: "OVER", suffix: "ACHIEVE"))
        info.wordBank.append(Word(prefix: "*", link: "OVER", suffix: "ACT"))
        info.wordBank.append(Word(prefix: "*", link: "OVER", suffix: "ACTIVE"))
        info.wordBank.append(Word(prefix: "*", link: "OVER", suffix: "AGE"))
        
        info.wordBank.append(Word(prefix: "*", link: "OVER", suffix: "ALL"))
        info.wordBank.append(Word(prefix: "*", link: "OVER", suffix: "ALLS"))
        info.wordBank.append(Word(prefix: "*", link: "OVER", suffix: "ARCHING"))
        info.wordBank.append(Word(prefix: "*", link: "OVER", suffix: "BEARING"))
        info.wordBank.append(Word(prefix: "*", link: "OVER", suffix: "BITE"))
        
        info.wordBank.append(Word(prefix: "*", link: "OVER", suffix: "BLOWN"))
        info.wordBank.append(Word(prefix: "*", link: "OVER", suffix: "BOARD"))
        info.wordBank.append(Word(prefix: "*", link: "OVER", suffix: "BOOKED"))
        info.wordBank.append(Word(prefix: "*", link: "OVER", suffix: "BURDEN"))
        info.wordBank.append(Word(prefix: "*", link: "OVER", suffix: "CAST"))
        
        info.wordBank.append(Word(prefix: "*", link: "OVER", suffix: "CHARGE"))
        info.wordBank.append(Word(prefix: "*", link: "OVER", suffix: "COAT"))
        info.wordBank.append(Word(prefix: "*", link: "OVER", suffix: "COME"))
        info.wordBank.append(Word(prefix: "*", link: "OVER", suffix: "COMPENSATE"))
        info.wordBank.append(Word(prefix: "*", link: "OVER", suffix: "COOK"))
        
        info.wordBank.append(Word(prefix: "*", link: "OVER", suffix: "CROWD"))
        info.wordBank.append(Word(prefix: "*", link: "OVER", suffix: "DO"))
        info.wordBank.append(Word(prefix: "*", link: "OVER", suffix: "DOSE"))
        info.wordBank.append(Word(prefix: "*", link: "OVER", suffix: "DRAFT"))
        info.wordBank.append(Word(prefix: "*", link: "OVER", suffix: "DRESSED"))
        
        info.wordBank.append(Word(prefix: "*", link: "OVER", suffix: "DRIVE"))
        info.wordBank.append(Word(prefix: "*", link: "OVER", suffix: "DUE"))
        info.wordBank.append(Word(prefix: "*", link: "OVER", suffix: "EAGER"))
        info.wordBank.append(Word(prefix: "*", link: "OVER", suffix: "EAT"))
        info.wordBank.append(Word(prefix: "*", link: "OVER", suffix: "EXPOSED"))
        
        info.wordBank.append(Word(prefix: "*", link: "OVER", suffix: "FILL"))
        info.wordBank.append(Word(prefix: "*", link: "OVER", suffix: "FLOW"))
        info.wordBank.append(Word(prefix: "*", link: "OVER", suffix: "FULL"))
        info.wordBank.append(Word(prefix: "*", link: "OVER", suffix: "GROWN"))
        info.wordBank.append(Word(prefix: "*", link: "OVER", suffix: "HAND"))
        
        info.wordBank.append(Word(prefix: "*", link: "OVER", suffix: "HANG"))
        info.wordBank.append(Word(prefix: "*", link: "OVER", suffix: "HAUL"))
        info.wordBank.append(Word(prefix: "*", link: "OVER", suffix: "HEAD"))
        info.wordBank.append(Word(prefix: "*", link: "OVER", suffix: "HEAR"))
        info.wordBank.append(Word(prefix: "*", link: "OVER", suffix: "HEAT"))
        
        info.wordBank.append(Word(prefix: "*", link: "OVER", suffix: "KILL"))
        info.wordBank.append(Word(prefix: "*", link: "OVER", suffix: "LAND"))
        info.wordBank.append(Word(prefix: "*", link: "OVER", suffix: "LAP"))
        info.wordBank.append(Word(prefix: "*", link: "OVER", suffix: "LAY"))
        info.wordBank.append(Word(prefix: "*", link: "OVER", suffix: "LOAD"))
        
        info.wordBank.append(Word(prefix: "*", link: "OVER", suffix: "LOOK"))
        info.wordBank.append(Word(prefix: "*", link: "OVER", suffix: "LORD"))
        info.wordBank.append(Word(prefix: "*", link: "OVER", suffix: "LYING"))
        info.wordBank.append(Word(prefix: "*", link: "OVER", suffix: "NIGHT"))
        info.wordBank.append(Word(prefix: "*", link: "OVER", suffix: "PACK"))
        
        info.wordBank.append(Word(prefix: "*", link: "OVER", suffix: "PAID"))
        info.wordBank.append(Word(prefix: "*", link: "OVER", suffix: "PAY"))
        info.wordBank.append(Word(prefix: "*", link: "OVER", suffix: "POWER"))
        info.wordBank.append(Word(prefix: "*", link: "OVER", suffix: "RATE"))
        info.wordBank.append(Word(prefix: "*", link: "OVER", suffix: "REACH"))
        
        info.wordBank.append(Word(prefix: "*", link: "OVER", suffix: "REACT"))
        info.wordBank.append(Word(prefix: "*", link: "OVER", suffix: "RIDE"))
        info.wordBank.append(Word(prefix: "*", link: "OVER", suffix: "RULE"))
        info.wordBank.append(Word(prefix: "*", link: "OVER", suffix: "RUN"))
        info.wordBank.append(Word(prefix: "*", link: "OVER", suffix: "SEAS"))
        
        info.wordBank.append(Word(prefix: "*", link: "OVER", suffix: "SEER"))
        info.wordBank.append(Word(prefix: "*", link: "OVER", suffix: "SIGHT"))
        info.wordBank.append(Word(prefix: "*", link: "OVER", suffix: "SHOE"))
        info.wordBank.append(Word(prefix: "*", link: "OVER", suffix: "SLEEP"))
        info.wordBank.append(Word(prefix: "*", link: "OVER", suffix: "STATE"))
        
        info.wordBank.append(Word(prefix: "*", link: "OVER", suffix: "STRETCHED"))
        info.wordBank.append(Word(prefix: "*", link: "OVER", suffix: "TAKE"))
        info.wordBank.append(Word(prefix: "*", link: "OVER", suffix: "TAXED"))
        info.wordBank.append(Word(prefix: "*", link: "OVER", suffix: "THROW"))
        info.wordBank.append(Word(prefix: "*", link: "OVER", suffix: "TIME"))
        
        info.wordBank.append(Word(prefix: "*", link: "OVER", suffix: "TURN"))
        info.wordBank.append(Word(prefix: "*", link: "OVER", suffix: "USE"))
        info.wordBank.append(Word(prefix: "*", link: "OVER", suffix: "VALUE"))
        info.wordBank.append(Word(prefix: "*", link: "OVER", suffix: "VIEW"))
        info.wordBank.append(Word(prefix: "*", link: "OVER", suffix: "WEIGHT"))
        // over end
        
        // over start - TAKE
        info.wordBank.append(Word(prefix: "TAKE", link: "OVER", suffix: "ABUNDANT"))
        info.wordBank.append(Word(prefix: "*", link: "OVER", suffix: "ACHIEVE"))
        info.wordBank.append(Word(prefix: "*", link: "OVER", suffix: "ACT"))
        info.wordBank.append(Word(prefix: "*", link: "OVER", suffix: "ACTIVE"))
        info.wordBank.append(Word(prefix: "*", link: "OVER", suffix: "AGE"))
        
        info.wordBank.append(Word(prefix: "*", link: "OVER", suffix: "ALL"))
        info.wordBank.append(Word(prefix: "*", link: "OVER", suffix: "ALLS"))
        info.wordBank.append(Word(prefix: "*", link: "OVER", suffix: "ARCHING"))
        info.wordBank.append(Word(prefix: "*", link: "OVER", suffix: "BEARING"))
        info.wordBank.append(Word(prefix: "*", link: "OVER", suffix: "BITE"))
        
        info.wordBank.append(Word(prefix: "*", link: "OVER", suffix: "BLOWN"))
        info.wordBank.append(Word(prefix: "*", link: "OVER", suffix: "BOARD"))
        info.wordBank.append(Word(prefix: "*", link: "OVER", suffix: "BOOKED"))
        info.wordBank.append(Word(prefix: "*", link: "OVER", suffix: "BURDEN"))
        info.wordBank.append(Word(prefix: "*", link: "OVER", suffix: "CAST"))
        
        info.wordBank.append(Word(prefix: "*", link: "OVER", suffix: "CHARGE"))
        info.wordBank.append(Word(prefix: "*", link: "OVER", suffix: "COAT"))
        info.wordBank.append(Word(prefix: "*", link: "OVER", suffix: "COME"))
        info.wordBank.append(Word(prefix: "*", link: "OVER", suffix: "COMPENSATE"))
        info.wordBank.append(Word(prefix: "*", link: "OVER", suffix: "COOK"))
        
        info.wordBank.append(Word(prefix: "*", link: "OVER", suffix: "CROWD"))
        info.wordBank.append(Word(prefix: "*", link: "OVER", suffix: "DO"))
        info.wordBank.append(Word(prefix: "*", link: "OVER", suffix: "DOSE"))
        info.wordBank.append(Word(prefix: "*", link: "OVER", suffix: "DRAFT"))
        info.wordBank.append(Word(prefix: "*", link: "OVER", suffix: "DRESSED"))
        
        info.wordBank.append(Word(prefix: "*", link: "OVER", suffix: "DRIVE"))
        info.wordBank.append(Word(prefix: "*", link: "OVER", suffix: "DUE"))
        info.wordBank.append(Word(prefix: "*", link: "OVER", suffix: "EAGER"))
        info.wordBank.append(Word(prefix: "*", link: "OVER", suffix: "EAT"))
        info.wordBank.append(Word(prefix: "*", link: "OVER", suffix: "EXPOSED"))
        
        info.wordBank.append(Word(prefix: "*", link: "OVER", suffix: "FILL"))
        info.wordBank.append(Word(prefix: "*", link: "OVER", suffix: "FLOW"))
        info.wordBank.append(Word(prefix: "*", link: "OVER", suffix: "FULL"))
        info.wordBank.append(Word(prefix: "*", link: "OVER", suffix: "GROWN"))
        info.wordBank.append(Word(prefix: "*", link: "OVER", suffix: "HAND"))
        
        info.wordBank.append(Word(prefix: "*", link: "OVER", suffix: "HANG"))
        info.wordBank.append(Word(prefix: "*", link: "OVER", suffix: "HAUL"))
        info.wordBank.append(Word(prefix: "*", link: "OVER", suffix: "HEAD"))
        info.wordBank.append(Word(prefix: "*", link: "OVER", suffix: "HEAR"))
        info.wordBank.append(Word(prefix: "*", link: "OVER", suffix: "HEAT"))
        
        info.wordBank.append(Word(prefix: "*", link: "OVER", suffix: "KILL"))
        info.wordBank.append(Word(prefix: "*", link: "OVER", suffix: "LAND"))
        info.wordBank.append(Word(prefix: "*", link: "OVER", suffix: "LAP"))
        info.wordBank.append(Word(prefix: "*", link: "OVER", suffix: "LAY"))
        info.wordBank.append(Word(prefix: "*", link: "OVER", suffix: "LOAD"))
        
        info.wordBank.append(Word(prefix: "*", link: "OVER", suffix: "LOOK"))
        info.wordBank.append(Word(prefix: "*", link: "OVER", suffix: "LORD"))
        info.wordBank.append(Word(prefix: "*", link: "OVER", suffix: "LYING"))
        info.wordBank.append(Word(prefix: "*", link: "OVER", suffix: "NIGHT"))
        info.wordBank.append(Word(prefix: "*", link: "OVER", suffix: "PACK"))
        
        info.wordBank.append(Word(prefix: "*", link: "OVER", suffix: "PAID"))
        info.wordBank.append(Word(prefix: "*", link: "OVER", suffix: "PAY"))
        info.wordBank.append(Word(prefix: "*", link: "OVER", suffix: "POWER"))
        info.wordBank.append(Word(prefix: "*", link: "OVER", suffix: "RATE"))
        info.wordBank.append(Word(prefix: "*", link: "OVER", suffix: "REACH"))
        
        info.wordBank.append(Word(prefix: "*", link: "OVER", suffix: "REACT"))
        info.wordBank.append(Word(prefix: "*", link: "OVER", suffix: "RIDE"))
        info.wordBank.append(Word(prefix: "*", link: "OVER", suffix: "RULE"))
        info.wordBank.append(Word(prefix: "*", link: "OVER", suffix: "RUN"))
        info.wordBank.append(Word(prefix: "*", link: "OVER", suffix: "SEAS"))
        
        info.wordBank.append(Word(prefix: "*", link: "OVER", suffix: "SEER"))
        info.wordBank.append(Word(prefix: "*", link: "OVER", suffix: "SIGHT"))
        info.wordBank.append(Word(prefix: "*", link: "OVER", suffix: "SHOE"))
        info.wordBank.append(Word(prefix: "*", link: "OVER", suffix: "SLEEP"))
        info.wordBank.append(Word(prefix: "*", link: "OVER", suffix: "STATE"))
        
        info.wordBank.append(Word(prefix: "*", link: "OVER", suffix: "STRETCHED"))
        info.wordBank.append(Word(prefix: "*", link: "OVER", suffix: "TAKE"))
        info.wordBank.append(Word(prefix: "*", link: "OVER", suffix: "TAXED"))
        info.wordBank.append(Word(prefix: "*", link: "OVER", suffix: "THROW"))
        info.wordBank.append(Word(prefix: "*", link: "OVER", suffix: "TIME"))
        
        info.wordBank.append(Word(prefix: "*", link: "OVER", suffix: "TURN"))
        info.wordBank.append(Word(prefix: "*", link: "OVER", suffix: "USE"))
        info.wordBank.append(Word(prefix: "*", link: "OVER", suffix: "VALUE"))
        info.wordBank.append(Word(prefix: "*", link: "OVER", suffix: "VIEW"))
        info.wordBank.append(Word(prefix: "*", link: "OVER", suffix: "WEIGHT"))
        // over end
        
        // over start - TURN
        info.wordBank.append(Word(prefix: "TURN", link: "OVER", suffix: "ABUNDANT"))
        info.wordBank.append(Word(prefix: "*", link: "OVER", suffix: "ACHIEVE"))
        info.wordBank.append(Word(prefix: "*", link: "OVER", suffix: "ACT"))
        info.wordBank.append(Word(prefix: "*", link: "OVER", suffix: "ACTIVE"))
        info.wordBank.append(Word(prefix: "*", link: "OVER", suffix: "AGE"))
        
        info.wordBank.append(Word(prefix: "*", link: "OVER", suffix: "ALL"))
        info.wordBank.append(Word(prefix: "*", link: "OVER", suffix: "ALLS"))
        info.wordBank.append(Word(prefix: "*", link: "OVER", suffix: "ARCHING"))
        info.wordBank.append(Word(prefix: "*", link: "OVER", suffix: "BEARING"))
        info.wordBank.append(Word(prefix: "*", link: "OVER", suffix: "BITE"))
        
        info.wordBank.append(Word(prefix: "*", link: "OVER", suffix: "BLOWN"))
        info.wordBank.append(Word(prefix: "*", link: "OVER", suffix: "BOARD"))
        info.wordBank.append(Word(prefix: "*", link: "OVER", suffix: "BOOKED"))
        info.wordBank.append(Word(prefix: "*", link: "OVER", suffix: "BURDEN"))
        info.wordBank.append(Word(prefix: "*", link: "OVER", suffix: "CAST"))
        
        info.wordBank.append(Word(prefix: "*", link: "OVER", suffix: "CHARGE"))
        info.wordBank.append(Word(prefix: "*", link: "OVER", suffix: "COAT"))
        info.wordBank.append(Word(prefix: "*", link: "OVER", suffix: "COME"))
        info.wordBank.append(Word(prefix: "*", link: "OVER", suffix: "COMPENSATE"))
        info.wordBank.append(Word(prefix: "*", link: "OVER", suffix: "COOK"))
        
        info.wordBank.append(Word(prefix: "*", link: "OVER", suffix: "CROWD"))
        info.wordBank.append(Word(prefix: "*", link: "OVER", suffix: "DO"))
        info.wordBank.append(Word(prefix: "*", link: "OVER", suffix: "DOSE"))
        info.wordBank.append(Word(prefix: "*", link: "OVER", suffix: "DRAFT"))
        info.wordBank.append(Word(prefix: "*", link: "OVER", suffix: "DRESSED"))
        
        info.wordBank.append(Word(prefix: "*", link: "OVER", suffix: "DRIVE"))
        info.wordBank.append(Word(prefix: "*", link: "OVER", suffix: "DUE"))
        info.wordBank.append(Word(prefix: "*", link: "OVER", suffix: "EAGER"))
        info.wordBank.append(Word(prefix: "*", link: "OVER", suffix: "EAT"))
        info.wordBank.append(Word(prefix: "*", link: "OVER", suffix: "EXPOSED"))
        
        info.wordBank.append(Word(prefix: "*", link: "OVER", suffix: "FILL"))
        info.wordBank.append(Word(prefix: "*", link: "OVER", suffix: "FLOW"))
        info.wordBank.append(Word(prefix: "*", link: "OVER", suffix: "FULL"))
        info.wordBank.append(Word(prefix: "*", link: "OVER", suffix: "GROWN"))
        info.wordBank.append(Word(prefix: "*", link: "OVER", suffix: "HAND"))
        
        info.wordBank.append(Word(prefix: "*", link: "OVER", suffix: "HANG"))
        info.wordBank.append(Word(prefix: "*", link: "OVER", suffix: "HAUL"))
        info.wordBank.append(Word(prefix: "*", link: "OVER", suffix: "HEAD"))
        info.wordBank.append(Word(prefix: "*", link: "OVER", suffix: "HEAR"))
        info.wordBank.append(Word(prefix: "*", link: "OVER", suffix: "HEAT"))
        
        info.wordBank.append(Word(prefix: "*", link: "OVER", suffix: "KILL"))
        info.wordBank.append(Word(prefix: "*", link: "OVER", suffix: "LAND"))
        info.wordBank.append(Word(prefix: "*", link: "OVER", suffix: "LAP"))
        info.wordBank.append(Word(prefix: "*", link: "OVER", suffix: "LAY"))
        info.wordBank.append(Word(prefix: "*", link: "OVER", suffix: "LOAD"))
        
        info.wordBank.append(Word(prefix: "*", link: "OVER", suffix: "LOOK"))
        info.wordBank.append(Word(prefix: "*", link: "OVER", suffix: "LORD"))
        info.wordBank.append(Word(prefix: "*", link: "OVER", suffix: "LYING"))
        info.wordBank.append(Word(prefix: "*", link: "OVER", suffix: "NIGHT"))
        info.wordBank.append(Word(prefix: "*", link: "OVER", suffix: "PACK"))
        
        info.wordBank.append(Word(prefix: "*", link: "OVER", suffix: "PAID"))
        info.wordBank.append(Word(prefix: "*", link: "OVER", suffix: "PAY"))
        info.wordBank.append(Word(prefix: "*", link: "OVER", suffix: "POWER"))
        info.wordBank.append(Word(prefix: "*", link: "OVER", suffix: "RATE"))
        info.wordBank.append(Word(prefix: "*", link: "OVER", suffix: "REACH"))
        
        info.wordBank.append(Word(prefix: "*", link: "OVER", suffix: "REACT"))
        info.wordBank.append(Word(prefix: "*", link: "OVER", suffix: "RIDE"))
        info.wordBank.append(Word(prefix: "*", link: "OVER", suffix: "RULE"))
        info.wordBank.append(Word(prefix: "*", link: "OVER", suffix: "RUN"))
        info.wordBank.append(Word(prefix: "*", link: "OVER", suffix: "SEAS"))
        
        info.wordBank.append(Word(prefix: "*", link: "OVER", suffix: "SEER"))
        info.wordBank.append(Word(prefix: "*", link: "OVER", suffix: "SIGHT"))
        info.wordBank.append(Word(prefix: "*", link: "OVER", suffix: "SHOE"))
        info.wordBank.append(Word(prefix: "*", link: "OVER", suffix: "SLEEP"))
        info.wordBank.append(Word(prefix: "*", link: "OVER", suffix: "STATE"))
        
        info.wordBank.append(Word(prefix: "*", link: "OVER", suffix: "STRETCHED"))
        info.wordBank.append(Word(prefix: "*", link: "OVER", suffix: "TAKE"))
        info.wordBank.append(Word(prefix: "*", link: "OVER", suffix: "TAXED"))
        info.wordBank.append(Word(prefix: "*", link: "OVER", suffix: "THROW"))
        info.wordBank.append(Word(prefix: "*", link: "OVER", suffix: "TIME"))
        
        info.wordBank.append(Word(prefix: "*", link: "OVER", suffix: "TURN"))
        info.wordBank.append(Word(prefix: "*", link: "OVER", suffix: "USE"))
        info.wordBank.append(Word(prefix: "*", link: "OVER", suffix: "VALUE"))
        info.wordBank.append(Word(prefix: "*", link: "OVER", suffix: "VIEW"))
        info.wordBank.append(Word(prefix: "*", link: "OVER", suffix: "WEIGHT"))
        // over end
        
        info.wordBank.append(Word(prefix: "DUST", link: "PAN", suffix: "CAKE"))
        info.wordBank.append(Word(prefix: "DUST", link: "PAN", suffix: "HANDLE"))
        
        info.wordBank.append(Word(prefix: "NEWS", link: "PAPER", suffix: "BACK"))
        info.wordBank.append(Word(prefix: "NEWS", link: "PAPER", suffix: "WEIGHT"))
        info.wordBank.append(Word(prefix: "NEWS", link: "PAPER", suffix: "WORK"))
        
        info.wordBank.append(Word(prefix: "SAND", link: "PAPER", suffix: "BACK"))
        info.wordBank.append(Word(prefix: "SAND", link: "PAPER", suffix: "WEIGHT"))
        info.wordBank.append(Word(prefix: "SAND", link: "PAPER", suffix: "WORK"))
        
        info.wordBank.append(Word(prefix: "WALL", link: "PAPER", suffix: "BACK"))
        info.wordBank.append(Word(prefix: "WALL", link: "PAPER", suffix: "WEIGHT"))
        info.wordBank.append(Word(prefix: "WALL", link: "PAPER", suffix: "WORK"))
        
        info.wordBank.append(Word(prefix: "WAR", link: "PATH", suffix: "FINDER"))
        info.wordBank.append(Word(prefix: "WAR", link: "PATH", suffix: "WAY"))
        
        info.wordBank.append(Word(prefix: "OVER", link: "PAY", suffix: "ROLL"))
        
        info.wordBank.append(Word(prefix: "CHICK", link: "PEA", suffix: "NUT"))
        info.wordBank.append(Word(prefix: "CHICK", link: "PEA", suffix: "POD"))
        
        info.wordBank.append(Word(prefix: "PIG", link: "PEN", suffix: "KNIFE"))
        info.wordBank.append(Word(prefix: "PLAY", link: "PEN", suffix: "KNIFE"))
        
        info.wordBank.append(Word(prefix: "TOOTH", link: "PICK", suffix: "AX"))
        info.wordBank.append(Word(prefix: "TOOTH", link: "PICK", suffix: "POCKET"))
        
        info.wordBank.append(Word(prefix: "POT", link: "PIE", suffix: "CRUST"))
        
        info.wordBank.append(Word(prefix: "DRAIN", link: "PIPE", suffix: "FISH"))
        info.wordBank.append(Word(prefix: "DRAIN", link: "PIPE", suffix: "LINE"))
        info.wordBank.append(Word(prefix: "STAND", link: "PIPE", suffix: "FISH"))
        info.wordBank.append(Word(prefix: "STAND", link: "PIPE", suffix: "LINE"))
        info.wordBank.append(Word(prefix: "WIND", link: "PIPE", suffix: "FISH"))
        info.wordBank.append(Word(prefix: "WIND", link: "PIPE", suffix: "LINE"))
        
        info.wordBank.append(Word(prefix: "ARM", link: "PIT", suffix: "BULL"))
        
        info.wordBank.append(Word(prefix: "DOWN", link: "PLAY", suffix: "GROUND"))
        info.wordBank.append(Word(prefix: "DOWN", link: "PLAY", suffix: "PEN"))
        info.wordBank.append(Word(prefix: "DOWN", link: "PLAY", suffix: "THING"))
        
        info.wordBank.append(Word(prefix: "HORSE", link: "PLAY", suffix: "GROUND"))
        info.wordBank.append(Word(prefix: "HORSE", link: "PLAY", suffix: "PEN"))
        info.wordBank.append(Word(prefix: "HORSE", link: "PLAY", suffix: "THING"))
        
        info.wordBank.append(Word(prefix: "PICK", link: "POCKET", suffix: "BOOK"))
        info.wordBank.append(Word(prefix: "PICK", link: "POCKET", suffix: "KNIFE"))
        
        info.wordBank.append(Word(prefix: "FLAG", link: "POLE", suffix: "CAT"))
        info.wordBank.append(Word(prefix: "FLAG", link: "POLE", suffix: "STAR"))
        info.wordBank.append(Word(prefix: "FLAG", link: "POLE", suffix: "VAULT"))
        
        info.wordBank.append(Word(prefix: "GOAL", link: "POST", suffix: "CARD"))
        info.wordBank.append(Word(prefix: "GOAL", link: "POST", suffix: "MARK"))
        info.wordBank.append(Word(prefix: "GOAL", link: "POST", suffix: "MASTER"))
        
        info.wordBank.append(Word(prefix: "GUIDE", link: "POST", suffix: "CARD"))
        info.wordBank.append(Word(prefix: "GUIDE", link: "POST", suffix: "MARK"))
        info.wordBank.append(Word(prefix: "GUIDE", link: "POST", suffix: "MASTER"))
        
        info.wordBank.append(Word(prefix: "OUT", link: "POST", suffix: "CARD"))
        info.wordBank.append(Word(prefix: "OUT", link: "POST", suffix: "MARK"))
        info.wordBank.append(Word(prefix: "OUT", link: "POST", suffix: "MASTER"))
        
        info.wordBank.append(Word(prefix: "SIGN", link: "POST", suffix: "CARD"))
        info.wordBank.append(Word(prefix: "SIGN", link: "POST", suffix: "MARK"))
        info.wordBank.append(Word(prefix: "SIGN", link: "POST", suffix: "MASTER"))
        
        info.wordBank.append(Word(prefix: "FLOWER", link: "POT", suffix: "HOLDER"))
        info.wordBank.append(Word(prefix: "FLOWER", link: "POT", suffix: "HOLE"))
        info.wordBank.append(Word(prefix: "FLOWER", link: "POT", suffix: "LUCK"))
        info.wordBank.append(Word(prefix: "FLOWER", link: "POT", suffix: "PIE"))
        
        info.wordBank.append(Word(prefix: "JACK", link: "POT", suffix: "HOLDER"))
        info.wordBank.append(Word(prefix: "JACK", link: "POT", suffix: "HOLE"))
        info.wordBank.append(Word(prefix: "JACK", link: "POT", suffix: "LUCK"))
        info.wordBank.append(Word(prefix: "JACK", link: "POT", suffix: "PIE"))
        
        info.wordBank.append(Word(prefix: "TEA", link: "POT", suffix: "HOLDER"))
        info.wordBank.append(Word(prefix: "TEA", link: "POT", suffix: "HOLE"))
        info.wordBank.append(Word(prefix: "TEA", link: "POT", suffix: "LUCK"))
        info.wordBank.append(Word(prefix: "TEA", link: "POT", suffix: "PIE"))
        
        info.wordBank.append(Word(prefix: "HORSE", link: "POWER", suffix: "BOAT"))
        info.wordBank.append(Word(prefix: "HORSE", link: "POWER", suffix: "HOUSE"))
        
        info.wordBank.append(Word(prefix: "MAN", link: "POWER", suffix: "BOAT"))
        info.wordBank.append(Word(prefix: "MAN", link: "POWER", suffix: "HOUSE"))
        
        info.wordBank.append(Word(prefix: "OVER", link: "POWER", suffix: "BOAT"))
        info.wordBank.append(Word(prefix: "OVER", link: "POWER", suffix: "HOUSE"))
        
        info.wordBank.append(Word(prefix: "FINGER", link: "PRINT", suffix: "OUT"))
        info.wordBank.append(Word(prefix: "FOOT", link: "PRINT", suffix: "OUT"))
        info.wordBank.append(Word(prefix: "HAND", link: "PRINT", suffix: "OUT"))
        
        info.wordBank.append(Word(prefix: "CHILD", link: "PROOF", suffix: "READ"))
        info.wordBank.append(Word(prefix: "FOOL", link: "PROOF", suffix: "READ"))
        info.wordBank.append(Word(prefix: "SOUND", link: "PROOF", suffix: "READ"))
        info.wordBank.append(Word(prefix: "WATER", link: "PROOF", suffix: "READ"))
        info.wordBank.append(Word(prefix: "WEATHER", link: "PROOF", suffix: "READ"))
        
        info.wordBank.append(Word(prefix: "HAND", link: "RAIL", suffix: "ROAD"))
        info.wordBank.append(Word(prefix: "HAND", link: "RAIL", suffix: "WAY"))
        
        info.wordBank.append(Word(prefix: "BIRTH", link: "RIGHT", suffix: "HANDED"))
        info.wordBank.append(Word(prefix: "BIRTH", link: "RIGHT", suffix: "WING"))
        
        info.wordBank.append(Word(prefix: "COPY", link: "RIGHT", suffix: "HANDED"))
        info.wordBank.append(Word(prefix: "COPY", link: "RIGHT", suffix: "WING"))
        
        info.wordBank.append(Word(prefix: "DOWN", link: "RIGHT", suffix: "HANDED"))
        info.wordBank.append(Word(prefix: "DOWN", link: "RIGHT", suffix: "WING"))
        
        info.wordBank.append(Word(prefix: "UP", link: "RIGHT", suffix: "HANDED"))
        info.wordBank.append(Word(prefix: "UP", link: "RIGHT", suffix: "WING"))
        
        info.wordBank.append(Word(prefix: "EAR", link: "RING", suffix: "LEADER"))
        info.wordBank.append(Word(prefix: "EAR", link: "RING", suffix: "SIDE"))
        info.wordBank.append(Word(prefix: "EAR", link: "RING", suffix: "WORM"))
        
        info.wordBank.append(Word(prefix: "CROSS", link: "ROAD", suffix: "BED"))
        info.wordBank.append(Word(prefix: "CROSS", link: "ROAD", suffix: "RUNNER"))
        info.wordBank.append(Word(prefix: "CROSS", link: "ROAD", suffix: "SIDE"))
        info.wordBank.append(Word(prefix: "CROSS", link: "ROAD", suffix: "WAY"))
        
        info.wordBank.append(Word(prefix: "HIGH", link: "ROAD", suffix: "BED"))
        info.wordBank.append(Word(prefix: "HIGH", link: "ROAD", suffix: "RUNNER"))
        info.wordBank.append(Word(prefix: "HIGH", link: "ROAD", suffix: "SIDE"))
        info.wordBank.append(Word(prefix: "HIGH", link: "ROAD", suffix: "WAY"))
        
        info.wordBank.append(Word(prefix: "RAIL", link: "ROAD", suffix: "BED"))
        info.wordBank.append(Word(prefix: "RAIL", link: "ROAD", suffix: "RUNNER"))
        info.wordBank.append(Word(prefix: "RAIL", link: "ROAD", suffix: "SIDE"))
        info.wordBank.append(Word(prefix: "RAIL", link: "ROAD", suffix: "WAY"))
        
        info.wordBank.append(Word(prefix: "BED", link: "ROCK", suffix: "FISH"))
        info.wordBank.append(Word(prefix: "BED", link: "ROCK", suffix: "HOUND"))
        info.wordBank.append(Word(prefix: "BED", link: "ROCK", suffix: "SLIDE"))
        
        info.wordBank.append(Word(prefix: "BATH", link: "ROOM", suffix: "MATE"))
        info.wordBank.append(Word(prefix: "BED", link: "ROOM", suffix: "MATE"))
        info.wordBank.append(Word(prefix: "CHECK", link: "ROOM", suffix: "MATE"))
        info.wordBank.append(Word(prefix: "CLASS", link: "ROOM", suffix: "MATE"))
        info.wordBank.append(Word(prefix: "DARK", link: "ROOM", suffix: "MATE"))
        info.wordBank.append(Word(prefix: "LUNCH", link: "ROOM", suffix: "MATE"))
        info.wordBank.append(Word(prefix: "SCHOOL", link: "ROOM", suffix: "MATE"))
        info.wordBank.append(Word(prefix: "TEA", link: "ROOM", suffix: "MATE"))
        info.wordBank.append(Word(prefix: "WORK", link: "ROOM", suffix: "MATE"))
        
        info.wordBank.append(Word(prefix: "PRIM", link: "ROSE", suffix: "BUD"))
        info.wordBank.append(Word(prefix: "PRIM", link: "ROSE", suffix: "MARY"))
        
        info.wordBank.append(Word(prefix: "OUT", link: "RUN", suffix: "AWAY"))
        info.wordBank.append(Word(prefix: "OUT", link: "RUN", suffix: "OFF"))
        info.wordBank.append(Word(prefix: "OUT", link: "RUN", suffix: "WAY"))
        
        info.wordBank.append(Word(prefix: "OVER", link: "RUN", suffix: "AWAY"))
        info.wordBank.append(Word(prefix: "OVER", link: "RUN", suffix: "OFF"))
        info.wordBank.append(Word(prefix: "OVER", link: "RUN", suffix: "WAY"))
        
        info.wordBank.append(Word(prefix: "TOP", link: "SAIL", suffix: "BOAT"))
        info.wordBank.append(Word(prefix: "TOP", link: "SAIL", suffix: "FISH"))
        
        info.wordBank.append(Word(prefix: "QUICK", link: "SAND", suffix: "BAR"))
        info.wordBank.append(Word(prefix: "QUICK", link: "SAND", suffix: "BOX"))
        info.wordBank.append(Word(prefix: "QUICK", link: "SAND", suffix: "MAN"))
        info.wordBank.append(Word(prefix: "QUICK", link: "SAND", suffix: "PAPER"))
        info.wordBank.append(Word(prefix: "QUICK", link: "SAND", suffix: "STORM"))
        
        info.wordBank.append(Word(prefix: "APPLE", link: "SAUCE", suffix: "PAN"))
        info.wordBank.append(Word(prefix: "SOY", link: "SAUCE", suffix: "PAN"))
        
        info.wordBank.append(Word(prefix: "RIP", link: "SAW", suffix: "DUST"))
        info.wordBank.append(Word(prefix: "RIP", link: "SAW", suffix: "MILL"))
        info.wordBank.append(Word(prefix: "RIP", link: "SAW", suffix: "HORSE"))
        info.wordBank.append(Word(prefix: "JIG", link: "SAW", suffix: "DUST"))
        info.wordBank.append(Word(prefix: "JIG", link: "SAW", suffix: "MILL"))
        info.wordBank.append(Word(prefix: "JIG", link: "SAW", suffix: "HORSE"))
        info.wordBank.append(Word(prefix: "TABLE", link: "SAW", suffix: "DUST"))
        info.wordBank.append(Word(prefix: "TABLE", link: "SAW", suffix: "MILL"))
        info.wordBank.append(Word(prefix: "TABLE", link: "SAW", suffix: "HORSE"))
        info.wordBank.append(Word(prefix: "HACK", link: "SAW", suffix: "DUST"))
        info.wordBank.append(Word(prefix: "HACK", link: "SAW", suffix: "MILL"))
        info.wordBank.append(Word(prefix: "HACK", link: "SAW", suffix: "HORSE"))
        
        info.wordBank.append(Word(prefix: "HIGH", link: "SCHOOL", suffix: "HOUSE"))
        info.wordBank.append(Word(prefix: "HIGH", link: "SCHOOL", suffix: "ROOM"))
        info.wordBank.append(Word(prefix: "HIGH", link: "SCHOOL", suffix: "TEACHER"))
        
        info.wordBank.append(Word(prefix: "CORK", link: "SCREW", suffix: "DRIVER"))
        
        info.wordBank.append(Word(prefix: "UNDER", link: "SEA", suffix: "BED"))
        info.wordBank.append(Word(prefix: "UNDER", link: "SEA", suffix: "BIRD"))
        info.wordBank.append(Word(prefix: "UNDER", link: "SEA", suffix: "BREEZE"))
        info.wordBank.append(Word(prefix: "UNDER", link: "SEA", suffix: "BOARD"))
        info.wordBank.append(Word(prefix: "UNDER", link: "SEA", suffix: "CHANGE"))
        
        info.wordBank.append(Word(prefix: "UNDER", link: "SEA", suffix: "COAST"))
        info.wordBank.append(Word(prefix: "UNDER", link: "SEA", suffix: "FARER"))
        info.wordBank.append(Word(prefix: "UNDER", link: "SEA", suffix: "FOOD"))
        info.wordBank.append(Word(prefix: "UNDER", link: "SEA", suffix: "GOING"))
        info.wordBank.append(Word(prefix: "UNDER", link: "SEA", suffix: "GRASS"))
        
        info.wordBank.append(Word(prefix: "UNDER", link: "SEA", suffix: "GULL"))
        info.wordBank.append(Word(prefix: "UNDER", link: "SEA", suffix: "HORSE"))
        info.wordBank.append(Word(prefix: "UNDER", link: "SEA", suffix: "LION"))
        info.wordBank.append(Word(prefix: "UNDER", link: "SEA", suffix: "PLANE"))
        info.wordBank.append(Word(prefix: "UNDER", link: "SEA", suffix: "SHELL"))
        
        info.wordBank.append(Word(prefix: "UNDER", link: "SEA", suffix: "SHORE"))
        info.wordBank.append(Word(prefix: "UNDER", link: "SEA", suffix: "SICK"))
        info.wordBank.append(Word(prefix: "UNDER", link: "SEA", suffix: "SIDE"))
        info.wordBank.append(Word(prefix: "UNDER", link: "SEA", suffix: "STAR"))
        
        info.wordBank.append(Word(prefix: "UNDER", link: "SEA", suffix: "WALL"))
        info.wordBank.append(Word(prefix: "UNDER", link: "SEA", suffix: "WAY"))
        info.wordBank.append(Word(prefix: "UNDER", link: "SEA", suffix: "WEED"))
        info.wordBank.append(Word(prefix: "UNDER", link: "SEA", suffix: "WORTHY"))
        
        info.wordBank.append(Word(prefix: "HAND", link: "SET", suffix: "BACK"))
        info.wordBank.append(Word(prefix: "HEAD", link: "SET", suffix: "BACK"))
        info.wordBank.append(Word(prefix: "ON", link: "SET", suffix: "BACK"))
        info.wordBank.append(Word(prefix: "SUN", link: "SET", suffix: "BACK"))
        info.wordBank.append(Word(prefix: "UP", link: "SET", suffix: "BACK"))
        
        info.wordBank.append(Word(prefix: "EGG", link: "SHELL", suffix: "FISH"))
        info.wordBank.append(Word(prefix: "NUT", link: "SHELL", suffix: "FISH"))
        info.wordBank.append(Word(prefix: "SEA", link: "SHELL", suffix: "FISH"))
        
        info.wordBank.append(Word(prefix: "BATTLE", link: "SHIP", suffix: "MATE"))
        info.wordBank.append(Word(prefix: "BATTLE", link: "SHIP", suffix: "SHAPE"))
        info.wordBank.append(Word(prefix: "BATTLE", link: "SHIP", suffix: "WRECK"))
        info.wordBank.append(Word(prefix: "BATTLE", link: "SHIP", suffix: "YARD"))
        
        info.wordBank.append(Word(prefix: "SPACE", link: "SHIP", suffix: "MATE"))
        info.wordBank.append(Word(prefix: "SPACE", link: "SHIP", suffix: "SHAPE"))
        info.wordBank.append(Word(prefix: "SPACE", link: "SHIP", suffix: "WRECK"))
        info.wordBank.append(Word(prefix: "SPACE", link: "SHIP", suffix: "YARD"))
        
        info.wordBank.append(Word(prefix: "SPORTSMAN", link: "SHIP", suffix: "MATE"))
        info.wordBank.append(Word(prefix: "SPORTSMAN", link: "SHIP", suffix: "SHAPE"))
        info.wordBank.append(Word(prefix: "SPORTSMAN", link: "SHIP", suffix: "WRECK"))
        info.wordBank.append(Word(prefix: "SPORTSMAN", link: "SHIP", suffix: "YARD"))
        
        info.wordBank.append(Word(prefix: "STAR", link: "SHIP", suffix: "MATE"))
        info.wordBank.append(Word(prefix: "STAR", link: "SHIP", suffix: "SHAPE"))
        info.wordBank.append(Word(prefix: "STAR", link: "SHIP", suffix: "WRECK"))
        info.wordBank.append(Word(prefix: "STAR", link: "SHIP", suffix: "YARD"))
        
        info.wordBank.append(Word(prefix: "STEAM", link: "SHIP", suffix: "MATE"))
        info.wordBank.append(Word(prefix: "STEAM", link: "SHIP", suffix: "SHAPE"))
        info.wordBank.append(Word(prefix: "STEAM", link: "SHIP", suffix: "WRECK"))
        info.wordBank.append(Word(prefix: "STEAM", link: "SHIP", suffix: "YARD"))
        
        info.wordBank.append(Word(prefix: "WAR", link: "SHIP", suffix: "MATE"))
        info.wordBank.append(Word(prefix: "WAR", link: "SHIP", suffix: "SHAPE"))
        info.wordBank.append(Word(prefix: "WAR", link: "SHIP", suffix: "WRECK"))
        info.wordBank.append(Word(prefix: "WAR", link: "SHIP", suffix: "YARD"))
        
        info.wordBank.append(Word(prefix: "HORSE", link: "SHOE", suffix: "HORN"))
        info.wordBank.append(Word(prefix: "HORSE", link: "SHOE", suffix: "LACE"))
        
        info.wordBank.append(Word(prefix: "OVER", link: "SHOE", suffix: "HORN"))
        info.wordBank.append(Word(prefix: "OVER", link: "SHOE", suffix: "LACE"))
        
        info.wordBank.append(Word(prefix: "SNOW", link: "SHOE", suffix: "HORN"))
        info.wordBank.append(Word(prefix: "SNOW", link: "SHOE", suffix: "LACE"))
        
        info.wordBank.append(Word(prefix: "SING", link: "SONG", suffix: "BIRD"))
        
        info.wordBank.append(Word(prefix: "CHEAP", link: "SKATE", suffix: "BOARD"))
        
        info.wordBank.append(Word(prefix: "OVER", link: "SLEEP", suffix: "WALK"))
        
        info.wordBank.append(Word(prefix: "COW", link: "SLIP", suffix: "COVER"))
        info.wordBank.append(Word(prefix: "COW", link: "SLIP", suffix: "KNOT"))
        info.wordBank.append(Word(prefix: "COW", link: "SLIP", suffix: "SHOD"))
        
        info.wordBank.append(Word(prefix: "BACK", link: "SPACE", suffix: "CRAFT"))
        info.wordBank.append(Word(prefix: "BACK", link: "SPACE", suffix: "SHIP"))
        info.wordBank.append(Word(prefix: "BACK", link: "SPACE", suffix: "SUIT"))
        
        info.wordBank.append(Word(prefix: "SUN", link: "SPOT", suffix: "LIGHT"))
        
        info.wordBank.append(Word(prefix: "TIME", link: "TABLE", suffix: "CLOTH"))
        info.wordBank.append(Word(prefix: "TIME", link: "TABLE", suffix: "LAND"))
        info.wordBank.append(Word(prefix: "TIME", link: "TABLE", suffix: "SAW"))
        info.wordBank.append(Word(prefix: "TIME", link: "TABLE", suffix: "SPOON"))
        info.wordBank.append(Word(prefix: "TIME", link: "TABLE", suffix: "TOP"))
        
        info.wordBank.append(Word(prefix: "WORK", link: "TABLE", suffix: "CLOTH"))
        info.wordBank.append(Word(prefix: "WORK", link: "TABLE", suffix: "LAND"))
        info.wordBank.append(Word(prefix: "WORK", link: "TABLE", suffix: "SAW"))
        info.wordBank.append(Word(prefix: "WORK", link: "TABLE", suffix: "SPOON"))
        info.wordBank.append(Word(prefix: "WORK", link: "TABLE", suffix: "TOP"))
        
        info.wordBank.append(Word(prefix: "BOB", link: "TAIL", suffix: "BACK"))
        info.wordBank.append(Word(prefix: "BOB", link: "TAIL", suffix: "SPIN"))
        
        info.wordBank.append(Word(prefix: "HIGH", link: "TAIL", suffix: "BACK"))
        info.wordBank.append(Word(prefix: "HIGH", link: "TAIL", suffix: "SPIN"))
        
        info.wordBank.append(Word(prefix: "PIG", link: "TAIL", suffix: "BACK"))
        info.wordBank.append(Word(prefix: "PIG", link: "TAIL", suffix: "SPIN"))
        
        info.wordBank.append(Word(prefix: "SWALLOW", link: "TAIL", suffix: "BACK"))
        info.wordBank.append(Word(prefix: "SWALLOW", link: "TAIL", suffix: "SPIN"))
        
        info.wordBank.append(Word(prefix: "YELLOW", link: "TAIL", suffix: "BACK"))
        info.wordBank.append(Word(prefix: "YELLOW", link: "TAIL", suffix: "SPIN"))
        
        info.wordBank.append(Word(prefix: "OVER", link: "TAKE", suffix: "AWAY"))
        
        info.wordBank.append(Word(prefix: "OUT", link: "TAKE", suffix: "AWAY"))
        info.wordBank.append(Word(prefix: "OUT", link: "TAKE", suffix: "OFF"))
        info.wordBank.append(Word(prefix: "OUT", link: "TAKE", suffix: "OUT"))
        info.wordBank.append(Word(prefix: "OUT", link: "TAKE", suffix: "OVER"))
        
        info.wordBank.append(Word(prefix: "OVER", link: "TAKE", suffix: "AWAY"))
        info.wordBank.append(Word(prefix: "OVER", link: "TAKE", suffix: "OFF"))
        info.wordBank.append(Word(prefix: "OVER", link: "TAKE", suffix: "OUT"))
        info.wordBank.append(Word(prefix: "OVER", link: "TAKE", suffix: "OVER"))
        
        info.wordBank.append(Word(prefix: "UNDER", link: "TAKE", suffix: "AWAY"))
        info.wordBank.append(Word(prefix: "UNDER", link: "TAKE", suffix: "OFF"))
        info.wordBank.append(Word(prefix: "UNDER", link: "TAKE", suffix: "OUT"))
        info.wordBank.append(Word(prefix: "UNDER", link: "TAKE", suffix: "OVER"))
        
        info.wordBank.append(Word(prefix: "UP", link: "TAKE", suffix: "AWAY"))
        info.wordBank.append(Word(prefix: "UP", link: "TAKE", suffix: "OFF"))
        info.wordBank.append(Word(prefix: "UP", link: "TAKE", suffix: "OUT"))
        info.wordBank.append(Word(prefix: "UP", link: "TAKE", suffix: "OVER"))
        
        info.wordBank.append(Word(prefix: "BREAK", link: "THROUGH", suffix: "PUT"))
        
        info.wordBank.append(Word(prefix: "AIR", link: "TIGHT", suffix: "ROPE"))
        info.wordBank.append(Word(prefix: "WATER", link: "TIGHT", suffix: "ROPE"))
        
        // start time - any
        info.wordBank.append(Word(prefix: "ANY", link: "TIME", suffix: "CARD"))
        info.wordBank.append(Word(prefix: "ANY", link: "TIME", suffix: "KEEPER"))
        info.wordBank.append(Word(prefix: "ANY", link: "TIME", suffix: "LAPSE"))
        info.wordBank.append(Word(prefix: "ANY", link: "TIME", suffix: "LINE"))
        info.wordBank.append(Word(prefix: "ANY", link: "TIME", suffix: "OUT"))
        info.wordBank.append(Word(prefix: "ANY", link: "TIME", suffix: "PIECE"))
        info.wordBank.append(Word(prefix: "ANY", link: "TIME", suffix: "SAVER"))
        info.wordBank.append(Word(prefix: "ANY", link: "TIME", suffix: "SCALE"))
        info.wordBank.append(Word(prefix: "ANY", link: "TIME", suffix: "SHEET"))
        info.wordBank.append(Word(prefix: "ANY", link: "TIME", suffix: "TABLE"))
        info.wordBank.append(Word(prefix: "ANY", link: "TIME", suffix: "WARP"))
        info.wordBank.append(Word(prefix: "ANY", link: "TIME", suffix: "WORN"))
        // end time
        
        // start time - bed
        info.wordBank.append(Word(prefix: "BED", link: "TIME", suffix: "CARD"))
        info.wordBank.append(Word(prefix: "BED", link: "TIME", suffix: "KEEPER"))
        info.wordBank.append(Word(prefix: "BED", link: "TIME", suffix: "LAPSE"))
        info.wordBank.append(Word(prefix: "BED", link: "TIME", suffix: "LINE"))
        info.wordBank.append(Word(prefix: "BED", link: "TIME", suffix: "OUT"))
        info.wordBank.append(Word(prefix: "BED", link: "TIME", suffix: "PIECE"))
        info.wordBank.append(Word(prefix: "BED", link: "TIME", suffix: "SAVER"))
        info.wordBank.append(Word(prefix: "BED", link: "TIME", suffix: "SCALE"))
        info.wordBank.append(Word(prefix: "BED", link: "TIME", suffix: "SHEET"))
        info.wordBank.append(Word(prefix: "BED", link: "TIME", suffix: "TABLE"))
        info.wordBank.append(Word(prefix: "BED", link: "TIME", suffix: "WARP"))
        info.wordBank.append(Word(prefix: "BED", link: "TIME", suffix: "WORN"))
        // end time
        
        // start time - day
        info.wordBank.append(Word(prefix: "DAY", link: "TIME", suffix: "CARD"))
        info.wordBank.append(Word(prefix: "DAY", link: "TIME", suffix: "KEEPER"))
        info.wordBank.append(Word(prefix: "DAY", link: "TIME", suffix: "LAPSE"))
        info.wordBank.append(Word(prefix: "DAY", link: "TIME", suffix: "LINE"))
        info.wordBank.append(Word(prefix: "DAY", link: "TIME", suffix: "OUT"))
        info.wordBank.append(Word(prefix: "DAY", link: "TIME", suffix: "PIECE"))
        info.wordBank.append(Word(prefix: "DAY", link: "TIME", suffix: "SAVER"))
        info.wordBank.append(Word(prefix: "DAY", link: "TIME", suffix: "SCALE"))
        info.wordBank.append(Word(prefix: "DAY", link: "TIME", suffix: "SHEET"))
        info.wordBank.append(Word(prefix: "DAY", link: "TIME", suffix: "TABLE"))
        info.wordBank.append(Word(prefix: "DAY", link: "TIME", suffix: "WARP"))
        info.wordBank.append(Word(prefix: "DAY", link: "TIME", suffix: "WORN"))
        // end time
        
        // start time - life
        info.wordBank.append(Word(prefix: "LIFE", link: "TIME", suffix: "CARD"))
        info.wordBank.append(Word(prefix: "LIFE", link: "TIME", suffix: "KEEPER"))
        info.wordBank.append(Word(prefix: "LIFE", link: "TIME", suffix: "LAPSE"))
        info.wordBank.append(Word(prefix: "LIFE", link: "TIME", suffix: "LINE"))
        info.wordBank.append(Word(prefix: "LIFE", link: "TIME", suffix: "OUT"))
        info.wordBank.append(Word(prefix: "LIFE", link: "TIME", suffix: "PIECE"))
        info.wordBank.append(Word(prefix: "LIFE", link: "TIME", suffix: "SAVER"))
        info.wordBank.append(Word(prefix: "LIFE", link: "TIME", suffix: "SCALE"))
        info.wordBank.append(Word(prefix: "LIFE", link: "TIME", suffix: "SHEET"))
        info.wordBank.append(Word(prefix: "LIFE", link: "TIME", suffix: "TABLE"))
        info.wordBank.append(Word(prefix: "LIFE", link: "TIME", suffix: "WARP"))
        info.wordBank.append(Word(prefix: "LIFE", link: "TIME", suffix: "WORN"))
        // end time
        
        // start time - meal
        info.wordBank.append(Word(prefix: "MEAL", link: "TIME", suffix: "CARD"))
        info.wordBank.append(Word(prefix: "MEAL", link: "TIME", suffix: "KEEPER"))
        info.wordBank.append(Word(prefix: "MEAL", link: "TIME", suffix: "LAPSE"))
        info.wordBank.append(Word(prefix: "MEAL", link: "TIME", suffix: "LINE"))
        info.wordBank.append(Word(prefix: "MEAL", link: "TIME", suffix: "OUT"))
        info.wordBank.append(Word(prefix: "MEAL", link: "TIME", suffix: "PIECE"))
        info.wordBank.append(Word(prefix: "MEAL", link: "TIME", suffix: "SAVER"))
        info.wordBank.append(Word(prefix: "MEAL", link: "TIME", suffix: "SCALE"))
        info.wordBank.append(Word(prefix: "MEAL", link: "TIME", suffix: "SHEET"))
        info.wordBank.append(Word(prefix: "MEAL", link: "TIME", suffix: "TABLE"))
        info.wordBank.append(Word(prefix: "MEAL", link: "TIME", suffix: "WARP"))
        info.wordBank.append(Word(prefix: "MEAL", link: "TIME", suffix: "WORN"))
        // end time
        
        // start time - night
        info.wordBank.append(Word(prefix: "NIGHT", link: "TIME", suffix: "CARD"))
        info.wordBank.append(Word(prefix: "NIGHT", link: "TIME", suffix: "KEEPER"))
        info.wordBank.append(Word(prefix: "NIGHT", link: "TIME", suffix: "LAPSE"))
        info.wordBank.append(Word(prefix: "NIGHT", link: "TIME", suffix: "LINE"))
        info.wordBank.append(Word(prefix: "NIGHT", link: "TIME", suffix: "OUT"))
        info.wordBank.append(Word(prefix: "NIGHT", link: "TIME", suffix: "PIECE"))
        info.wordBank.append(Word(prefix: "NIGHT", link: "TIME", suffix: "SAVER"))
        info.wordBank.append(Word(prefix: "NIGHT", link: "TIME", suffix: "SCALE"))
        info.wordBank.append(Word(prefix: "NIGHT", link: "TIME", suffix: "SHEET"))
        info.wordBank.append(Word(prefix: "NIGHT", link: "TIME", suffix: "TABLE"))
        info.wordBank.append(Word(prefix: "NIGHT", link: "TIME", suffix: "WARP"))
        info.wordBank.append(Word(prefix: "NIGHT", link: "TIME", suffix: "WORN"))
        // end time
        
        // start time - over
        info.wordBank.append(Word(prefix: "OVER", link: "TIME", suffix: "CARD"))
        info.wordBank.append(Word(prefix: "OVER", link: "TIME", suffix: "KEEPER"))
        info.wordBank.append(Word(prefix: "OVER", link: "TIME", suffix: "LAPSE"))
        info.wordBank.append(Word(prefix: "OVER", link: "TIME", suffix: "LINE"))
        info.wordBank.append(Word(prefix: "OVER", link: "TIME", suffix: "OUT"))
        info.wordBank.append(Word(prefix: "OVER", link: "TIME", suffix: "PIECE"))
        info.wordBank.append(Word(prefix: "OVER", link: "TIME", suffix: "SAVER"))
        info.wordBank.append(Word(prefix: "OVER", link: "TIME", suffix: "SCALE"))
        info.wordBank.append(Word(prefix: "OVER", link: "TIME", suffix: "SHEET"))
        info.wordBank.append(Word(prefix: "OVER", link: "TIME", suffix: "TABLE"))
        info.wordBank.append(Word(prefix: "OVER", link: "TIME", suffix: "WARP"))
        info.wordBank.append(Word(prefix: "OVER", link: "TIME", suffix: "WORN"))
        // end time
        
        // start time - some
        info.wordBank.append(Word(prefix: "SOME", link: "TIME", suffix: "CARD"))
        info.wordBank.append(Word(prefix: "SOME", link: "TIME", suffix: "KEEPER"))
        info.wordBank.append(Word(prefix: "SOME", link: "TIME", suffix: "LAPSE"))
        info.wordBank.append(Word(prefix: "SOME", link: "TIME", suffix: "LINE"))
        info.wordBank.append(Word(prefix: "SOME", link: "TIME", suffix: "OUT"))
        info.wordBank.append(Word(prefix: "SOME", link: "TIME", suffix: "PIECE"))
        info.wordBank.append(Word(prefix: "SOME", link: "TIME", suffix: "SAVER"))
        info.wordBank.append(Word(prefix: "SOME", link: "TIME", suffix: "SCALE"))
        info.wordBank.append(Word(prefix: "SOME", link: "TIME", suffix: "SHEET"))
        info.wordBank.append(Word(prefix: "SOME", link: "TIME", suffix: "TABLE"))
        info.wordBank.append(Word(prefix: "SOME", link: "TIME", suffix: "WARP"))
        info.wordBank.append(Word(prefix: "SOME", link: "TIME", suffix: "WORN"))
        // end time
        
        // start time - spring
        info.wordBank.append(Word(prefix: "SPRING", link: "TIME", suffix: "CARD"))
        info.wordBank.append(Word(prefix: "SPRING", link: "TIME", suffix: "KEEPER"))
        info.wordBank.append(Word(prefix: "SPRING", link: "TIME", suffix: "LAPSE"))
        info.wordBank.append(Word(prefix: "SPRING", link: "TIME", suffix: "LINE"))
        info.wordBank.append(Word(prefix: "SPRING", link: "TIME", suffix: "OUT"))
        info.wordBank.append(Word(prefix: "SPRING", link: "TIME", suffix: "PIECE"))
        info.wordBank.append(Word(prefix: "SPRING", link: "TIME", suffix: "SAVER"))
        info.wordBank.append(Word(prefix: "SPRING", link: "TIME", suffix: "SCALE"))
        info.wordBank.append(Word(prefix: "SPRING", link: "TIME", suffix: "SHEET"))
        info.wordBank.append(Word(prefix: "SPRING", link: "TIME", suffix: "TABLE"))
        info.wordBank.append(Word(prefix: "SPRING", link: "TIME", suffix: "WARP"))
        info.wordBank.append(Word(prefix: "SPRING", link: "TIME", suffix: "WORN"))
        // end time
        
        // start time - summer
        info.wordBank.append(Word(prefix: "SUMMER", link: "TIME", suffix: "CARD"))
        info.wordBank.append(Word(prefix: "SUMMER", link: "TIME", suffix: "KEEPER"))
        info.wordBank.append(Word(prefix: "SUMMER", link: "TIME", suffix: "LAPSE"))
        info.wordBank.append(Word(prefix: "SUMMER", link: "TIME", suffix: "LINE"))
        info.wordBank.append(Word(prefix: "SUMMER", link: "TIME", suffix: "OUT"))
        info.wordBank.append(Word(prefix: "SUMMER", link: "TIME", suffix: "PIECE"))
        info.wordBank.append(Word(prefix: "SUMMER", link: "TIME", suffix: "SAVER"))
        info.wordBank.append(Word(prefix: "SUMMER", link: "TIME", suffix: "SCALE"))
        info.wordBank.append(Word(prefix: "SUMMER", link: "TIME", suffix: "SHEET"))
        info.wordBank.append(Word(prefix: "SUMMER", link: "TIME", suffix: "TABLE"))
        info.wordBank.append(Word(prefix: "SUMMER", link: "TIME", suffix: "WARP"))
        info.wordBank.append(Word(prefix: "SUMMER", link: "TIME", suffix: "WORN"))
        // end time
        
        // start time - tea
        info.wordBank.append(Word(prefix: "TEA", link: "TIME", suffix: "CARD"))
        info.wordBank.append(Word(prefix: "TEA", link: "TIME", suffix: "KEEPER"))
        info.wordBank.append(Word(prefix: "TEA", link: "TIME", suffix: "LAPSE"))
        info.wordBank.append(Word(prefix: "TEA", link: "TIME", suffix: "LINE"))
        info.wordBank.append(Word(prefix: "TEA", link: "TIME", suffix: "OUT"))
        info.wordBank.append(Word(prefix: "TEA", link: "TIME", suffix: "PIECE"))
        info.wordBank.append(Word(prefix: "TEA", link: "TIME", suffix: "SAVER"))
        info.wordBank.append(Word(prefix: "TEA", link: "TIME", suffix: "SCALE"))
        info.wordBank.append(Word(prefix: "TEA", link: "TIME", suffix: "SHEET"))
        info.wordBank.append(Word(prefix: "TEA", link: "TIME", suffix: "TABLE"))
        info.wordBank.append(Word(prefix: "TEA", link: "TIME", suffix: "WARP"))
        info.wordBank.append(Word(prefix: "TEA", link: "TIME", suffix: "WORN"))
        // end time
        
        info.wordBank.append(Word(prefix: "FINGER", link: "TIP", suffix: "TOE"))
        
        info.wordBank.append(Word(prefix: "TIP", link: "TOE", suffix: "NAIL"))
        
        // start top - cook
        info.wordBank.append(Word(prefix: "COOK", link: "TOP", suffix: "COAT"))
        info.wordBank.append(Word(prefix: "COOK", link: "TOP", suffix: "FLIGHT"))
        info.wordBank.append(Word(prefix: "COOK", link: "TOP", suffix: "HAT"))
        info.wordBank.append(Word(prefix: "COOK", link: "TOP", suffix: "KNOT"))
        info.wordBank.append(Word(prefix: "COOK", link: "TOP", suffix: "SAIL"))
        info.wordBank.append(Word(prefix: "COOK", link: "TOP", suffix: "SIDE"))
        info.wordBank.append(Word(prefix: "COOK", link: "TOP", suffix: "SOIL"))
        info.wordBank.append(Word(prefix: "COOK", link: "TOP", suffix: "SPIN"))
        info.wordBank.append(Word(prefix: "COOK", link: "TOP", suffix: "STITCH"))
        // end top
        
        // start top - desk
        info.wordBank.append(Word(prefix: "DESK", link: "TOP", suffix: "COAT"))
        info.wordBank.append(Word(prefix: "DESK", link: "TOP", suffix: "FLIGHT"))
        info.wordBank.append(Word(prefix: "DESK", link: "TOP", suffix: "HAT"))
        info.wordBank.append(Word(prefix: "DESK", link: "TOP", suffix: "KNOT"))
        info.wordBank.append(Word(prefix: "DESK", link: "TOP", suffix: "SAIL"))
        info.wordBank.append(Word(prefix: "DESK", link: "TOP", suffix: "SIDE"))
        info.wordBank.append(Word(prefix: "DESK", link: "TOP", suffix: "SOIL"))
        info.wordBank.append(Word(prefix: "DESK", link: "TOP", suffix: "SPIN"))
        info.wordBank.append(Word(prefix: "DESK", link: "TOP", suffix: "STITCH"))
        // end top
        
        // start top - hard
        info.wordBank.append(Word(prefix: "HARD", link: "TOP", suffix: "COAT"))
        info.wordBank.append(Word(prefix: "HARD", link: "TOP", suffix: "FLIGHT"))
        info.wordBank.append(Word(prefix: "HARD", link: "TOP", suffix: "HAT"))
        info.wordBank.append(Word(prefix: "HARD", link: "TOP", suffix: "KNOT"))
        info.wordBank.append(Word(prefix: "HARD", link: "TOP", suffix: "SAIL"))
        info.wordBank.append(Word(prefix: "HARD", link: "TOP", suffix: "SIDE"))
        info.wordBank.append(Word(prefix: "HARD", link: "TOP", suffix: "SOIL"))
        info.wordBank.append(Word(prefix: "HARD", link: "TOP", suffix: "SPIN"))
        info.wordBank.append(Word(prefix: "HARD", link: "TOP", suffix: "STITCH"))
        // end top
        
        // start top - hill
        info.wordBank.append(Word(prefix: "HILL", link: "TOP", suffix: "COAT"))
        info.wordBank.append(Word(prefix: "HILL", link: "TOP", suffix: "FLIGHT"))
        info.wordBank.append(Word(prefix: "HILL", link: "TOP", suffix: "HAT"))
        info.wordBank.append(Word(prefix: "HILL", link: "TOP", suffix: "KNOT"))
        info.wordBank.append(Word(prefix: "HILL", link: "TOP", suffix: "SAIL"))
        info.wordBank.append(Word(prefix: "HILL", link: "TOP", suffix: "SIDE"))
        info.wordBank.append(Word(prefix: "HILL", link: "TOP", suffix: "SOIL"))
        info.wordBank.append(Word(prefix: "HILL", link: "TOP", suffix: "SPIN"))
        info.wordBank.append(Word(prefix: "HILL", link: "TOP", suffix: "STITCH"))
        // end top
        
        // start top - table
        info.wordBank.append(Word(prefix: "TABLE", link: "TOP", suffix: "COAT"))
        info.wordBank.append(Word(prefix: "TABLE", link: "TOP", suffix: "FLIGHT"))
        info.wordBank.append(Word(prefix: "TABLE", link: "TOP", suffix: "HAT"))
        info.wordBank.append(Word(prefix: "TABLE", link: "TOP", suffix: "KNOT"))
        info.wordBank.append(Word(prefix: "TABLE", link: "TOP", suffix: "SAIL"))
        info.wordBank.append(Word(prefix: "TABLE", link: "TOP", suffix: "SIDE"))
        info.wordBank.append(Word(prefix: "TABLE", link: "TOP", suffix: "SOIL"))
        info.wordBank.append(Word(prefix: "TABLE", link: "TOP", suffix: "SPIN"))
        info.wordBank.append(Word(prefix: "TABLE", link: "TOP", suffix: "STITCH"))
        // end top
        
        // start top - tree
        info.wordBank.append(Word(prefix: "TREE", link: "TOP", suffix: "COAT"))
        info.wordBank.append(Word(prefix: "TREE", link: "TOP", suffix: "FLIGHT"))
        info.wordBank.append(Word(prefix: "TREE", link: "TOP", suffix: "HAT"))
        info.wordBank.append(Word(prefix: "TREE", link: "TOP", suffix: "KNOT"))
        info.wordBank.append(Word(prefix: "TREE", link: "TOP", suffix: "SAIL"))
        info.wordBank.append(Word(prefix: "TREE", link: "TOP", suffix: "SIDE"))
        info.wordBank.append(Word(prefix: "TREE", link: "TOP", suffix: "SOIL"))
        info.wordBank.append(Word(prefix: "TREE", link: "TOP", suffix: "SPIN"))
        info.wordBank.append(Word(prefix: "TREE", link: "TOP", suffix: "STITCH"))
        // end top
        
        info.wordBank.append(Word(prefix: "DOWN", link: "TURN", suffix: "COAT"))
        info.wordBank.append(Word(prefix: "DOWN", link: "TURN", suffix: "OUT"))
        info.wordBank.append(Word(prefix: "DOWN", link: "TURN", suffix: "OVER"))
        info.wordBank.append(Word(prefix: "DOWN", link: "TURN", suffix: "PIKE"))
        info.wordBank.append(Word(prefix: "DOWN", link: "TURN", suffix: "STILE"))
        
        info.wordBank.append(Word(prefix: "OVER", link: "TURN", suffix: "COAT"))
        info.wordBank.append(Word(prefix: "OVER", link: "TURN", suffix: "OUT"))
        info.wordBank.append(Word(prefix: "OVER", link: "TURN", suffix: "OVER"))
        info.wordBank.append(Word(prefix: "OVER", link: "TURN", suffix: "PIKE"))
        info.wordBank.append(Word(prefix: "OVER", link: "TURN", suffix: "STILE"))
        
        info.wordBank.append(Word(prefix: "UP", link: "TURN", suffix: "COAT"))
        info.wordBank.append(Word(prefix: "UP", link: "TURN", suffix: "OUT"))
        info.wordBank.append(Word(prefix: "UP", link: "TURN", suffix: "OVER"))
        info.wordBank.append(Word(prefix: "UP", link: "TURN", suffix: "PIKE"))
        info.wordBank.append(Word(prefix: "UP", link: "TURN", suffix: "STILE"))
        
        info.wordBank.append(Word(prefix: "DOWN", link: "UNDER", suffix: "ACHIEVE"))
        info.wordBank.append(Word(prefix: "DOWN", link: "UNDER", suffix: "ACHIEVER"))
        info.wordBank.append(Word(prefix: "DOWN", link: "UNDER", suffix: "ARM"))
        info.wordBank.append(Word(prefix: "DOWN", link: "UNDER", suffix: "CLOTHING"))
        info.wordBank.append(Word(prefix: "DOWN", link: "UNDER", suffix: "COOK"))
        info.wordBank.append(Word(prefix: "DOWN", link: "UNDER", suffix: "COVER"))
        info.wordBank.append(Word(prefix: "DOWN", link: "UNDER", suffix: "CUT"))
        info.wordBank.append(Word(prefix: "DOWN", link: "UNDER", suffix: "DONE"))
        info.wordBank.append(Word(prefix: "DOWN", link: "UNDER", suffix: "DOG"))
        info.wordBank.append(Word(prefix: "DOWN", link: "UNDER", suffix: "DONE"))
        info.wordBank.append(Word(prefix: "DOWN", link: "UNDER", suffix: "GO"))
        info.wordBank.append(Word(prefix: "DOWN", link: "UNDER", suffix: "GROUND"))
        info.wordBank.append(Word(prefix: "DOWN", link: "UNDER", suffix: "GROWTH"))
        info.wordBank.append(Word(prefix: "DOWN", link: "UNDER", suffix: "HAND"))
        info.wordBank.append(Word(prefix: "DOWN", link: "UNDER", suffix: "SEA"))
        info.wordBank.append(Word(prefix: "DOWN", link: "UNDER", suffix: "SHIRT"))
        info.wordBank.append(Word(prefix: "DOWN", link: "UNDER", suffix: "STAND"))
        info.wordBank.append(Word(prefix: "DOWN", link: "UNDER", suffix: "STATED"))
        info.wordBank.append(Word(prefix: "DOWN", link: "UNDER", suffix: "TAKE"))
        info.wordBank.append(Word(prefix: "DOWN", link: "UNDER", suffix: "TAKER"))
        
        info.wordBank.append(Word(prefix: "DOWN", link: "UNDER", suffix: "VALUE"))
        info.wordBank.append(Word(prefix: "DOWN", link: "UNDER", suffix: "WATER"))
        info.wordBank.append(Word(prefix: "DOWN", link: "UNDER", suffix: "WEAR"))
        info.wordBank.append(Word(prefix: "DOWN", link: "UNDER", suffix: "WEIGHT"))
        info.wordBank.append(Word(prefix: "DOWN", link: "UNDER", suffix: "WORLD"))
        
        // start up - break
        info.wordBank.append(Word(prefix: "BREAK", link: "UP", suffix: "BEAT"))
        info.wordBank.append(Word(prefix: "BREAK", link: "UP", suffix: "BRINGING"))
        info.wordBank.append(Word(prefix: "BREAK", link: "UP", suffix: "COMING"))
        info.wordBank.append(Word(prefix: "BREAK", link: "UP", suffix: "DATE"))
        info.wordBank.append(Word(prefix: "BREAK", link: "UP", suffix: "DRAFT"))
        
        info.wordBank.append(Word(prefix: "BREAK", link: "UP", suffix: "GRADE"))
        info.wordBank.append(Word(prefix: "BREAK", link: "UP", suffix: "HILL"))
        info.wordBank.append(Word(prefix: "BREAK", link: "UP", suffix: "HOLD"))
        info.wordBank.append(Word(prefix: "BREAK", link: "UP", suffix: "KEEP"))
        info.wordBank.append(Word(prefix: "BREAK", link: "UP", suffix: "LIFT"))
        
        info.wordBank.append(Word(prefix: "BREAK", link: "UP", suffix: "LOAD"))
        info.wordBank.append(Word(prefix: "BREAK", link: "UP", suffix: "ON"))
        info.wordBank.append(Word(prefix: "BREAK", link: "UP", suffix: "RIGHT"))
        info.wordBank.append(Word(prefix: "BREAK", link: "UP", suffix: "RISING"))
        info.wordBank.append(Word(prefix: "BREAK", link: "UP", suffix: "ROAR"))
        
        info.wordBank.append(Word(prefix: "BREAK", link: "UP", suffix: "ROOT"))
        info.wordBank.append(Word(prefix: "BREAK", link: "UP", suffix: "SET"))
        info.wordBank.append(Word(prefix: "BREAK", link: "UP", suffix: "STAGE"))
        info.wordBank.append(Word(prefix: "BREAK", link: "UP", suffix: "STAIRS"))
        info.wordBank.append(Word(prefix: "BREAK", link: "UP", suffix: "STANDING"))
        
        info.wordBank.append(Word(prefix: "BREAK", link: "UP", suffix: "START"))
        info.wordBank.append(Word(prefix: "BREAK", link: "UP", suffix: "STATE"))
        info.wordBank.append(Word(prefix: "BREAK", link: "UP", suffix: "STREAM"))
        info.wordBank.append(Word(prefix: "BREAK", link: "UP", suffix: "SWING"))
        info.wordBank.append(Word(prefix: "BREAK", link: "UP", suffix: "TAKE"))
        
        info.wordBank.append(Word(prefix: "BREAK", link: "UP", suffix: "TOWN"))
        info.wordBank.append(Word(prefix: "BREAK", link: "UP", suffix: "TURN"))
        info.wordBank.append(Word(prefix: "BREAK", link: "UP", suffix: "WARD"))
        info.wordBank.append(Word(prefix: "BREAK", link: "UP", suffix: "WELLING"))
        info.wordBank.append(Word(prefix: "BREAK", link: "UP", suffix: "WIND"))
        // end up
        
        // start up - check
        info.wordBank.append(Word(prefix: "CHECK", link: "UP", suffix: "BEAT"))
        info.wordBank.append(Word(prefix: "CHECK", link: "UP", suffix: "BRINGING"))
        info.wordBank.append(Word(prefix: "CHECK", link: "UP", suffix: "COMING"))
        info.wordBank.append(Word(prefix: "CHECK", link: "UP", suffix: "DATE"))
        info.wordBank.append(Word(prefix: "CHECK", link: "UP", suffix: "DRAFT"))
        
        info.wordBank.append(Word(prefix: "CHECK", link: "UP", suffix: "GRADE"))
        info.wordBank.append(Word(prefix: "CHECK", link: "UP", suffix: "HILL"))
        info.wordBank.append(Word(prefix: "CHECK", link: "UP", suffix: "HOLD"))
        info.wordBank.append(Word(prefix: "CHECK", link: "UP", suffix: "KEEP"))
        info.wordBank.append(Word(prefix: "CHECK", link: "UP", suffix: "LIFT"))
        
        info.wordBank.append(Word(prefix: "CHECK", link: "UP", suffix: "LOAD"))
        info.wordBank.append(Word(prefix: "CHECK", link: "UP", suffix: "ON"))
        info.wordBank.append(Word(prefix: "CHECK", link: "UP", suffix: "RIGHT"))
        info.wordBank.append(Word(prefix: "CHECK", link: "UP", suffix: "RISING"))
        info.wordBank.append(Word(prefix: "CHECK", link: "UP", suffix: "ROAR"))
        
        info.wordBank.append(Word(prefix: "CHECK", link: "UP", suffix: "ROOT"))
        info.wordBank.append(Word(prefix: "CHECK", link: "UP", suffix: "SET"))
        info.wordBank.append(Word(prefix: "CHECK", link: "UP", suffix: "STAGE"))
        info.wordBank.append(Word(prefix: "CHECK", link: "UP", suffix: "STAIRS"))
        info.wordBank.append(Word(prefix: "CHECK", link: "UP", suffix: "STANDING"))
        
        info.wordBank.append(Word(prefix: "CHECK", link: "UP", suffix: "START"))
        info.wordBank.append(Word(prefix: "CHECK", link: "UP", suffix: "STATE"))
        info.wordBank.append(Word(prefix: "CHECK", link: "UP", suffix: "STREAM"))
        info.wordBank.append(Word(prefix: "CHECK", link: "UP", suffix: "SWING"))
        info.wordBank.append(Word(prefix: "CHECK", link: "UP", suffix: "TAKE"))
        
        info.wordBank.append(Word(prefix: "CHECK", link: "UP", suffix: "TOWN"))
        info.wordBank.append(Word(prefix: "CHECK", link: "UP", suffix: "TURN"))
        info.wordBank.append(Word(prefix: "CHECK", link: "UP", suffix: "WARD"))
        info.wordBank.append(Word(prefix: "CHECK", link: "UP", suffix: "WELLING"))
        info.wordBank.append(Word(prefix: "CHECK", link: "UP", suffix: "WIND"))
        // end up
        
        // start up - cut
        info.wordBank.append(Word(prefix: "CUT", link: "UP", suffix: "BEAT"))
        info.wordBank.append(Word(prefix: "CUT", link: "UP", suffix: "BRINGING"))
        info.wordBank.append(Word(prefix: "CUT", link: "UP", suffix: "COMING"))
        info.wordBank.append(Word(prefix: "CUT", link: "UP", suffix: "DATE"))
        info.wordBank.append(Word(prefix: "CUT", link: "UP", suffix: "DRAFT"))
        
        info.wordBank.append(Word(prefix: "CUT", link: "UP", suffix: "GRADE"))
        info.wordBank.append(Word(prefix: "CUT", link: "UP", suffix: "HILL"))
        info.wordBank.append(Word(prefix: "CUT", link: "UP", suffix: "HOLD"))
        info.wordBank.append(Word(prefix: "CUT", link: "UP", suffix: "KEEP"))
        info.wordBank.append(Word(prefix: "CUT", link: "UP", suffix: "LIFT"))
        
        info.wordBank.append(Word(prefix: "CUT", link: "UP", suffix: "LOAD"))
        info.wordBank.append(Word(prefix: "CUT", link: "UP", suffix: "ON"))
        info.wordBank.append(Word(prefix: "CUT", link: "UP", suffix: "RIGHT"))
        info.wordBank.append(Word(prefix: "CUT", link: "UP", suffix: "RISING"))
        info.wordBank.append(Word(prefix: "CUT", link: "UP", suffix: "ROAR"))
        
        info.wordBank.append(Word(prefix: "CUT", link: "UP", suffix: "ROOT"))
        info.wordBank.append(Word(prefix: "CUT", link: "UP", suffix: "SET"))
        info.wordBank.append(Word(prefix: "CUT", link: "UP", suffix: "STAGE"))
        info.wordBank.append(Word(prefix: "CUT", link: "UP", suffix: "STAIRS"))
        info.wordBank.append(Word(prefix: "CUT", link: "UP", suffix: "STANDING"))
        
        info.wordBank.append(Word(prefix: "CUT", link: "UP", suffix: "START"))
        info.wordBank.append(Word(prefix: "CUT", link: "UP", suffix: "STATE"))
        info.wordBank.append(Word(prefix: "CUT", link: "UP", suffix: "STREAM"))
        info.wordBank.append(Word(prefix: "CUT", link: "UP", suffix: "SWING"))
        info.wordBank.append(Word(prefix: "CUT", link: "UP", suffix: "TAKE"))
        
        info.wordBank.append(Word(prefix: "CUT", link: "UP", suffix: "TOWN"))
        info.wordBank.append(Word(prefix: "CUT", link: "UP", suffix: "TURN"))
        info.wordBank.append(Word(prefix: "CUT", link: "UP", suffix: "WARD"))
        info.wordBank.append(Word(prefix: "CUT", link: "UP", suffix: "WELLING"))
        info.wordBank.append(Word(prefix: "CUT", link: "UP", suffix: "WIND"))
        // end up
        
        // start up - grown
        info.wordBank.append(Word(prefix: "GROWN", link: "UP", suffix: "BEAT"))
        info.wordBank.append(Word(prefix: "GROWN", link: "UP", suffix: "BRINGING"))
        info.wordBank.append(Word(prefix: "GROWN", link: "UP", suffix: "COMING"))
        info.wordBank.append(Word(prefix: "GROWN", link: "UP", suffix: "DATE"))
        info.wordBank.append(Word(prefix: "GROWN", link: "UP", suffix: "DRAFT"))
        
        info.wordBank.append(Word(prefix: "GROWN", link: "UP", suffix: "GRADE"))
        info.wordBank.append(Word(prefix: "GROWN", link: "UP", suffix: "HILL"))
        info.wordBank.append(Word(prefix: "GROWN", link: "UP", suffix: "HOLD"))
        info.wordBank.append(Word(prefix: "GROWN", link: "UP", suffix: "KEEP"))
        info.wordBank.append(Word(prefix: "GROWN", link: "UP", suffix: "LIFT"))
        
        info.wordBank.append(Word(prefix: "GROWN", link: "UP", suffix: "LOAD"))
        info.wordBank.append(Word(prefix: "GROWN", link: "UP", suffix: "ON"))
        info.wordBank.append(Word(prefix: "GROWN", link: "UP", suffix: "RIGHT"))
        info.wordBank.append(Word(prefix: "GROWN", link: "UP", suffix: "RISING"))
        info.wordBank.append(Word(prefix: "GROWN", link: "UP", suffix: "ROAR"))
        
        info.wordBank.append(Word(prefix: "GROWN", link: "UP", suffix: "ROOT"))
        info.wordBank.append(Word(prefix: "GROWN", link: "UP", suffix: "SET"))
        info.wordBank.append(Word(prefix: "GROWN", link: "UP", suffix: "STAGE"))
        info.wordBank.append(Word(prefix: "GROWN", link: "UP", suffix: "STAIRS"))
        info.wordBank.append(Word(prefix: "GROWN", link: "UP", suffix: "STANDING"))
        
        info.wordBank.append(Word(prefix: "GROWN", link: "UP", suffix: "START"))
        info.wordBank.append(Word(prefix: "GROWN", link: "UP", suffix: "STATE"))
        info.wordBank.append(Word(prefix: "GROWN", link: "UP", suffix: "STREAM"))
        info.wordBank.append(Word(prefix: "GROWN", link: "UP", suffix: "SWING"))
        info.wordBank.append(Word(prefix: "GROWN", link: "UP", suffix: "TAKE"))
        
        info.wordBank.append(Word(prefix: "GROWN", link: "UP", suffix: "TOWN"))
        info.wordBank.append(Word(prefix: "GROWN", link: "UP", suffix: "TURN"))
        info.wordBank.append(Word(prefix: "GROWN", link: "UP", suffix: "WARD"))
        info.wordBank.append(Word(prefix: "GROWN", link: "UP", suffix: "WELLING"))
        info.wordBank.append(Word(prefix: "GROWN", link: "UP", suffix: "WIND"))
        // end up
        
        // start up - line
        info.wordBank.append(Word(prefix: "LINE", link: "UP", suffix: "BEAT"))
        info.wordBank.append(Word(prefix: "LINE", link: "UP", suffix: "BRINGING"))
        info.wordBank.append(Word(prefix: "LINE", link: "UP", suffix: "COMING"))
        info.wordBank.append(Word(prefix: "LINE", link: "UP", suffix: "DATE"))
        info.wordBank.append(Word(prefix: "LINE", link: "UP", suffix: "DRAFT"))
        
        info.wordBank.append(Word(prefix: "LINE", link: "UP", suffix: "GRADE"))
        info.wordBank.append(Word(prefix: "LINE", link: "UP", suffix: "HILL"))
        info.wordBank.append(Word(prefix: "LINE", link: "UP", suffix: "HOLD"))
        info.wordBank.append(Word(prefix: "LINE", link: "UP", suffix: "KEEP"))
        info.wordBank.append(Word(prefix: "LINE", link: "UP", suffix: "LIFT"))
        
        info.wordBank.append(Word(prefix: "LINE", link: "UP", suffix: "LOAD"))
        info.wordBank.append(Word(prefix: "LINE", link: "UP", suffix: "ON"))
        info.wordBank.append(Word(prefix: "LINE", link: "UP", suffix: "RIGHT"))
        info.wordBank.append(Word(prefix: "LINE", link: "UP", suffix: "RISING"))
        info.wordBank.append(Word(prefix: "LINE", link: "UP", suffix: "ROAR"))
        
        info.wordBank.append(Word(prefix: "LINE", link: "UP", suffix: "ROOT"))
        info.wordBank.append(Word(prefix: "LINE", link: "UP", suffix: "SET"))
        info.wordBank.append(Word(prefix: "LINE", link: "UP", suffix: "STAGE"))
        info.wordBank.append(Word(prefix: "LINE", link: "UP", suffix: "STAIRS"))
        info.wordBank.append(Word(prefix: "LINE", link: "UP", suffix: "STANDING"))
        
        info.wordBank.append(Word(prefix: "LINE", link: "UP", suffix: "START"))
        info.wordBank.append(Word(prefix: "LINE", link: "UP", suffix: "STATE"))
        info.wordBank.append(Word(prefix: "LINE", link: "UP", suffix: "STREAM"))
        info.wordBank.append(Word(prefix: "LINE", link: "UP", suffix: "SWING"))
        info.wordBank.append(Word(prefix: "LINE", link: "UP", suffix: "TAKE"))
        
        info.wordBank.append(Word(prefix: "LINE", link: "UP", suffix: "TOWN"))
        info.wordBank.append(Word(prefix: "LINE", link: "UP", suffix: "TURN"))
        info.wordBank.append(Word(prefix: "LINE", link: "UP", suffix: "WARD"))
        info.wordBank.append(Word(prefix: "LINE", link: "UP", suffix: "WELLING"))
        info.wordBank.append(Word(prefix: "LINE", link: "UP", suffix: "WIND"))
        // end up
        
        // start up - mock
        info.wordBank.append(Word(prefix: "MOCK", link: "UP", suffix: "BEAT"))
        info.wordBank.append(Word(prefix: "MOCK", link: "UP", suffix: "BRINGING"))
        info.wordBank.append(Word(prefix: "MOCK", link: "UP", suffix: "COMING"))
        info.wordBank.append(Word(prefix: "MOCK", link: "UP", suffix: "DATE"))
        info.wordBank.append(Word(prefix: "MOCK", link: "UP", suffix: "DRAFT"))
        
        info.wordBank.append(Word(prefix: "MOCK", link: "UP", suffix: "GRADE"))
        info.wordBank.append(Word(prefix: "MOCK", link: "UP", suffix: "HILL"))
        info.wordBank.append(Word(prefix: "MOCK", link: "UP", suffix: "HOLD"))
        info.wordBank.append(Word(prefix: "MOCK", link: "UP", suffix: "KEEP"))
        info.wordBank.append(Word(prefix: "MOCK", link: "UP", suffix: "LIFT"))
        
        info.wordBank.append(Word(prefix: "MOCK", link: "UP", suffix: "LOAD"))
        info.wordBank.append(Word(prefix: "MOCK", link: "UP", suffix: "ON"))
        info.wordBank.append(Word(prefix: "MOCK", link: "UP", suffix: "RIGHT"))
        info.wordBank.append(Word(prefix: "MOCK", link: "UP", suffix: "RISING"))
        info.wordBank.append(Word(prefix: "MOCK", link: "UP", suffix: "ROAR"))
        
        info.wordBank.append(Word(prefix: "MOCK", link: "UP", suffix: "ROOT"))
        info.wordBank.append(Word(prefix: "MOCK", link: "UP", suffix: "SET"))
        info.wordBank.append(Word(prefix: "MOCK", link: "UP", suffix: "STAGE"))
        info.wordBank.append(Word(prefix: "MOCK", link: "UP", suffix: "STAIRS"))
        info.wordBank.append(Word(prefix: "MOCK", link: "UP", suffix: "STANDING"))
        
        info.wordBank.append(Word(prefix: "MOCK", link: "UP", suffix: "START"))
        info.wordBank.append(Word(prefix: "MOCK", link: "UP", suffix: "STATE"))
        info.wordBank.append(Word(prefix: "MOCK", link: "UP", suffix: "STREAM"))
        info.wordBank.append(Word(prefix: "MOCK", link: "UP", suffix: "SWING"))
        info.wordBank.append(Word(prefix: "MOCK", link: "UP", suffix: "TAKE"))
        
        info.wordBank.append(Word(prefix: "MOCK", link: "UP", suffix: "TOWN"))
        info.wordBank.append(Word(prefix: "MOCK", link: "UP", suffix: "TURN"))
        info.wordBank.append(Word(prefix: "MOCK", link: "UP", suffix: "WARD"))
        info.wordBank.append(Word(prefix: "MOCK", link: "UP", suffix: "WELLING"))
        info.wordBank.append(Word(prefix: "MOCK", link: "UP", suffix: "WIND"))
        // end up
        
        // start up - pin
        info.wordBank.append(Word(prefix: "PIN", link: "UP", suffix: "BEAT"))
        info.wordBank.append(Word(prefix: "PIN", link: "UP", suffix: "BRINGING"))
        info.wordBank.append(Word(prefix: "PIN", link: "UP", suffix: "COMING"))
        info.wordBank.append(Word(prefix: "PIN", link: "UP", suffix: "DATE"))
        info.wordBank.append(Word(prefix: "PIN", link: "UP", suffix: "DRAFT"))
        
        info.wordBank.append(Word(prefix: "PIN", link: "UP", suffix: "GRADE"))
        info.wordBank.append(Word(prefix: "PIN", link: "UP", suffix: "HILL"))
        info.wordBank.append(Word(prefix: "PIN", link: "UP", suffix: "HOLD"))
        info.wordBank.append(Word(prefix: "PIN", link: "UP", suffix: "KEEP"))
        info.wordBank.append(Word(prefix: "PIN", link: "UP", suffix: "LIFT"))
        
        info.wordBank.append(Word(prefix: "PIN", link: "UP", suffix: "LOAD"))
        info.wordBank.append(Word(prefix: "PIN", link: "UP", suffix: "ON"))
        info.wordBank.append(Word(prefix: "PIN", link: "UP", suffix: "RIGHT"))
        info.wordBank.append(Word(prefix: "PIN", link: "UP", suffix: "RISING"))
        info.wordBank.append(Word(prefix: "PIN", link: "UP", suffix: "ROAR"))
        
        info.wordBank.append(Word(prefix: "PIN", link: "UP", suffix: "ROOT"))
        info.wordBank.append(Word(prefix: "PIN", link: "UP", suffix: "SET"))
        info.wordBank.append(Word(prefix: "PIN", link: "UP", suffix: "STAGE"))
        info.wordBank.append(Word(prefix: "PIN", link: "UP", suffix: "STAIRS"))
        info.wordBank.append(Word(prefix: "PIN", link: "UP", suffix: "STANDING"))
        
        info.wordBank.append(Word(prefix: "PIN", link: "UP", suffix: "START"))
        info.wordBank.append(Word(prefix: "PIN", link: "UP", suffix: "STATE"))
        info.wordBank.append(Word(prefix: "PIN", link: "UP", suffix: "STREAM"))
        info.wordBank.append(Word(prefix: "PIN", link: "UP", suffix: "SWING"))
        info.wordBank.append(Word(prefix: "PIN", link: "UP", suffix: "TAKE"))
        
        info.wordBank.append(Word(prefix: "PIN", link: "UP", suffix: "TOWN"))
        info.wordBank.append(Word(prefix: "PIN", link: "UP", suffix: "TURN"))
        info.wordBank.append(Word(prefix: "PIN", link: "UP", suffix: "WARD"))
        info.wordBank.append(Word(prefix: "PIN", link: "UP", suffix: "WELLING"))
        info.wordBank.append(Word(prefix: "PIN", link: "UP", suffix: "WIND"))
        // end up
        
        // start up - round
        info.wordBank.append(Word(prefix: "ROUND", link: "UP", suffix: "BEAT"))
        info.wordBank.append(Word(prefix: "ROUND", link: "UP", suffix: "BRINGING"))
        info.wordBank.append(Word(prefix: "ROUND", link: "UP", suffix: "COMING"))
        info.wordBank.append(Word(prefix: "ROUND", link: "UP", suffix: "DATE"))
        info.wordBank.append(Word(prefix: "ROUND", link: "UP", suffix: "DRAFT"))
        
        info.wordBank.append(Word(prefix: "ROUND", link: "UP", suffix: "GRADE"))
        info.wordBank.append(Word(prefix: "ROUND", link: "UP", suffix: "HILL"))
        info.wordBank.append(Word(prefix: "ROUND", link: "UP", suffix: "HOLD"))
        info.wordBank.append(Word(prefix: "ROUND", link: "UP", suffix: "KEEP"))
        info.wordBank.append(Word(prefix: "ROUND", link: "UP", suffix: "LIFT"))
        
        info.wordBank.append(Word(prefix: "ROUND", link: "UP", suffix: "LOAD"))
        info.wordBank.append(Word(prefix: "ROUND", link: "UP", suffix: "ON"))
        info.wordBank.append(Word(prefix: "ROUND", link: "UP", suffix: "RIGHT"))
        info.wordBank.append(Word(prefix: "ROUND", link: "UP", suffix: "RISING"))
        info.wordBank.append(Word(prefix: "ROUND", link: "UP", suffix: "ROAR"))
        
        info.wordBank.append(Word(prefix: "ROUND", link: "UP", suffix: "ROOT"))
        info.wordBank.append(Word(prefix: "ROUND", link: "UP", suffix: "SET"))
        info.wordBank.append(Word(prefix: "ROUND", link: "UP", suffix: "STAGE"))
        info.wordBank.append(Word(prefix: "ROUND", link: "UP", suffix: "STAIRS"))
        info.wordBank.append(Word(prefix: "ROUND", link: "UP", suffix: "STANDING"))
        
        info.wordBank.append(Word(prefix: "ROUND", link: "UP", suffix: "START"))
        info.wordBank.append(Word(prefix: "ROUND", link: "UP", suffix: "STATE"))
        info.wordBank.append(Word(prefix: "ROUND", link: "UP", suffix: "STREAM"))
        info.wordBank.append(Word(prefix: "ROUND", link: "UP", suffix: "SWING"))
        info.wordBank.append(Word(prefix: "ROUND", link: "UP", suffix: "TAKE"))
        
        info.wordBank.append(Word(prefix: "ROUND", link: "UP", suffix: "TOWN"))
        info.wordBank.append(Word(prefix: "ROUND", link: "UP", suffix: "TURN"))
        info.wordBank.append(Word(prefix: "ROUND", link: "UP", suffix: "WARD"))
        info.wordBank.append(Word(prefix: "ROUND", link: "UP", suffix: "WELLING"))
        info.wordBank.append(Word(prefix: "ROUND", link: "UP", suffix: "WIND"))
        // end up
        
        // start up - startup
        info.wordBank.append(Word(prefix: "START", link: "UP", suffix: "BEAT"))
        info.wordBank.append(Word(prefix: "START", link: "UP", suffix: "BRINGING"))
        info.wordBank.append(Word(prefix: "START", link: "UP", suffix: "COMING"))
        info.wordBank.append(Word(prefix: "START", link: "UP", suffix: "DATE"))
        info.wordBank.append(Word(prefix: "START", link: "UP", suffix: "DRAFT"))
        
        info.wordBank.append(Word(prefix: "START", link: "UP", suffix: "GRADE"))
        info.wordBank.append(Word(prefix: "START", link: "UP", suffix: "HILL"))
        info.wordBank.append(Word(prefix: "START", link: "UP", suffix: "HOLD"))
        info.wordBank.append(Word(prefix: "START", link: "UP", suffix: "KEEP"))
        info.wordBank.append(Word(prefix: "START", link: "UP", suffix: "LIFT"))
        
        info.wordBank.append(Word(prefix: "START", link: "UP", suffix: "LOAD"))
        info.wordBank.append(Word(prefix: "START", link: "UP", suffix: "ON"))
        info.wordBank.append(Word(prefix: "START", link: "UP", suffix: "RIGHT"))
        info.wordBank.append(Word(prefix: "START", link: "UP", suffix: "RISING"))
        info.wordBank.append(Word(prefix: "START", link: "UP", suffix: "ROAR"))
        
        info.wordBank.append(Word(prefix: "START", link: "UP", suffix: "ROOT"))
        info.wordBank.append(Word(prefix: "START", link: "UP", suffix: "SET"))
        info.wordBank.append(Word(prefix: "START", link: "UP", suffix: "STAGE"))
        info.wordBank.append(Word(prefix: "START", link: "UP", suffix: "STAIRS"))
        info.wordBank.append(Word(prefix: "START", link: "UP", suffix: "STANDING"))
        
        info.wordBank.append(Word(prefix: "START", link: "UP", suffix: "START"))
        info.wordBank.append(Word(prefix: "START", link: "UP", suffix: "STATE"))
        info.wordBank.append(Word(prefix: "START", link: "UP", suffix: "STREAM"))
        info.wordBank.append(Word(prefix: "START", link: "UP", suffix: "SWING"))
        info.wordBank.append(Word(prefix: "START", link: "UP", suffix: "TAKE"))
        
        info.wordBank.append(Word(prefix: "START", link: "UP", suffix: "TOWN"))
        info.wordBank.append(Word(prefix: "START", link: "UP", suffix: "TURN"))
        info.wordBank.append(Word(prefix: "START", link: "UP", suffix: "WARD"))
        info.wordBank.append(Word(prefix: "START", link: "UP", suffix: "WELLING"))
        info.wordBank.append(Word(prefix: "START", link: "UP", suffix: "WIND"))
        // end up
        
        // start up - sun
        info.wordBank.append(Word(prefix: "SUN", link: "UP", suffix: "BEAT"))
        info.wordBank.append(Word(prefix: "SUN", link: "UP", suffix: "BRINGING"))
        info.wordBank.append(Word(prefix: "SUN", link: "UP", suffix: "COMING"))
        info.wordBank.append(Word(prefix: "SUN", link: "UP", suffix: "DATE"))
        info.wordBank.append(Word(prefix: "SUN", link: "UP", suffix: "DRAFT"))
        
        info.wordBank.append(Word(prefix: "SUN", link: "UP", suffix: "GRADE"))
        info.wordBank.append(Word(prefix: "SUN", link: "UP", suffix: "HILL"))
        info.wordBank.append(Word(prefix: "SUN", link: "UP", suffix: "HOLD"))
        info.wordBank.append(Word(prefix: "SUN", link: "UP", suffix: "KEEP"))
        info.wordBank.append(Word(prefix: "SUN", link: "UP", suffix: "LIFT"))
        
        info.wordBank.append(Word(prefix: "SUN", link: "UP", suffix: "LOAD"))
        info.wordBank.append(Word(prefix: "SUN", link: "UP", suffix: "ON"))
        info.wordBank.append(Word(prefix: "SUN", link: "UP", suffix: "RIGHT"))
        info.wordBank.append(Word(prefix: "SUN", link: "UP", suffix: "RISING"))
        info.wordBank.append(Word(prefix: "SUN", link: "UP", suffix: "ROAR"))
        
        info.wordBank.append(Word(prefix: "SUN", link: "UP", suffix: "ROOT"))
        info.wordBank.append(Word(prefix: "SUN", link: "UP", suffix: "SET"))
        info.wordBank.append(Word(prefix: "SUN", link: "UP", suffix: "STAGE"))
        info.wordBank.append(Word(prefix: "SUN", link: "UP", suffix: "STAIRS"))
        info.wordBank.append(Word(prefix: "SUN", link: "UP", suffix: "STANDING"))
        
        info.wordBank.append(Word(prefix: "SUN", link: "UP", suffix: "START"))
        info.wordBank.append(Word(prefix: "SUN", link: "UP", suffix: "STATE"))
        info.wordBank.append(Word(prefix: "SUN", link: "UP", suffix: "STREAM"))
        info.wordBank.append(Word(prefix: "SUN", link: "UP", suffix: "SWING"))
        info.wordBank.append(Word(prefix: "SUN", link: "UP", suffix: "TAKE"))
        
        info.wordBank.append(Word(prefix: "SUN", link: "UP", suffix: "TOWN"))
        info.wordBank.append(Word(prefix: "SUN", link: "UP", suffix: "TURN"))
        info.wordBank.append(Word(prefix: "SUN", link: "UP", suffix: "WARD"))
        info.wordBank.append(Word(prefix: "SUN", link: "UP", suffix: "WELLING"))
        info.wordBank.append(Word(prefix: "SUN", link: "UP", suffix: "WIND"))
        // end up
        
        // start up - warm
        info.wordBank.append(Word(prefix: "WARM", link: "UP", suffix: "BEAT"))
        info.wordBank.append(Word(prefix: "WARM", link: "UP", suffix: "BRINGING"))
        info.wordBank.append(Word(prefix: "WARM", link: "UP", suffix: "COMING"))
        info.wordBank.append(Word(prefix: "WARM", link: "UP", suffix: "DATE"))
        info.wordBank.append(Word(prefix: "WARM", link: "UP", suffix: "DRAFT"))
        
        info.wordBank.append(Word(prefix: "WARM", link: "UP", suffix: "GRADE"))
        info.wordBank.append(Word(prefix: "WARM", link: "UP", suffix: "HILL"))
        info.wordBank.append(Word(prefix: "WARM", link: "UP", suffix: "HOLD"))
        info.wordBank.append(Word(prefix: "WARM", link: "UP", suffix: "KEEP"))
        info.wordBank.append(Word(prefix: "WARM", link: "UP", suffix: "LIFT"))
        
        info.wordBank.append(Word(prefix: "WARM", link: "UP", suffix: "LOAD"))
        info.wordBank.append(Word(prefix: "WARM", link: "UP", suffix: "ON"))
        info.wordBank.append(Word(prefix: "WARM", link: "UP", suffix: "RIGHT"))
        info.wordBank.append(Word(prefix: "WARM", link: "UP", suffix: "RISING"))
        info.wordBank.append(Word(prefix: "WARM", link: "UP", suffix: "ROAR"))
        
        info.wordBank.append(Word(prefix: "WARM", link: "UP", suffix: "ROOT"))
        info.wordBank.append(Word(prefix: "WARM", link: "UP", suffix: "SET"))
        info.wordBank.append(Word(prefix: "WARM", link: "UP", suffix: "STAGE"))
        info.wordBank.append(Word(prefix: "WARM", link: "UP", suffix: "STAIRS"))
        info.wordBank.append(Word(prefix: "WARM", link: "UP", suffix: "STANDING"))
        
        info.wordBank.append(Word(prefix: "WARM", link: "UP", suffix: "START"))
        info.wordBank.append(Word(prefix: "WARM", link: "UP", suffix: "STATE"))
        info.wordBank.append(Word(prefix: "WARM", link: "UP", suffix: "STREAM"))
        info.wordBank.append(Word(prefix: "WARM", link: "UP", suffix: "SWING"))
        info.wordBank.append(Word(prefix: "WARM", link: "UP", suffix: "TAKE"))
        
        info.wordBank.append(Word(prefix: "WARM", link: "UP", suffix: "TOWN"))
        info.wordBank.append(Word(prefix: "WARM", link: "UP", suffix: "TURN"))
        info.wordBank.append(Word(prefix: "WARM", link: "UP", suffix: "WARD"))
        info.wordBank.append(Word(prefix: "WARM", link: "UP", suffix: "WELLING"))
        info.wordBank.append(Word(prefix: "WARM", link: "UP", suffix: "WIND"))
        // end up
        
        info.wordBank.append(Word(prefix: "SUPER", link: "USER", suffix: "NAME"))
        
        info.wordBank.append(Word(prefix: "OVER", link: "VIEW", suffix: "POINT"))
        
        info.wordBank.append(Word(prefix: "GRAPE", link: "VINE", suffix: "YARD"))
        
        info.wordBank.append(Word(prefix: "CROSS", link: "WALK", suffix: "OUT"))
        info.wordBank.append(Word(prefix: "CROSS", link: "WALK", suffix: "WAY"))
        info.wordBank.append(Word(prefix: "SIDE", link: "WALK", suffix: "OUT"))
        info.wordBank.append(Word(prefix: "SIDE", link: "WALK", suffix: "WAY"))
        
        info.wordBank.append(Word(prefix: "SEA", link: "WALL", suffix: "FLOWER"))
        info.wordBank.append(Word(prefix: "SEA", link: "WALL", suffix: "PAPER"))
        info.wordBank.append(Word(prefix: "STONE", link: "WALL", suffix: "FLOWER"))
        info.wordBank.append(Word(prefix: "STONE", link: "WALL", suffix: "PAPER"))
        info.wordBank.append(Word(prefix: "WHITE", link: "WALL", suffix: "FLOWER"))
        info.wordBank.append(Word(prefix: "WHITE", link: "WALL", suffix: "PAPER"))
        
        info.wordBank.append(Word(prefix: "BRAIN", link: "WASH", suffix: "CLOTH"))
        info.wordBank.append(Word(prefix: "BRAIN", link: "WASH", suffix: "STAND"))
        info.wordBank.append(Word(prefix: "HOG", link: "WASH", suffix: "CLOTH"))
        info.wordBank.append(Word(prefix: "HOG", link: "WASH", suffix: "STAND"))
        info.wordBank.append(Word(prefix: "WHITE", link: "WASH", suffix: "CLOTH"))
        info.wordBank.append(Word(prefix: "WHITE", link: "WASH", suffix: "STAND"))
        
        info.wordBank.append(Word(prefix: "WORLD", link: "WIDE", suffix: "SCREEN"))
        info.wordBank.append(Word(prefix: "WORLD", link: "WIDE", suffix: "SPREAD"))
        
        // start wind - down
        info.wordBank.append(Word(prefix: "DOWN", link: "WIND", suffix: "BREAKER"))
        info.wordBank.append(Word(prefix: "DOWN", link: "WIND", suffix: "FALL"))
        info.wordBank.append(Word(prefix: "DOWN", link: "WIND", suffix: "MILL"))
        info.wordBank.append(Word(prefix: "DOWN", link: "WIND", suffix: "PIPE"))
        info.wordBank.append(Word(prefix: "DOWN", link: "WIND", suffix: "SHIELD"))
        info.wordBank.append(Word(prefix: "DOWN", link: "WIND", suffix: "SOCK"))
        info.wordBank.append(Word(prefix: "DOWN", link: "WIND", suffix: "STORM"))
        info.wordBank.append(Word(prefix: "DOWN", link: "WIND", suffix: "SWEPT"))
        info.wordBank.append(Word(prefix: "DOWN", link: "WIND", suffix: "WARD"))
        // end wind
        
        // start wind - up
        info.wordBank.append(Word(prefix: "UP", link: "WIND", suffix: "BREAKER"))
        info.wordBank.append(Word(prefix: "UP", link: "WIND", suffix: "FALL"))
        info.wordBank.append(Word(prefix: "UP", link: "WIND", suffix: "MILL"))
        info.wordBank.append(Word(prefix: "UP", link: "WIND", suffix: "PIPE"))
        info.wordBank.append(Word(prefix: "UP", link: "WIND", suffix: "SHIELD"))
        info.wordBank.append(Word(prefix: "UP", link: "WIND", suffix: "SOCK"))
        info.wordBank.append(Word(prefix: "UP", link: "WIND", suffix: "STORM"))
        info.wordBank.append(Word(prefix: "UP", link: "WIND", suffix: "SWEPT"))
        info.wordBank.append(Word(prefix: "UP", link: "WIND", suffix: "WARD"))
        // end wind
        
        // start wind - whirl
        info.wordBank.append(Word(prefix: "WHIRL", link: "WIND", suffix: "BREAKER"))
        info.wordBank.append(Word(prefix: "WHIRL", link: "WIND", suffix: "FALL"))
        info.wordBank.append(Word(prefix: "WHIRL", link: "WIND", suffix: "MILL"))
        info.wordBank.append(Word(prefix: "WHIRL", link: "WIND", suffix: "PIPE"))
        info.wordBank.append(Word(prefix: "WHIRL", link: "WIND", suffix: "SHIELD"))
        info.wordBank.append(Word(prefix: "WHIRL", link: "WIND", suffix: "SOCK"))
        info.wordBank.append(Word(prefix: "WHIRL", link: "WIND", suffix: "STORM"))
        info.wordBank.append(Word(prefix: "WHIRL", link: "WIND", suffix: "SWEPT"))
        info.wordBank.append(Word(prefix: "WHIRL", link: "WIND", suffix: "WARD"))
        // end wind
        
        info.wordBank.append(Word(prefix: "LEFT", link: "WING", suffix: "SPAN"))
        info.wordBank.append(Word(prefix: "LEFT", link: "WING", suffix: "SPREAD"))
        info.wordBank.append(Word(prefix: "RIGHT", link: "WING", suffix: "SPAN"))
        info.wordBank.append(Word(prefix: "RIGHT", link: "WING", suffix: "SPREAD"))
        
        info.wordBank.append(Word(prefix: "HARD", link: "WIRE", suffix: "TAP"))
        info.wordBank.append(Word(prefix: "HAY", link: "WIRE", suffix: "TAP"))
        info.wordBank.append(Word(prefix: "HIGH", link: "WIRE", suffix: "TAP"))
        info.wordBank.append(Word(prefix: "HOT", link: "WIRE", suffix: "TAP"))
        
        info.wordBank.append(Word(prefix: "CLOCK", link: "WISE", suffix: "CRACK"))
        info.wordBank.append(Word(prefix: "OTHER", link: "WISE", suffix: "CRACK"))
        
        info.wordBank.append(Word(prefix: "FORTH", link: "WITH", suffix: "DRAW"))
        info.wordBank.append(Word(prefix: "FORTH", link: "WITH", suffix: "HOLD"))
        info.wordBank.append(Word(prefix: "FORTH", link: "WITH", suffix: "IN"))
        info.wordBank.append(Word(prefix: "FORTH", link: "WITH", suffix: "OUT"))
        info.wordBank.append(Word(prefix: "FORTH", link: "WITH", suffix: "STAND"))
        
        // start wood - dog
        info.wordBank.append(Word(prefix: "DOG", link: "WOOD", suffix: "CARVER"))
        info.wordBank.append(Word(prefix: "DOG", link: "WOOD", suffix: "CHUCK"))
        info.wordBank.append(Word(prefix: "DOG", link: "WOOD", suffix: "CUTTER"))
        info.wordBank.append(Word(prefix: "DOG", link: "WOOD", suffix: "LAND"))
        info.wordBank.append(Word(prefix: "DOG", link: "WOOD", suffix: "PECKER"))
        info.wordBank.append(Word(prefix: "DOG", link: "WOOD", suffix: "WORK"))
        // end wood
        
        // start wood - drift
        info.wordBank.append(Word(prefix: "DRIFT", link: "WOOD", suffix: "CARVER"))
        info.wordBank.append(Word(prefix: "DRIFT", link: "WOOD", suffix: "CHUCK"))
        info.wordBank.append(Word(prefix: "DRIFT", link: "WOOD", suffix: "CUTTER"))
        info.wordBank.append(Word(prefix: "DRIFT", link: "WOOD", suffix: "LAND"))
        info.wordBank.append(Word(prefix: "DRIFT", link: "WOOD", suffix: "PECKER"))
        info.wordBank.append(Word(prefix: "DRIFT", link: "WOOD", suffix: "WORK"))
        // end wood
        
        // start wood - fire
        info.wordBank.append(Word(prefix: "FIRE", link: "WOOD", suffix: "CARVER"))
        info.wordBank.append(Word(prefix: "FIRE", link: "WOOD", suffix: "CHUCK"))
        info.wordBank.append(Word(prefix: "FIRE", link: "WOOD", suffix: "CUTTER"))
        info.wordBank.append(Word(prefix: "FIRE", link: "WOOD", suffix: "LAND"))
        info.wordBank.append(Word(prefix: "FIRE", link: "WOOD", suffix: "PECKER"))
        info.wordBank.append(Word(prefix: "FIRE", link: "WOOD", suffix: "WORK"))
        // end wood
        
        // start wood - ply
        info.wordBank.append(Word(prefix: "PLY", link: "WOOD", suffix: "CARVER"))
        info.wordBank.append(Word(prefix: "PLY", link: "WOOD", suffix: "CHUCK"))
        info.wordBank.append(Word(prefix: "PLY", link: "WOOD", suffix: "CUTTER"))
        info.wordBank.append(Word(prefix: "PLY", link: "WOOD", suffix: "LAND"))
        info.wordBank.append(Word(prefix: "PLY", link: "WOOD", suffix: "PECKER"))
        info.wordBank.append(Word(prefix: "PLY", link: "WOOD", suffix: "WORK"))
        // end wood
        
        // start wood - red
        info.wordBank.append(Word(prefix: "RED", link: "WOOD", suffix: "CARVER"))
        info.wordBank.append(Word(prefix: "RED", link: "WOOD", suffix: "CHUCK"))
        info.wordBank.append(Word(prefix: "RED", link: "WOOD", suffix: "CUTTER"))
        info.wordBank.append(Word(prefix: "RED", link: "WOOD", suffix: "LAND"))
        info.wordBank.append(Word(prefix: "RED", link: "WOOD", suffix: "PECKER"))
        info.wordBank.append(Word(prefix: "RED", link: "WOOD", suffix: "WORK"))
        // end wood
        
        // start work - art
        info.wordBank.append(Word(prefix: "ART", link: "WORK", suffix: "BENCH"))
        info.wordBank.append(Word(prefix: "ART", link: "WORK", suffix: "BOOK"))
        info.wordBank.append(Word(prefix: "ART", link: "WORK", suffix: "DAY"))
        info.wordBank.append(Word(prefix: "ART", link: "WORK", suffix: "HORSE"))
        info.wordBank.append(Word(prefix: "ART", link: "WORK", suffix: "MAN"))
        
        info.wordBank.append(Word(prefix: "ART", link: "WORK", suffix: "OUT"))
        info.wordBank.append(Word(prefix: "ART", link: "WORK", suffix: "PLACE"))
        info.wordBank.append(Word(prefix: "ART", link: "WORK", suffix: "ROOM"))
        info.wordBank.append(Word(prefix: "ART", link: "WORK", suffix: "SHOP"))
        info.wordBank.append(Word(prefix: "ART", link: "WORK", suffix: "STATION"))
        info.wordBank.append(Word(prefix: "ART", link: "WORK", suffix: "TABLE"))
        // end work
        
        // start work - class
        info.wordBank.append(Word(prefix: "CLASS", link: "WORK", suffix: "BENCH"))
        info.wordBank.append(Word(prefix: "CLASS", link: "WORK", suffix: "BOOK"))
        info.wordBank.append(Word(prefix: "CLASS", link: "WORK", suffix: "DAY"))
        info.wordBank.append(Word(prefix: "CLASS", link: "WORK", suffix: "HORSE"))
        info.wordBank.append(Word(prefix: "CLASS", link: "WORK", suffix: "MAN"))
        
        info.wordBank.append(Word(prefix: "CLASS", link: "WORK", suffix: "OUT"))
        info.wordBank.append(Word(prefix: "CLASS", link: "WORK", suffix: "PLACE"))
        info.wordBank.append(Word(prefix: "CLASS", link: "WORK", suffix: "ROOM"))
        info.wordBank.append(Word(prefix: "CLASS", link: "WORK", suffix: "SHOP"))
        info.wordBank.append(Word(prefix: "CLASS", link: "WORK", suffix: "STATION"))
        info.wordBank.append(Word(prefix: "CLASS", link: "WORK", suffix: "TABLE"))
        // end work
        
        // start work - clock
        info.wordBank.append(Word(prefix: "CLOCK", link: "WORK", suffix: "BENCH"))
        info.wordBank.append(Word(prefix: "CLOCK", link: "WORK", suffix: "BOOK"))
        info.wordBank.append(Word(prefix: "CLOCK", link: "WORK", suffix: "DAY"))
        info.wordBank.append(Word(prefix: "CLOCK", link: "WORK", suffix: "HORSE"))
        info.wordBank.append(Word(prefix: "CLOCK", link: "WORK", suffix: "MAN"))
        
        info.wordBank.append(Word(prefix: "CLOCK", link: "WORK", suffix: "OUT"))
        info.wordBank.append(Word(prefix: "CLOCK", link: "WORK", suffix: "PLACE"))
        info.wordBank.append(Word(prefix: "CLOCK", link: "WORK", suffix: "ROOM"))
        info.wordBank.append(Word(prefix: "CLOCK", link: "WORK", suffix: "SHOP"))
        info.wordBank.append(Word(prefix: "CLOCK", link: "WORK", suffix: "STATION"))
        info.wordBank.append(Word(prefix: "CLOCK", link: "WORK", suffix: "TABLE"))
        // end work
        
        // start work - frame
        info.wordBank.append(Word(prefix: "FRAME", link: "WORK", suffix: "BENCH"))
        info.wordBank.append(Word(prefix: "FRAME", link: "WORK", suffix: "BOOK"))
        info.wordBank.append(Word(prefix: "FRAME", link: "WORK", suffix: "DAY"))
        info.wordBank.append(Word(prefix: "FRAME", link: "WORK", suffix: "HORSE"))
        info.wordBank.append(Word(prefix: "FRAME", link: "WORK", suffix: "MAN"))
        
        info.wordBank.append(Word(prefix: "FRAME", link: "WORK", suffix: "OUT"))
        info.wordBank.append(Word(prefix: "FRAME", link: "WORK", suffix: "PLACE"))
        info.wordBank.append(Word(prefix: "FRAME", link: "WORK", suffix: "ROOM"))
        info.wordBank.append(Word(prefix: "FRAME", link: "WORK", suffix: "SHOP"))
        info.wordBank.append(Word(prefix: "FRAME", link: "WORK", suffix: "STATION"))
        info.wordBank.append(Word(prefix: "FRAME", link: "WORK", suffix: "TABLE"))
        // end work
        
        // start work - ground
        info.wordBank.append(Word(prefix: "GROUND", link: "WORK", suffix: "BENCH"))
        info.wordBank.append(Word(prefix: "GROUND", link: "WORK", suffix: "BOOK"))
        info.wordBank.append(Word(prefix: "GROUND", link: "WORK", suffix: "DAY"))
        info.wordBank.append(Word(prefix: "GROUND", link: "WORK", suffix: "HORSE"))
        info.wordBank.append(Word(prefix: "GROUND", link: "WORK", suffix: "MAN"))
        
        info.wordBank.append(Word(prefix: "GROUND", link: "WORK", suffix: "OUT"))
        info.wordBank.append(Word(prefix: "GROUND", link: "WORK", suffix: "PLACE"))
        info.wordBank.append(Word(prefix: "GROUND", link: "WORK", suffix: "ROOM"))
        info.wordBank.append(Word(prefix: "GROUND", link: "WORK", suffix: "SHOP"))
        info.wordBank.append(Word(prefix: "GROUND", link: "WORK", suffix: "STATION"))
        info.wordBank.append(Word(prefix: "GROUND", link: "WORK", suffix: "TABLE"))
        // end work
        
        // start work - hand
        info.wordBank.append(Word(prefix: "HAND", link: "WORK", suffix: "BENCH"))
        info.wordBank.append(Word(prefix: "HAND", link: "WORK", suffix: "BOOK"))
        info.wordBank.append(Word(prefix: "HAND", link: "WORK", suffix: "DAY"))
        info.wordBank.append(Word(prefix: "HAND", link: "WORK", suffix: "HORSE"))
        info.wordBank.append(Word(prefix: "HAND", link: "WORK", suffix: "MAN"))
        
        info.wordBank.append(Word(prefix: "HAND", link: "WORK", suffix: "OUT"))
        info.wordBank.append(Word(prefix: "HAND", link: "WORK", suffix: "PLACE"))
        info.wordBank.append(Word(prefix: "HAND", link: "WORK", suffix: "ROOM"))
        info.wordBank.append(Word(prefix: "HAND", link: "WORK", suffix: "SHOP"))
        info.wordBank.append(Word(prefix: "HAND", link: "WORK", suffix: "STATION"))
        info.wordBank.append(Word(prefix: "HAND", link: "WORK", suffix: "TABLE"))
        // end work
        
        // start work - home
        info.wordBank.append(Word(prefix: "HOME", link: "WORK", suffix: "BENCH"))
        info.wordBank.append(Word(prefix: "HOME", link: "WORK", suffix: "BOOK"))
        info.wordBank.append(Word(prefix: "HOME", link: "WORK", suffix: "DAY"))
        info.wordBank.append(Word(prefix: "HOME", link: "WORK", suffix: "HORSE"))
        info.wordBank.append(Word(prefix: "HOME", link: "WORK", suffix: "MAN"))
        
        info.wordBank.append(Word(prefix: "HOME", link: "WORK", suffix: "OUT"))
        info.wordBank.append(Word(prefix: "HOME", link: "WORK", suffix: "PLACE"))
        info.wordBank.append(Word(prefix: "HOME", link: "WORK", suffix: "ROOM"))
        info.wordBank.append(Word(prefix: "HOME", link: "WORK", suffix: "SHOP"))
        info.wordBank.append(Word(prefix: "HOME", link: "WORK", suffix: "STATION"))
        info.wordBank.append(Word(prefix: "HOME", link: "WORK", suffix: "TABLE"))
        // end work
        
        // start work - house
        info.wordBank.append(Word(prefix: "HOUSE", link: "WORK", suffix: "BENCH"))
        info.wordBank.append(Word(prefix: "HOUSE", link: "WORK", suffix: "BOOK"))
        info.wordBank.append(Word(prefix: "HOUSE", link: "WORK", suffix: "DAY"))
        info.wordBank.append(Word(prefix: "HOUSE", link: "WORK", suffix: "HORSE"))
        info.wordBank.append(Word(prefix: "HOUSE", link: "WORK", suffix: "MAN"))
        
        info.wordBank.append(Word(prefix: "HOUSE", link: "WORK", suffix: "OUT"))
        info.wordBank.append(Word(prefix: "HOUSE", link: "WORK", suffix: "PLACE"))
        info.wordBank.append(Word(prefix: "HOUSE", link: "WORK", suffix: "ROOM"))
        info.wordBank.append(Word(prefix: "HOUSE", link: "WORK", suffix: "SHOP"))
        info.wordBank.append(Word(prefix: "HOUSE", link: "WORK", suffix: "STATION"))
        info.wordBank.append(Word(prefix: "HOUSE", link: "WORK", suffix: "TABLE"))
        // end work
        
        // start work - needle
        info.wordBank.append(Word(prefix: "NEEDLE", link: "WORK", suffix: "BENCH"))
        info.wordBank.append(Word(prefix: "NEEDLE", link: "WORK", suffix: "BOOK"))
        info.wordBank.append(Word(prefix: "NEEDLE", link: "WORK", suffix: "DAY"))
        info.wordBank.append(Word(prefix: "NEEDLE", link: "WORK", suffix: "HORSE"))
        info.wordBank.append(Word(prefix: "NEEDLE", link: "WORK", suffix: "MAN"))
        
        info.wordBank.append(Word(prefix: "NEEDLE", link: "WORK", suffix: "OUT"))
        info.wordBank.append(Word(prefix: "NEEDLE", link: "WORK", suffix: "PLACE"))
        info.wordBank.append(Word(prefix: "NEEDLE", link: "WORK", suffix: "ROOM"))
        info.wordBank.append(Word(prefix: "NEEDLE", link: "WORK", suffix: "SHOP"))
        info.wordBank.append(Word(prefix: "NEEDLE", link: "WORK", suffix: "STATION"))
        info.wordBank.append(Word(prefix: "NEEDLE", link: "WORK", suffix: "TABLE"))
        // end work
        
        // start work - net
        info.wordBank.append(Word(prefix: "NET", link: "WORK", suffix: "BENCH"))
        info.wordBank.append(Word(prefix: "NET", link: "WORK", suffix: "BOOK"))
        info.wordBank.append(Word(prefix: "NET", link: "WORK", suffix: "DAY"))
        info.wordBank.append(Word(prefix: "NET", link: "WORK", suffix: "HORSE"))
        info.wordBank.append(Word(prefix: "NET", link: "WORK", suffix: "MAN"))
        
        info.wordBank.append(Word(prefix: "NET", link: "WORK", suffix: "OUT"))
        info.wordBank.append(Word(prefix: "NET", link: "WORK", suffix: "PLACE"))
        info.wordBank.append(Word(prefix: "NET", link: "WORK", suffix: "ROOM"))
        info.wordBank.append(Word(prefix: "NET", link: "WORK", suffix: "SHOP"))
        info.wordBank.append(Word(prefix: "NET", link: "WORK", suffix: "STATION"))
        info.wordBank.append(Word(prefix: "NET", link: "WORK", suffix: "TABLE"))
        // end work
        
        // start work - over
        info.wordBank.append(Word(prefix: "OVER", link: "WORK", suffix: "BENCH"))
        info.wordBank.append(Word(prefix: "OVER", link: "WORK", suffix: "BOOK"))
        info.wordBank.append(Word(prefix: "OVER", link: "WORK", suffix: "DAY"))
        info.wordBank.append(Word(prefix: "OVER", link: "WORK", suffix: "HORSE"))
        info.wordBank.append(Word(prefix: "OVER", link: "WORK", suffix: "MAN"))
        
        info.wordBank.append(Word(prefix: "OVER", link: "WORK", suffix: "OUT"))
        info.wordBank.append(Word(prefix: "OVER", link: "WORK", suffix: "PLACE"))
        info.wordBank.append(Word(prefix: "OVER", link: "WORK", suffix: "ROOM"))
        info.wordBank.append(Word(prefix: "OVER", link: "WORK", suffix: "SHOP"))
        info.wordBank.append(Word(prefix: "OVER", link: "WORK", suffix: "STATION"))
        info.wordBank.append(Word(prefix: "OVER", link: "WORK", suffix: "TABLE"))
        // end work
        
        // start work - paper
        info.wordBank.append(Word(prefix: "PAPER", link: "WORK", suffix: "BENCH"))
        info.wordBank.append(Word(prefix: "PAPER", link: "WORK", suffix: "BOOK"))
        info.wordBank.append(Word(prefix: "PAPER", link: "WORK", suffix: "DAY"))
        info.wordBank.append(Word(prefix: "PAPER", link: "WORK", suffix: "HORSE"))
        info.wordBank.append(Word(prefix: "PAPER", link: "WORK", suffix: "MAN"))
        
        info.wordBank.append(Word(prefix: "PAPER", link: "WORK", suffix: "OUT"))
        info.wordBank.append(Word(prefix: "PAPER", link: "WORK", suffix: "PLACE"))
        info.wordBank.append(Word(prefix: "PAPER", link: "WORK", suffix: "ROOM"))
        info.wordBank.append(Word(prefix: "PAPER", link: "WORK", suffix: "SHOP"))
        info.wordBank.append(Word(prefix: "PAPER", link: "WORK", suffix: "STATION"))
        info.wordBank.append(Word(prefix: "PAPER", link: "WORK", suffix: "TABLE"))
        // end work
        
        // start work - patch
        info.wordBank.append(Word(prefix: "PATCH", link: "WORK", suffix: "BENCH"))
        info.wordBank.append(Word(prefix: "PATCH", link: "WORK", suffix: "BOOK"))
        info.wordBank.append(Word(prefix: "PATCH", link: "WORK", suffix: "DAY"))
        info.wordBank.append(Word(prefix: "PATCH", link: "WORK", suffix: "HORSE"))
        info.wordBank.append(Word(prefix: "PATCH", link: "WORK", suffix: "MAN"))
        
        info.wordBank.append(Word(prefix: "PATCH", link: "WORK", suffix: "OUT"))
        info.wordBank.append(Word(prefix: "PATCH", link: "WORK", suffix: "PLACE"))
        info.wordBank.append(Word(prefix: "PATCH", link: "WORK", suffix: "ROOM"))
        info.wordBank.append(Word(prefix: "PATCH", link: "WORK", suffix: "SHOP"))
        info.wordBank.append(Word(prefix: "PATCH", link: "WORK", suffix: "STATION"))
        info.wordBank.append(Word(prefix: "PATCH", link: "WORK", suffix: "TABLE"))
        // end work
        
        // start work - stone
        info.wordBank.append(Word(prefix: "WORK", link: "WORK", suffix: "BENCH"))
        info.wordBank.append(Word(prefix: "WORK", link: "WORK", suffix: "BOOK"))
        info.wordBank.append(Word(prefix: "WORK", link: "WORK", suffix: "DAY"))
        info.wordBank.append(Word(prefix: "WORK", link: "WORK", suffix: "HORSE"))
        info.wordBank.append(Word(prefix: "WORK", link: "WORK", suffix: "MAN"))
        
        info.wordBank.append(Word(prefix: "WORK", link: "WORK", suffix: "OUT"))
        info.wordBank.append(Word(prefix: "WORK", link: "WORK", suffix: "PLACE"))
        info.wordBank.append(Word(prefix: "WORK", link: "WORK", suffix: "ROOM"))
        info.wordBank.append(Word(prefix: "WORK", link: "WORK", suffix: "SHOP"))
        info.wordBank.append(Word(prefix: "WORK", link: "WORK", suffix: "STATION"))
        info.wordBank.append(Word(prefix: "WORK", link: "WORK", suffix: "TABLE"))
        // end work
        
        // start work - wood
        info.wordBank.append(Word(prefix: "WOOD", link: "WORK", suffix: "BENCH"))
        info.wordBank.append(Word(prefix: "WOOD", link: "WORK", suffix: "BOOK"))
        info.wordBank.append(Word(prefix: "WOOD", link: "WORK", suffix: "DAY"))
        info.wordBank.append(Word(prefix: "WOOD", link: "WORK", suffix: "HORSE"))
        info.wordBank.append(Word(prefix: "WOOD", link: "WORK", suffix: "MAN"))
        
        info.wordBank.append(Word(prefix: "WOOD", link: "WORK", suffix: "OUT"))
        info.wordBank.append(Word(prefix: "WOOD", link: "WORK", suffix: "PLACE"))
        info.wordBank.append(Word(prefix: "WOOD", link: "WORK", suffix: "ROOM"))
        info.wordBank.append(Word(prefix: "WOOD", link: "WORK", suffix: "SHOP"))
        info.wordBank.append(Word(prefix: "WOOD", link: "WORK", suffix: "STATION"))
        info.wordBank.append(Word(prefix: "WOOD", link: "WORK", suffix: "TABLE"))
        // end work
        
        info.wordBank.append(Word(prefix: "UNDER", link: "WORLD", suffix: "WIDE"))
        
        info.wordBank.append(Word(prefix: "BACK", link: "YARD", suffix: "ARM"))
        info.wordBank.append(Word(prefix: "BACK", link: "YARD", suffix: "STICK"))
        info.wordBank.append(Word(prefix: "BARN", link: "YARD", suffix: "ARM"))
        info.wordBank.append(Word(prefix: "BARN", link: "YARD", suffix: "STICK"))
        info.wordBank.append(Word(prefix: "COURT", link: "YARD", suffix: "ARM"))
        info.wordBank.append(Word(prefix: "COURT", link: "YARD", suffix: "STICK"))
        info.wordBank.append(Word(prefix: "FARM", link: "YARD", suffix: "ARM"))
        info.wordBank.append(Word(prefix: "FARM", link: "YARD", suffix: "STICK"))
        info.wordBank.append(Word(prefix: "GRAVE", link: "YARD", suffix: "ARM"))
        info.wordBank.append(Word(prefix: "GRAVE", link: "YARD", suffix: "STICK"))
        info.wordBank.append(Word(prefix: "SHIP", link: "YARD", suffix: "ARM"))
        info.wordBank.append(Word(prefix: "SHIP", link: "YARD", suffix: "STICK"))
        info.wordBank.append(Word(prefix: "VINE", link: "YARD", suffix: "ARM"))
        info.wordBank.append(Word(prefix: "VINE", link: "YARD", suffix: "STICK"))
    }
    
    func level2() {
        
        
        
    }
    
    func level3() {
        
        
    }
    
    func level4() {
        
    }
    
}
