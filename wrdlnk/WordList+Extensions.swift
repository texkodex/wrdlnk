//
//  WordList+Extensions.swift
//  wrdlnk
//
//  Created by sparkle on 9/27/17.
//  Copyright © 2017 teknowsys. All rights reserved.
//

import Foundation

extension WordList {
    func isEmpty() -> Bool {
        return info.wordBank.isEmpty
    }
    
    mutating func populateFromMemoryList() {
        populateInfoWordBank()

        info.wordBank.shuffle()
        saveWordList()
        AppDefinition.defaults.set(true, forKey: preferenceWordListShuffledKey)
        if !AppDefinition.defaults.keyExist(key: preferenceMaxNumberOfDataPlaysKey) {
            AppDefinition.defaults.set(MaxNumberOfDataPlays, forKey: preferenceMaxNumberOfDataPlaysKey)
            AppDefinition.defaults.set(0, forKey: preferenceCurrentNumberOfDataPlaysKey)
        }
        if !AppDefinition.defaults.keyExist(key: preferenceAccuracyLowerBoundDataKey) {
            AppDefinition.defaults.set(0, forKey: preferenceAccuracyLowerBoundDataKey)
            AppDefinition.defaults.set(0, forKey: preferenceTimeLowerBoundDataKey)
        }
        
        info.initialize = true
    }
    
    mutating func setupWords() {
        if isEmpty() {
            
            if !AppDefinition.defaults.keyExist(key: preferenceWordListShuffledKey) {
                populateFromMemoryList()
            }
            
            if !info.initialize {
                loadWordList()
            }
            
            if !isEmpty() || info.initialize {
                setListDescription()
            } else {
                fatalError("Cannot initialize data store")
            }
        }
    }
    
    mutating func loadWordList() {
        if info.initialize { return }
        do {
            let data = try Data(contentsOf: WordList.WordListArchiveURL, options: .alwaysMapped)
            if let back = (NSKeyedUnarchiver.unarchiveObject(with: data) as? [Word.Coding])?.decoded {
                networkLoad(wordList: back as! [Word])
            }
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    mutating func saveWordList() {
        do {
            let data = NSKeyedArchiver.archivedData(withRootObject: info.wordBank.encoded)
            try data.write(to: WordList.WordListArchiveURL, options: .atomic)
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    func setListDescription(listName: String = awardDescriptionPrefixDefaultString) {
        if info.initialize {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
            let dateAsString = dateFormatter.string(from: Date())
            var newDateString = ""
            
            if let date = dateFormatter.date(from: dateAsString) {
                dateFormatter.dateFormat = "dd MMM yy"
                newDateString = dateFormatter.string(from: date)
                let description = String(format: awardDescriptionFormat, listName, newDateString)
                AppDefinition.defaults.set(description, forKey: preferenceAwardDescriptionInfoKey)
            } else {
                let description = String(format: awardDescriptionFormat, listName, "DEF001")
                AppDefinition.defaults.set(description, forKey: preferenceAwardDescriptionInfoKey)
            }
        }
    }
    
    mutating func networkLoad(wordList: [Word]) {
        if isEmpty() {
            for wordItem in wordList {
                info.wordBank.append(wordItem)
                if !info.initialize {
                    info.initialize = true
                }
            }
        }
    }
    
    mutating func getWords() -> Word? {
        if isEmpty() {
            setupWords()
        }
        
        if let match = info.matchCondition, match == true {
            info.index = AppDefinition.defaults.integer(forKey: preferenceWordListKey)
            info.index = (info.index + 1) % info.wordBank.count
            AppDefinition.defaults.set(info.index, forKey: preferenceWordListKey)
        }
        return info.wordBank[info.index]
    }
    
    func skip() {
        info.index = AppDefinition.defaults.integer(forKey: preferenceWordListKey)
        info.index = (info.index + 1) % info.wordBank.count
        AppDefinition.defaults.set(info.index, forKey: preferenceWordListKey)
    }
    
    func stay() {
        info.index = AppDefinition.defaults.integer(forKey: preferenceWordListKey)
        AppDefinition.defaults.set(info.index, forKey: preferenceWordListKey)
    }
    
    func getCurrentWords() -> Word? {
        return isEmpty() ? nil : info.wordBank[info.index]
    }
    
    mutating func setSelectedRow(row: VowelRow?) {
        info.selectedRow = row
    }
    
    func getSelectedRow() -> VowelRow? {
        return info.selectedRow
    }
    
    func currentIndex() -> Int? {
        return isEmpty() ? nil : info.index
    }
    
    mutating func setMatchCondition() {
        info.matchCondition = true
    }
    
    mutating func clearMatchCondition() {
        info.matchCondition = nil
    }
    
    mutating func handledMatchCondition() {
        if let match = info.matchCondition, match == true {
            info.matchCondition = nil
        }
    }
    
    func getMatchCondition() -> Bool {
        return info.matchCondition == true
    }
    
    mutating func reset() {
        if info.index == 0 { return }
        let maximumNumberOfPlays = AppDefinition.defaults.integer(forKey: preferenceMaxNumberOfDataPlaysKey)
        let currentNumberOfPlays = AppDefinition.defaults.integer(forKey: preferenceCurrentNumberOfDataPlaysKey)
        info.wordBank.shuffle()
        saveWordList()
        AppDefinition.defaults.set(true, forKey: preferenceWordListShuffledKey)
        info.initialize = true
        AppDefinition.defaults.set(0, forKey: preferenceWordListKey)
        info.index = 0
        
        if currentNumberOfPlays > maximumNumberOfPlays {
            AppDefinition.defaults.set(0, forKey: preferenceAccuracyLowerBoundDataKey)
        }
        // Always allow time improvement
        AppDefinition.defaults.set(0, forKey: preferenceTimeLowerBoundDataKey)
        
        AppDefinition.defaults.set(currentNumberOfPlays + 1, forKey: preferenceCurrentNumberOfDataPlaysKey)
    }
}

extension WordList {
    mutating func populateInfoWordBank() {
        info.wordBank.append(Word(prefix: "EGG", link: "CUP", suffix: "CAKE"))
        info.wordBank.append(Word(prefix: "FULL", link: "STOP", suffix: "LIGHT"))
        info.wordBank.append(Word(prefix: "PASS", link: "BOOK", suffix: "WORM"))
        info.wordBank.append(Word(prefix: "FULL", link: "MOON", suffix: "LIGHT"))
        info.wordBank.append(Word(prefix: "SUN", link: "LIGHT", suffix: "HOUSE"))
        info.wordBank.append(Word(prefix: "WEDDING", link: "RING", suffix: "ROAD"))
        info.wordBank.append(Word(prefix: "LEFT", link: "WING", suffix: "SPAN"))
        info.wordBank.append(Word(prefix: "RIGHT", link: "BACK", suffix: "YARD"))
        info.wordBank.append(Word(prefix: "BRAVE", link: "HEART", suffix: "BEAT"))
        info.wordBank.append(Word(prefix: "FIRE", link: "MAN", suffix: "HUNT"))
        info.wordBank.append(Word(prefix: "FREE", link: "FALL", suffix: "DOWN"))
        info.wordBank.append(Word(prefix: "BACK", link: "ROAD", suffix: "RAGE"))
        info.wordBank.append(Word(prefix: "SUGAR", link: "PLUM", suffix: "CAKE"))
        info.wordBank.append(Word(prefix: "FIRST", link: "LIGHT", suffix: "SHIP"))
        info.wordBank.append(Word(prefix: "AWAY", link: "DAY", suffix: "BREAK"))
        info.wordBank.append(Word(prefix: "GINGER", link: "BREAD", suffix: "BASKET"))
        info.wordBank.append(Word(prefix: "SUMMER", link: "FRUIT", suffix: "COCKTAIL"))
        info.wordBank.append(Word(prefix: "PALM", link: "TREE", suffix: "NUT"))
        info.wordBank.append(Word(prefix: "SWEET", link: "CORN", suffix: "BEEF"))
        info.wordBank.append(Word(prefix: "BEST", link: "FRIEND", suffix: "SHIP"))
        info.wordBank.append(Word(prefix: "HIP", link: "HOP", suffix: "SCOTCH"))
        info.wordBank.append(Word(prefix: "BUTTER", link: "BALL", suffix: "BEARING"))
        info.wordBank.append(Word(prefix: "DAY", link: "BED", suffix: "ROOM"))
        info.wordBank.append(Word(prefix: "BALL", link: "BOY", suffix: "HOOD"))
        info.wordBank.append(Word(prefix: "HORSE", link: "RIDING", suffix: "BOOT"))
        info.wordBank.append(Word(prefix: "GHOST", link: "STORY", suffix: "BOARD"))
        info.wordBank.append(Word(prefix: "APPLE", link: "PIE", suffix: "PLATE"))
        info.wordBank.append(Word(prefix: "QUICK", link: "STEP", suffix: "SON"))
        info.wordBank.append(Word(prefix: "GIRL", link: "FRIEND", suffix: "SHIP"))
        info.wordBank.append(Word(prefix: "LAST", link: "DANCE", suffix: "STUDIO"))
        info.wordBank.append(Word(prefix: "BED", link: "BUG", suffix: "BEAR"))
        info.wordBank.append(Word(prefix: "IRON", link: "BRIDGE", suffix: "PORT"))
        info.wordBank.append(Word(prefix: "RED", link: "EARTH", suffix: "WORKS"))
        info.wordBank.append(Word(prefix: "DOVE", link: "TAIL", suffix: "COAT"))
        info.wordBank.append(Word(prefix: "BLUE", link: "INK", suffix: "SPOT"))
        info.wordBank.append(Word(prefix: "DAY", link: "JOB", suffix: "LOT"))
        info.wordBank.append(Word(prefix: "BUS", link: "RIDE", suffix: "SHARE"))
        info.wordBank.append(Word(prefix: "GUMMY", link: "BEAR", suffix: "HUG"))
        info.wordBank.append(Word(prefix: "JELLY", link: "BEAN", suffix: "SOUP"))
        info.wordBank.append(Word(prefix: "TOM", link: "THUMB", suffix: "NAIL"))
        info.wordBank.append(Word(prefix: "NORTH", link: "POLE", suffix: "VAULT"))
        info.wordBank.append(Word(prefix: "QUICK", link: "SILVER", suffix: "SMITH"))
        info.wordBank.append(Word(prefix: "FAST", link: "FORWARD", suffix: "GROUP"))
        info.wordBank.append(Word(prefix: "MAIN", link: "FLOOR", suffix: "COVER"))
        info.wordBank.append(Word(prefix: "CAR", link: "PET", suffix: "SHOP"))
        info.wordBank.append(Word(prefix: "SUMMER", link: "TIME", suffix: "SHARE"))
        info.wordBank.append(Word(prefix: "SHOUT", link: "OUT", suffix: "LAST"))
        info.wordBank.append(Word(prefix: "MORE", link: "TIME", suffix: "LESS"))
        info.wordBank.append(Word(prefix: "PIXIE", link: "DUST", suffix: "BIN"))
        info.wordBank.append(Word(prefix: "WET", link: "RAG", suffix: "DOLL"))
        info.wordBank.append(Word(prefix: "START", link: "UP", suffix: "STAIRS"))
        info.wordBank.append(Word(prefix: "UNDER", link: "ARM", suffix: "WRESTLE"))
        info.wordBank.append(Word(prefix: "TWO", link: "FOR", suffix: "TEA"))
        info.wordBank.append(Word(prefix: "GRAND", link: "MASTER", suffix: "MIND"))
        info.wordBank.append(Word(prefix: "RED", link: "BLOOD", suffix: "BANK"))
        info.wordBank.append(Word(prefix: "EURO", link: "DOLLAR", suffix: "BILL"))
        info.wordBank.append(Word(prefix: "DRIED", link: "DATE", suffix: "PALM"))
        info.wordBank.append(Word(prefix: "RIPE", link: "FIG", suffix: "TREE"))
        info.wordBank.append(Word(prefix: "GREEN", link: "COMMON", suffix: "SENSE"))
        info.wordBank.append(Word(prefix: "FRONT", link: "TOOTH", suffix: "PASTE"))
        info.wordBank.append(Word(prefix: "OPEN", link: "MOUTH", suffix: "WASH"))
        info.wordBank.append(Word(prefix: "CARD", link: "BOARD", suffix: "ROOM"))
    }
 
}
