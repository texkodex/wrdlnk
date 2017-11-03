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
        return WordList.info.initialize == false
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
    
    mutating func clearWordList() {
        if isEmpty() { return }
        trace("\(#file ) \(#line)", {"clearWordList - ...: "})
        info.wordBank.removeAll()
        info.initialize = false
    }
    
    mutating func loadWordList() {
        guard let data = NSKeyedUnarchiver.unarchiveObject(withFile: filePath) as? Data else { return }
        do {
            let decoder = JSONDecoder()
            let wordList = try decoder.decode([Word].self, from: data)
            if wordList.count > 0 { info.initialize = true }
            info.wordBank = wordList
        } catch {
            print("loadWordList Failed")
        }
    }
    
    mutating func saveWordList() {
        trace("\(#file ) \(#line)", {"saveWordList - start: "})
        do {
            let words = info.wordBank
            let encoder = JSONEncoder()
            let data = try encoder.encode(words)
            NSKeyedArchiver.archiveRootObject(data, toFile: filePath)
        } catch {
            print("saveWordList Failed")
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
    
    func checkForListTraversal() {
        if info.index + 1 < info.wordBank.count { return }
        
        let currentNumberOfPlays = AppDefinition.defaults.integer(forKey: preferenceCurrentNumberOfDataPlaysKey)
        let maximumNumberOfPlays = AppDefinition.defaults.integer(forKey: preferenceMaxNumberOfDataPlaysKey)
        if currentNumberOfPlays < maximumNumberOfPlays {
            AppDefinition.defaults.set(currentNumberOfPlays + 1, forKey: preferenceCurrentNumberOfDataPlaysKey)
        }
    }
    
    func getCurrentWords() -> Word? {
        checkForListTraversal()
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
        info.wordBank.shuffle()
        saveWordList()
        AppDefinition.defaults.set(true, forKey: preferenceWordListShuffledKey)
        info.initialize = true
        AppDefinition.defaults.set(0, forKey: preferenceWordListKey)
        info.index = 0
        
        let maximumNumberOfPlays = AppDefinition.defaults.integer(forKey: preferenceMaxNumberOfDataPlaysKey)
        let currentNumberOfPlays = AppDefinition.defaults.integer(forKey: preferenceCurrentNumberOfDataPlaysKey)
        if currentNumberOfPlays < maximumNumberOfPlays {
            AppDefinition.defaults.set(0, forKey: preferenceAccuracyLowerBoundDataKey)
        }
        // Always allow time improvement
        AppDefinition.defaults.set(0, forKey: preferenceTimeLowerBoundDataKey)
    }
}

extension WordList {
    
    mutating func populateInfoWordBank() {
        info.wordBank.append(Word(prefix: "FUTURE", link: "TIME", suffix: "TRAVEL" ))
        info.wordBank.append(Word(prefix: "SCHOOL", link: "YEAR", suffix: "BOOK" ))
        info.wordBank.append(Word(prefix: "CITY", link: "PEOPLE", suffix: "BIKING" ))
        info.wordBank.append(Word(prefix: "RAIL", link: "WAY", suffix: "SLEEPER" ))
        info.wordBank.append(Word(prefix: "BRIGHT", link: "DAY", suffix: "LIGHT" ))
        info.wordBank.append(Word(prefix: "FOOT", link: "MAN", suffix: "HUNT" ))
        info.wordBank.append(Word(prefix: "SOME", link: "THING", suffix: "NEW" ))
        info.wordBank.append(Word(prefix: "FIRST", link: "WOMAN", suffix: "PRESIDENT" ))
        info.wordBank.append(Word(prefix: "STRONG", link: "LIFE", suffix: "FORCE" ))
        info.wordBank.append(Word(prefix: "ONLY", link: "CHILD", suffix: "SYNDROME" ))
        info.wordBank.append(Word(prefix: "FIVE", link: "WORLD", suffix: "OCEANS" ))
        info.wordBank.append(Word(prefix: "NEW", link: "SCHOOL", suffix: "BAG" ))
        info.wordBank.append(Word(prefix: "SOLID", link: "STATE", suffix: "MATERIAL" ))
        info.wordBank.append(Word(prefix: "LARGE", link: "FAMILY", suffix: "ROOM" ))
        info.wordBank.append(Word(prefix: "MUSIC", link: "STUDENT", suffix: "COMPOSER" ))
        info.wordBank.append(Word(prefix: "CHORAL", link: "GROUP", suffix: "SING" ))
        info.wordBank.append(Word(prefix: "CROSS", link: "COUNTRY", suffix: "TRAIN" ))
        info.wordBank.append(Word(prefix: "GENERAL", link: "PROBLEM", suffix: "SOLVER" ))
        info.wordBank.append(Word(prefix: "LEFT", link: "HAND", suffix: "DRIVE" ))
        info.wordBank.append(Word(prefix: "WORKING", link: "PART", suffix: "TIME" ))
        info.wordBank.append(Word(prefix: "COMMON", link: "PLACE", suffix: "NAMES" ))
        info.wordBank.append(Word(prefix: "SUIT", link: "CASE", suffix: "CLOSED" ))
        info.wordBank.append(Word(prefix: "SATURDAY", link: "WEEK", suffix: "END" ))
        info.wordBank.append(Word(prefix: "TRADING", link: "COMPANY", suffix: "PICNIC" ))
        info.wordBank.append(Word(prefix: "PROCESS", link: "SYSTEM", suffix: "CONTROL" ))
        info.wordBank.append(Word(prefix: "SOFTWARE", link: "PROGRAM", suffix: "CODE" ))
        info.wordBank.append(Word(prefix: "BRIEF", link: "QUESTION", suffix: "ANSWER" ))
        info.wordBank.append(Word(prefix: "TEAM", link: "WORK", suffix: "GROUP" ))
        info.wordBank.append(Word(prefix: "PRIME", link: "NUMBER", suffix: "DIGIT" ))
        info.wordBank.append(Word(prefix: "DARK", link: "NIGHT", suffix: "MARE" ))
        info.wordBank.append(Word(prefix: "MALE", link: "MR", suffix: "MAN" ))
        info.wordBank.append(Word(prefix: "TIPPING", link: "POINT", suffix: "BLANK" ))
        info.wordBank.append(Word(prefix: "GREAT", link: "HOME", suffix: "LIFE" ))
        info.wordBank.append(Word(prefix: "HOT", link: "WATER", suffix: "HEATER" ))
        info.wordBank.append(Word(prefix: "HOTEL", link: "ROOM", suffix: "SERVICE" ))
        info.wordBank.append(Word(prefix: "GENTLE", link: "MOTHER", suffix: " CARE" ))
        info.wordBank.append(Word(prefix: "TOTAL", link: "AREA", suffix: "SIZE" ))
        info.wordBank.append(Word(prefix: "PAPER", link: "MONEY", suffix: "TRANSFER" ))
        info.wordBank.append(Word(prefix: "KIDS", link: "STORY", suffix: "TIME" ))
        info.wordBank.append(Word(prefix: "KNOWN", link: "FACT", suffix: "CHECK" ))
        info.wordBank.append(Word(prefix: "FREE", link: "MONTH", suffix: "RATE" ))
        info.wordBank.append(Word(prefix: "PARKING", link: "LOT", suffix: "NUMBER" ))
        info.wordBank.append(Word(prefix: "BIRTH", link: "RIGHT", suffix: "HAND" ))
        info.wordBank.append(Word(prefix: "WORK", link: "STUDY", suffix: "GUIDE" ))
        info.wordBank.append(Word(prefix: "CLASSIC", link: "BOOK", suffix: "WORM" ))
        info.wordBank.append(Word(prefix: "BRIGHT", link: "EYE", suffix: "SHADOW" ))
        info.wordBank.append(Word(prefix: "FUN", link: "JOB", suffix: "SHARE" ))
        info.wordBank.append(Word(prefix: "SPOKEN", link: "WORD", suffix: "PHRASE" ))
        info.wordBank.append(Word(prefix: "HOME", link: "BUSINESS", suffix: "ADDRESS" ))
        info.wordBank.append(Word(prefix: "PROBLEM", link: "ISSUE", suffix: "RESOLVER" ))
        info.wordBank.append(Word(prefix: "OUT", link: "SIDE", suffix: "LINE" ))
        info.wordBank.append(Word(prefix: "MAN", link: "KIND", suffix: "HEARTED" ))
        info.wordBank.append(Word(prefix: "ARROW", link: "HEAD", suffix: "HUNTER" ))
        info.wordBank.append(Word(prefix: "LIGHT", link: "HOUSE", suffix: "BOAT" ))
        info.wordBank.append(Word(prefix: "FREE", link: "SERVICE", suffix: "FEE" ))
        info.wordBank.append(Word(prefix: "PAL", link: "FRIEND", suffix: "MATE" ))
        info.wordBank.append(Word(prefix: "GUARDIAN", link: "FATHER", suffix: "PARENT" ))
        info.wordBank.append(Word(prefix: "HORSE", link: "POWER", suffix: "BOAT" ))
        info.wordBank.append(Word(prefix: "HAPPY", link: "HOUR", suffix: "GLASS" ))
        info.wordBank.append(Word(prefix: "MIND", link: "GAME", suffix: "TIME" ))
        info.wordBank.append(Word(prefix: "STRAIGHT", link: "LINE", suffix: "GUIDE" ))
        info.wordBank.append(Word(prefix: "BITTER", link: "END", suffix: "GAME" ))
        info.wordBank.append(Word(prefix: "SELECT", link: "MEMBER", suffix: "CARD" ))
        info.wordBank.append(Word(prefix: "FAMILY", link: "LAW", suffix: "CENTER" ))
        info.wordBank.append(Word(prefix: "RACE", link: "CAR", suffix: "TRACK" ))
        info.wordBank.append(Word(prefix: "METRO", link: "CITY", suffix: "TRANSIT" ))
        info.wordBank.append(Word(prefix: "CLOSED", link: "COMMUNITY", suffix: "BANK" ))
        info.wordBank.append(Word(prefix: "USER", link: "NAME", suffix: "SAKE" ))
        info.wordBank.append(Word(prefix: "COMPANY", link: "PRESIDENT", suffix: "OWNER" ))
        info.wordBank.append(Word(prefix: "TALENTED", link: "TEAM", suffix: "MATE" ))
        info.wordBank.append(Word(prefix: "QUICK", link: "MINUTE", suffix: "MEN" ))
        info.wordBank.append(Word(prefix: "FRESH", link: "IDEA", suffix: "LAB" ))
        info.wordBank.append(Word(prefix: "JUNIOR", link: "KID", suffix: "BIKE" ))
        info.wordBank.append(Word(prefix: "EVERY", link: "BODY", suffix: "BUILDER" ))
        info.wordBank.append(Word(prefix: "OUT", link: "BACK", suffix: "PACK" ))
        info.wordBank.append(Word(prefix: "LOCAL", link: "PARENT", suffix: "MEETING" ))
        info.wordBank.append(Word(prefix: "SMILEY", link: "FACE", suffix: "MASK" ))
        info.wordBank.append(Word(prefix: "PAY", link: "OTHERS", suffix: "TAXES" ))
        info.wordBank.append(Word(prefix: "SPIRIT", link: "LEVEL", suffix: "CROSSING" ))
        info.wordBank.append(Word(prefix: "BOX", link: "OFFICE", suffix: "BUILDING" ))
        info.wordBank.append(Word(prefix: "FRONT", link: "DOOR", suffix: "BELL" ))
        info.wordBank.append(Word(prefix: "PERSONAL", link: "HEALTH", suffix: "COVERAGE" ))
        info.wordBank.append(Word(prefix: "FIRST", link: "PERSON", suffix: "BODY" ))
        info.wordBank.append(Word(prefix: "FINE", link: "ART", suffix: "CLASS" ))
        info.wordBank.append(Word(prefix: "COLD", link: "WAR", suffix: "GAME" ))
        info.wordBank.append(Word(prefix: "MODERN", link: "HISTORY", suffix: "CLASS" ))
        info.wordBank.append(Word(prefix: "TEEN", link: "PARTY", suffix: "HAT" ))
        info.wordBank.append(Word(prefix: "FINAL", link: "RESULT", suffix: "COMPLETE" ))
        info.wordBank.append(Word(prefix: "INSTANT", link: "CHANGE", suffix: "DIRECTION" ))
        info.wordBank.append(Word(prefix: "EARLY", link: "MORNING", suffix: "TIME" ))
        info.wordBank.append(Word(prefix: "PRIMARY", link: "REASON", suffix: "WHY" ))
        info.wordBank.append(Word(prefix: "PRACTICAL", link: "RESEARCH", suffix: "WORKER" ))
        info.wordBank.append(Word(prefix: "SHOW", link: "GIRL", suffix: "GUIDE" ))
        info.wordBank.append(Word(prefix: "FALL", link: "GUY", suffix: "FELLOW" ))
        info.wordBank.append(Word(prefix: "FAST", link: "FOOD", suffix: "CART" ))
        info.wordBank.append(Word(prefix: "INITIAL", link: "MOMENT", suffix: "PAUSE" ))
        info.wordBank.append(Word(prefix: "FRESH", link: "AIR", suffix: "POCKET" ))
        info.wordBank.append(Word(prefix: "SCHOOL", link: "TEACHER", suffix: "TRAINER" ))
        info.wordBank.append(Word(prefix: "BLUNT", link: "FORCE", suffix: "APART" ))
        info.wordBank.append(Word(prefix: "PRIMARY", link: "EDUCATION", suffix: "SYSTEM" ))
        info.wordBank.append(Word(prefix: "FRONT", link: "FOOT", suffix: "LENGTH" ))
        info.wordBank.append(Word(prefix: "TOM", link: "BOY", suffix: "BAND" ))
        info.wordBank.append(Word(prefix: "OLD", link: "AGE", suffix: "LESS" ))
        info.wordBank.append(Word(prefix: "FOREIGN", link: "POLICY", suffix: "RESEARCH" ))
        info.wordBank.append(Word(prefix: "CLASSICAL", link: "MUSIC", suffix: "MASTER" ))
        info.wordBank.append(Word(prefix: "FREE", link: "MARKET", suffix: "PLACE" ))
        info.wordBank.append(Word(prefix: "COMMON", link: "SENSE", suffix: "LESS" ))
        info.wordBank.append(Word(prefix: "FIRST", link: "NATION", suffix: "BUILDING" ))
        info.wordBank.append(Word(prefix: "FLOOR", link: "PLAN", suffix: "DESIGN" ))
        info.wordBank.append(Word(prefix: "JUNIOR", link: "COLLEGE", suffix: "COURSE" ))
        info.wordBank.append(Word(prefix: "ACCOUNT", link: "INTEREST", suffix: "RATE" ))
        info.wordBank.append(Word(prefix: "ETERNAL", link: "DEATH", suffix: "KNELL" ))
        info.wordBank.append(Word(prefix: "FIRST", link: "USE", suffix: "CASE" ))
        info.wordBank.append(Word(prefix: "UPPER", link: "CLASS", suffix: "MATE" ))
        info.wordBank.append(Word(prefix: "REMOTE", link: "CONTROL", suffix: "SWITCH" ))
        info.wordBank.append(Word(prefix: "ELDER", link: "CARE", suffix: "HOME" ))
        info.wordBank.append(Word(prefix: "GREEN", link: "FIELD", suffix: "HOCKEY" ))
        info.wordBank.append(Word(prefix: "MAJOR", link: "ROLE", suffix: "PLAY" ))
        info.wordBank.append(Word(prefix: "PARTIAL", link: "EFFORT", suffix: "LACKING" ))
        info.wordBank.append(Word(prefix: "BIRTH", link: "RATE", suffix: "COLLAPSE" ))
        info.wordBank.append(Word(prefix: "BEAT", link: "HEART", suffix: "ATTACK" ))
        info.wordBank.append(Word(prefix: "CASUAL", link: "DRUG", suffix: "WAR" ))
        info.wordBank.append(Word(prefix: "MAIN", link: "SHOW", suffix: "CASE" ))
        info.wordBank.append(Word(prefix: "SEARCH", link: "LIGHT", suffix: "BEAM" ))
        info.wordBank.append(Word(prefix: "DIGITAL", link: "VOICE", suffix: "MESSAGE" ))
        info.wordBank.append(Word(prefix: "MERRY", link: "WIFE", suffix: "HOOD" ))
        info.wordBank.append(Word(prefix: "REGIONAL", link: "POLICE", suffix: "ACADEMY" ))
        info.wordBank.append(Word(prefix: "OPEN", link: "MIND", suffix: "BENDER" ))
        info.wordBank.append(Word(prefix: "CUT", link: "PRICE", suffix: "CHANGE" ))
        info.wordBank.append(Word(prefix: "OFFICIAL", link: "REPORT", suffix: "CARD" ))
        info.wordBank.append(Word(prefix: "DIFFICULT", link: "DECISION", suffix: "MAKER" ))
        info.wordBank.append(Word(prefix: "GRAND", link: "SON", suffix: "HEIR" ))
        info.wordBank.append(Word(prefix: "OPEN", link: "VIEW", suffix: "FINDER" ))
        info.wordBank.append(Word(prefix: "CROSS", link: "TOWN", suffix: "CENTER" ))
        info.wordBank.append(Word(prefix: "MAIN", link: "ROAD", suffix: "WORK" ))
        info.wordBank.append(Word(prefix: "FORE", link: "ARM", suffix: "LOCK" ))
        info.wordBank.append(Word(prefix: "GOOD", link: "VALUE", suffix: "FUND" ))
        info.wordBank.append(Word(prefix: "CONCRETE", link: "BUILDING", suffix: "MATERIAL" ))
        info.wordBank.append(Word(prefix: "PACKED", link: "ACTION", suffix: "MOVIE" ))
        info.wordBank.append(Word(prefix: "REPLICA", link: "MODEL", suffix: "TRAIN" ))
        info.wordBank.append(Word(prefix: "HUNTING", link: "SEASON", suffix: "SERIES" ))
        info.wordBank.append(Word(prefix: "AFFLUENT", link: "SOCIETY", suffix: "BALL" ))
        info.wordBank.append(Word(prefix: "INCOME", link: "TAX", suffix: "BREAK" ))
        info.wordBank.append(Word(prefix: "ACTOR", link: "DIRECTOR", suffix: "WRITER" ))
        info.wordBank.append(Word(prefix: "KEY", link: "POSITION", suffix: "PAPER" ))
        info.wordBank.append(Word(prefix: "SPORT", link: "PLAYER", suffix: "COACH" ))
        info.wordBank.append(Word(prefix: "NATIONAL", link: "RECORD", suffix: "TIME" ))
        info.wordBank.append(Word(prefix: "EXAM", link: "PAPER", suffix: "TRAIL" ))
        info.wordBank.append(Word(prefix: "OUTER", link: "SPACE", suffix: "RACE" ))
        info.wordBank.append(Word(prefix: "ABOVE", link: "GROUND", suffix: "LEVEL" ))
        info.wordBank.append(Word(prefix: "BROADCAST", link: "EVENT", suffix: "SCHEDULE" ))
        info.wordBank.append(Word(prefix: "DEPUTY", link: "OFFICIAL", suffix: "STATEMENT" ))
        info.wordBank.append(Word(prefix: "PHYSICAL", link: "MATTER", suffix: "DENSITY" ))
        info.wordBank.append(Word(prefix: "SPACE", link: "CENTER", suffix: "CONSOLE" ))
        info.wordBank.append(Word(prefix: "UNITED", link: "COUPLE", suffix: "TEAM" ))
        info.wordBank.append(Word(prefix: "WORK", link: "SITE", suffix: "OFFICIAL" ))
        info.wordBank.append(Word(prefix: "NEW", link: "PROJECT", suffix: "MANAGER" ))
        info.wordBank.append(Word(prefix: "ILLEGAL", link: "ACTIVITY", suffix: "MONITOR" ))
        info.wordBank.append(Word(prefix: "MOVIE", link: "STAR", suffix: "PERFORMER" ))
        info.wordBank.append(Word(prefix: "ROUND", link: "TABLE", suffix: "TOP" ))
        info.wordBank.append(Word(prefix: "HUMAN", link: "NEED", suffix: "HELP" ))
        info.wordBank.append(Word(prefix: "CRIMINAL", link: "COURT", suffix: "ROOM" ))
        info.wordBank.append(Word(prefix: "NATIVE", link: "AMERICAN", suffix: "TRIBE" ))
        info.wordBank.append(Word(prefix: "COOKING", link: "OIL", suffix: "TANKER" ))
        info.wordBank.append(Word(prefix: "FINANCIAL", link: "SITUATION", suffix: "STATE" ))
        info.wordBank.append(Word(prefix: "UNIT", link: "COST", suffix: "CONTROL" ))
        info.wordBank.append(Word(prefix: "POPULAR", link: "FIGURE", suffix: "SKATER" ))
        info.wordBank.append(Word(prefix: "MAIN", link: "STREET", suffix: "CAR" ))
        info.wordBank.append(Word(prefix: "MIRROR", link: "IMAGE", suffix: "QUALITY" ))
        info.wordBank.append(Word(prefix: "SMART", link: "PHONE", suffix: "NUMBER" ))
        info.wordBank.append(Word(prefix: "INPUT", link: "DATA", suffix: "HIGHWAY" ))
        info.wordBank.append(Word(prefix: "MOTION", link: "PICTURE", suffix: "PERFECT" ))
        info.wordBank.append(Word(prefix: "MEDICAL", link: "PRACTICE", suffix: "SESSION" ))
        info.wordBank.append(Word(prefix: "MOUTH", link: "PIECE", suffix: "MEAL" ))
        info.wordBank.append(Word(prefix: "OPEN", link: "LAND", suffix: "MASS" ))
        info.wordBank.append(Word(prefix: "HOUSEHOLD", link: "PRODUCT", suffix: "PROFILE" ))
        info.wordBank.append(Word(prefix: "RESIDENT", link: "DOCTOR", suffix: "HOUSE" ))
        info.wordBank.append(Word(prefix: "SOLID", link: "WALL", suffix: "FENCE" ))
        info.wordBank.append(Word(prefix: "OUT", link: "PATIENT", suffix: "CARE" ))
        info.wordBank.append(Word(prefix: "RELIEF", link: "WORKER", suffix: "POOL" ))
        info.wordBank.append(Word(prefix: "BREAKING", link: "NEWS", suffix: "HEADLINE" ))
        info.wordBank.append(Word(prefix: "MODERN", link: "MOVIE", suffix: "THEATRE" ))
        info.wordBank.append(Word(prefix: "MAGNETIC", link: "NORTH", suffix: "POLE" ))
        info.wordBank.append(Word(prefix: "FIRST", link: "LOVE", suffix: "HEART" ))
        info.wordBank.append(Word(prefix: "CRISIS", link: "SUPPORT", suffix: "STAFF" ))
        info.wordBank.append(Word(prefix: "GIANT", link: "STEP", suffix: "FORWARD" ))
        info.wordBank.append(Word(prefix: "CRY", link: "BABY", suffix: "DOLL" ))
        info.wordBank.append(Word(prefix: "WEARABLE", link: "COMPUTER", suffix: "ACCESSORY" ))
        info.wordBank.append(Word(prefix: "GENETIC", link: "TYPE", suffix: "MATCH" ))
        info.wordBank.append(Word(prefix: "SHORT", link: "ATTENTION", suffix: "SPAN" ))
        info.wordBank.append(Word(prefix: "POPULAR", link: "FILM", suffix: "SHOW" ))
        info.wordBank.append(Word(prefix: "FRUIT", link: "TREE", suffix: "HOUSE" ))
        info.wordBank.append(Word(prefix: "OPEN", link: "SOURCE", suffix: "CODE" ))
        info.wordBank.append(Word(prefix: "FACIAL", link: "HAIR", suffix: "CUT" ))
        info.wordBank.append(Word(prefix: "OVER", link: "LOOK", suffix: "ALIKE" ))
        info.wordBank.append(Word(prefix: "TWENTIETH", link: "CENTURY", suffix: "MARKER" ))
        info.wordBank.append(Word(prefix: "FORENSIC", link: "EVIDENCE", suffix: "TAMPERING" ))
        info.wordBank.append(Word(prefix: "OPEN", link: "WINDOW", suffix: "CURTAIN" ))
        info.wordBank.append(Word(prefix: "LIVING", link: "CULTURE", suffix: "CLUB" ))
        info.wordBank.append(Word(prefix: "PURE", link: "CHANCE", suffix: "MEETING" ))
        info.wordBank.append(Word(prefix: "FRATERNAL", link: "BROTHER", suffix: "HOOD" ))
        info.wordBank.append(Word(prefix: "CLEAN", link: "ENERGY", suffix: "MARKET" ))
        info.wordBank.append(Word(prefix: "SAFE", link: "PERIOD", suffix: "PAINTING" ))
        info.wordBank.append(Word(prefix: "TOUGH", link: "COURSE", suffix: "WORK" ))
        info.wordBank.append(Word(prefix: "EARLY", link: "SUMMER", suffix: "TIME" ))
        info.wordBank.append(Word(prefix: "GREEN", link: "PLANT", suffix: "FOOD" ))
        info.wordBank.append(Word(prefix: "SHORT", link: "TERM", suffix: "LIMIT" ))
        info.wordBank.append(Word(prefix: "OPEN", link: "LETTER", suffix: "HEAD" ))
        info.wordBank.append(Word(prefix: "CRITICAL", link: "CONDITION", suffix: "RED" ))
        info.wordBank.append(Word(prefix: "PARENTAL", link: "CHOICE", suffix: "TOPIC" ))
        info.wordBank.append(Word(prefix: "YOUNG", link: "DAUGHTER", suffix: "DANCE" ))
        info.wordBank.append(Word(prefix: "DEEP", link: "SOUTH", suffix: "SIDE" ))
        info.wordBank.append(Word(prefix: "FATHER", link: "HUSBAND", suffix: "DAD" ))
        info.wordBank.append(Word(prefix: "CLOSED", link: "CONGRESS", suffix: "PANEL" ))
        info.wordBank.append(Word(prefix: "FIRST", link: "FLOOR", suffix: "COVERING" ))
        info.wordBank.append(Word(prefix: "ELECTION", link: "CAMPAIGN", suffix: "SPEECH" ))
        info.wordBank.append(Word(prefix: "RIGID", link: "MATERIAL", suffix: "DESIGN" ))
        info.wordBank.append(Word(prefix: "FIRST", link: "CALL", suffix: "CENTER" ))
        info.wordBank.append(Word(prefix: "GENERAL", link: "HOSPITAL", suffix: "CARE" ))
        info.wordBank.append(Word(prefix: "CLASSIC", link: "CHURCH", suffix: "BUILDING" ))
        info.wordBank.append(Word(prefix: "CREDIT", link: "RISK", suffix: "AVERSE" ))
        info.wordBank.append(Word(prefix: "WILD", link: "FIRE", suffix: "CREW" ))
        info.wordBank.append(Word(prefix: "NEAR", link: "FUTURE", suffix: "PROSPECT" ))
        info.wordBank.append(Word(prefix: "SELF", link: "DEFENSE", suffix: "SPENDING" ))
        info.wordBank.append(Word(prefix: "SOCIAL", link: "SECURITY", suffix: "BLANKET" ))
        info.wordBank.append(Word(prefix: "BLOOD", link: "BANK", suffix: "ROLL" ))
        info.wordBank.append(Word(prefix: "WILD", link: "WEST", suffix: "END" ))
        info.wordBank.append(Word(prefix: "FUN", link: "SPORT", suffix: "SHOW" ))
        info.wordBank.append(Word(prefix: "SKATE", link: "BOARD", suffix: "TRICK" ))
        info.wordBank.append(Word(prefix: "RADICAL", link: "SUBJECT", suffix: "MATTER" ))
        info.wordBank.append(Word(prefix: "POLICE", link: "OFFICER", suffix: "TRAINING" ))
        info.wordBank.append(Word(prefix: "HIGHWAY", link: "REST", suffix: "STOP" ))
        info.wordBank.append(Word(prefix: "BAD", link: "BEHAVIOR", suffix: "ACTOR" ))
        info.wordBank.append(Word(prefix: "TIP", link: "TOP", suffix: "SHAPE" ))
        info.wordBank.append(Word(prefix: "OWN", link: "GOAL", suffix: "MOUTH" ))
        info.wordBank.append(Word(prefix: "FIRST", link: "SECOND", suffix: "HAND" ))
        info.wordBank.append(Word(prefix: "FLOWER", link: "BED", suffix: "SHEET" ))
        info.wordBank.append(Word(prefix: "FLIGHT", link: "ORDER", suffix: "NUMBER" ))
        info.wordBank.append(Word(prefix: "BOOK", link: "AUTHOR", suffix: "COLUMN" ))
        info.wordBank.append(Word(prefix: "NOBLE", link: "BLOOD", suffix: "LINE" ))
        info.wordBank.append(Word(prefix: "MOTHER", link: "NATURE", suffix: "TRAIL" ))
        info.wordBank.append(Word(prefix: "PAINT", link: "COLOR", suffix: "CODED" ))
        info.wordBank.append(Word(prefix: "GRAIN", link: "STORE", suffix: "ROOM" ))
        info.wordBank.append(Word(prefix: "SONIC", link: "SOUND", suffix: "ENGINEER" ))
        info.wordBank.append(Word(prefix: "SUDDEN", link: "MOVEMENT", suffix: "CYCLE" ))
        info.wordBank.append(Word(prefix: "FRONT", link: "PAGE", suffix: "SPREAD" ))
        info.wordBank.append(Word(prefix: "HUMAN", link: "RACE", suffix: "RIOT" ))
        info.wordBank.append(Word(prefix: "GOING", link: "CONCERN", suffix: "SPENDING" ))
        info.wordBank.append(Word(prefix: "TIME", link: "SERIES", suffix: "ANALYSIS" ))
        info.wordBank.append(Word(prefix: "ENGLISH", link: "LANGUAGE", suffix: "TRAINING" ))
        info.wordBank.append(Word(prefix: "ANGRY", link: "RESPONSE", suffix: "HEARD" ))
        info.wordBank.append(Word(prefix: "BASIC", link: "ANIMAL", suffix: "BEHAVIOR" ))
        info.wordBank.append(Word(prefix: "NUMBER", link: "FACTOR", suffix: "QUOTIENT" ))
        info.wordBank.append(Word(prefix: "YEAR", link: "DECADE", suffix: "CENTURY" ))
        info.wordBank.append(Word(prefix: "WORDS", link: "ARTICLE", suffix: "BOOK" ))
        info.wordBank.append(Word(prefix: "FAR", link: "EAST", suffix: "SIDE" ))
        info.wordBank.append(Word(prefix: "GOOD", link: "STOCK", suffix: "PHOTO" ))
        info.wordBank.append(Word(prefix: "MEDICAL", link: "TREATMENT", suffix: "TABLE" ))
        info.wordBank.append(Word(prefix: "MEDIUM", link: "SIZE", suffix: "FOOTWEAR" ))
        info.wordBank.append(Word(prefix: "LUCKY", link: "DOG", suffix: "DAY" ))
        info.wordBank.append(Word(prefix: "RELIEF", link: "FUND", suffix: "RAISING" ))
        info.wordBank.append(Word(prefix: "DIGITAL", link: "MEDIA", suffix: "LAB" ))
        info.wordBank.append(Word(prefix: "HAND", link: "SIGN", suffix: "OFF" ))
        info.wordBank.append(Word(prefix: "AFTER", link: "THOUGHT", suffix: "OUT" ))
        info.wordBank.append(Word(prefix: "RICH", link: "LIST", suffix: "MEMBER" ))
        info.wordBank.append(Word(prefix: "TOTAL", link: "QUALITY", suffix: "CONTROL" ))
        info.wordBank.append(Word(prefix: "BLOOD", link: "PRESSURE", suffix: "VALVE" ))
        info.wordBank.append(Word(prefix: "CODED", link: "ANSWER", suffix: "SERVICE" ))
        info.wordBank.append(Word(prefix: "NATURAL", link: "RESOURCE", suffix: "COUNCIL" ))
        info.wordBank.append(Word(prefix: "EMERGENCY", link: "MEETING", suffix: "ROOM" ))
        info.wordBank.append(Word(prefix: "TROPICAL", link: "DISEASE", suffix: "CURE" ))
        info.wordBank.append(Word(prefix: "GREAT", link: "SUCCESS", suffix: "ATTAINED" ))
        info.wordBank.append(Word(prefix: "TEA", link: "CUP", suffix: "CAKE" ))
        info.wordBank.append(Word(prefix: "TOTAL", link: "AMOUNT", suffix: "PAID" ))
        info.wordBank.append(Word(prefix: "NATURAL", link: "ABILITY", suffix: "METRIC" ))
        info.wordBank.append(Word(prefix: "TEACHING", link: "STAFF", suffix: "ROOM" ))
        info.wordBank.append(Word(prefix: "GOOD", link: "CHARACTER", suffix: "TRAIT" ))
        info.wordBank.append(Word(prefix: "SPORADIC", link: "GROWTH", suffix: "FORECAST" ))
        info.wordBank.append(Word(prefix: "GRADUATE", link: "DEGREE", suffix: "PROGRAM" ))
        info.wordBank.append(Word(prefix: "MILITARY", link: "ATTACK", suffix: "PLANE" ))
        info.wordBank.append(Word(prefix: "COAL", link: "REGION", suffix: "POLICY" ))
        info.wordBank.append(Word(prefix: "MATCH", link: "BOX", suffix: "CUTTER" ))
        info.wordBank.append(Word(prefix: "LOCAL", link: "TV", suffix: "SCHEDULE" ))
        info.wordBank.append(Word(prefix: "TEACHER", link: "TRAINING", suffix: "COLLEGE" ))
        info.wordBank.append(Word(prefix: "AUTO", link: "TRADE", suffix: "UNION" ))
        info.wordBank.append(Word(prefix: "BEST", link: "DEAL", suffix: "BROKER" ))
        info.wordBank.append(Word(prefix: "NATIONAL", link: "ELECTION", suffix: "NIGHT" ))
        info.wordBank.append(Word(prefix: "GOOD", link: "FEELING", suffix: "SLEEPY" ))
        info.wordBank.append(Word(prefix: "METRIC", link: "STANDARD", suffix: "SIZE" ))
        info.wordBank.append(Word(prefix: "DRAFT", link: "BILL", suffix: "SPONSOR" ))
        info.wordBank.append(Word(prefix: "ENCRYPTED", link: "MESSAGE", suffix: "CYPHER" ))
        info.wordBank.append(Word(prefix: "CHEMICAL", link: "ANALYSIS", suffix: "METHOD" ))
        info.wordBank.append(Word(prefix: "COST", link: "BENEFIT", suffix: "ANALYSIS" ))
        info.wordBank.append(Word(prefix: "OPPOSITE", link: "SEX", suffix: "GENE" ))
        info.wordBank.append(Word(prefix: "TRIAL", link: "LAWYER", suffix: "CASE" ))
        info.wordBank.append(Word(prefix: "CROSS", link: "SECTION", suffix: "HEAD" ))
        info.wordBank.append(Word(prefix: "CLEAR", link: "GLASS", suffix: "TABLE" ))
        info.wordBank.append(Word(prefix: "SPECIAL", link: "SKILL", suffix: "CENTER" ))
        info.wordBank.append(Word(prefix: "SORORITY", link: "SISTER", suffix: "IN LAW" ))
        info.wordBank.append(Word(prefix: "RESCUE", link: "OPERATION", suffix: "TEAM" ))
        info.wordBank.append(Word(prefix: "HATE", link: "CRIME", suffix: "SCENE" ))
        info.wordBank.append(Word(prefix: "ON", link: "STAGE", suffix: "FRIGHT" ))
        info.wordBank.append(Word(prefix: "EXPERT", link: "AUTHORITY", suffix: "POWER" ))
        info.wordBank.append(Word(prefix: "CREATIVE", link: "DESIGN", suffix: "AGENCY" ))
        info.wordBank.append(Word(prefix: "MIXED", link: "SORT", suffix: "ORDER" ))
        info.wordBank.append(Word(prefix: "FIRST", link: "ONE", suffix: "ALONE" ))
        info.wordBank.append(Word(prefix: "INTIMATE", link: "KNOWLEDGE", suffix: "KEY" ))
        info.wordBank.append(Word(prefix: "TOY", link: "GUN", suffix: "LICENSE" ))
        info.wordBank.append(Word(prefix: "FUEL", link: "STATION", suffix: "WAGON" ))
        info.wordBank.append(Word(prefix: "CORPORATE", link: "STRATEGY", suffix: "GAME" ))
        info.wordBank.append(Word(prefix: "PLAIN", link: "TRUTH", suffix: "SEEKER" ))
        info.wordBank.append(Word(prefix: "BIRD", link: "SONG", suffix: "THRUSH" ))
        info.wordBank.append(Word(prefix: "FINE", link: "EXAMPLE", suffix: "LIKE" ))
        info.wordBank.append(Word(prefix: "LONG", link: "LEG", suffix: "UP" ))
        info.wordBank.append(Word(prefix: "LEADING", link: "PUBLIC", suffix: "AFFAIR" ))
        info.wordBank.append(Word(prefix: "SWEEPING", link: "EXECUTIVE", suffix: "POWER" ))
        info.wordBank.append(Word(prefix: "PARTIAL", link: "SET", suffix: "APART" ))
        info.wordBank.append(Word(prefix: "LOUD", link: "ROCK", suffix: "MUSIC" ))
        info.wordBank.append(Word(prefix: "TYPED", link: "NOTE", suffix: "BOOK" ))
        info.wordBank.append(Word(prefix: "MIDDLE", link: "MANAGER", suffix: "CLASS" ))
        info.wordBank.append(Word(prefix: "SELF", link: "HELP", suffix: "WANTED" ))
        info.wordBank.append(Word(prefix: "EGG", link: "CUP", suffix: "CAKE" ))
        info.wordBank.append(Word(prefix: "FULL", link: "STOP", suffix: "LIGHT" ))
        info.wordBank.append(Word(prefix: "PASS", link: "BOOK", suffix: "WORM" ))
        info.wordBank.append(Word(prefix: "FULL", link: "MOON", suffix: "LIGHT" ))
        info.wordBank.append(Word(prefix: "SUN", link: "LIGHT", suffix: "HOUSE" ))
        info.wordBank.append(Word(prefix: "WEDDING", link: "RING", suffix: "ROAD" ))
        info.wordBank.append(Word(prefix: "LEFT", link: "WING", suffix: "SPAN" ))
        info.wordBank.append(Word(prefix: "RIGHT", link: "BACK", suffix: "YARD" ))
        info.wordBank.append(Word(prefix: "BRAVE", link: "HEART", suffix: "BEAT" ))
        info.wordBank.append(Word(prefix: "FIRE", link: "MAN", suffix: "HUNT" ))
        info.wordBank.append(Word(prefix: "FREE", link: "FALL", suffix: "DOWN" ))
        info.wordBank.append(Word(prefix: "BACK", link: "ROAD", suffix: "RAGE" ))
        info.wordBank.append(Word(prefix: "SUGAR", link: "PLUM", suffix: "CAKE" ))
        info.wordBank.append(Word(prefix: "FIRST", link: "LIGHT", suffix: "SHIP" ))
        info.wordBank.append(Word(prefix: "AWAY", link: "DAY", suffix: "BREAK" ))
        info.wordBank.append(Word(prefix: "GINGER", link: "BREAD", suffix: "BASKET" ))
        info.wordBank.append(Word(prefix: "SUMMER", link: "FRUIT", suffix: "COCKTAIL" ))
        info.wordBank.append(Word(prefix: "PALM", link: "TREE", suffix: "NUT" ))
        info.wordBank.append(Word(prefix: "SWEET", link: "CORN", suffix: "BEEF" ))
        info.wordBank.append(Word(prefix: "BEST", link: "FRIEND", suffix: "SHIP" ))
        info.wordBank.append(Word(prefix: "HIP", link: "HOP", suffix: "SCOTCH" ))
        info.wordBank.append(Word(prefix: "BUTTER", link: "BALL", suffix: "BEARING" ))
        info.wordBank.append(Word(prefix: "DAY", link: "BED", suffix: "ROOM" ))
        info.wordBank.append(Word(prefix: "BALL", link: "BOY", suffix: "HOOD" ))
        info.wordBank.append(Word(prefix: "HORSE", link: "RIDING", suffix: "BOOT" ))
        info.wordBank.append(Word(prefix: "GHOST", link: "STORY", suffix: "BOARD" ))
        info.wordBank.append(Word(prefix: "APPLE", link: "PIE", suffix: "PLATE" ))
        info.wordBank.append(Word(prefix: "QUICK", link: "STEP", suffix: "SON" ))
        info.wordBank.append(Word(prefix: "GIRL", link: "FRIEND", suffix: "SHIP" ))
        info.wordBank.append(Word(prefix: "LAST", link: "DANCE", suffix: "STUDIO" ))
        info.wordBank.append(Word(prefix: "BED", link: "BUG", suffix: "BEAR" ))
        info.wordBank.append(Word(prefix: "IRON", link: "BRIDGE", suffix: "PORT" ))
        info.wordBank.append(Word(prefix: "RED", link: "EARTH", suffix: "WORKS" ))
        info.wordBank.append(Word(prefix: "DOVE", link: "TAIL", suffix: "COAT" ))
        info.wordBank.append(Word(prefix: "BLUE", link: "INK", suffix: "SPOT" ))
        info.wordBank.append(Word(prefix: "DAY", link: "JOB", suffix: "LOT" ))
        info.wordBank.append(Word(prefix: "BUS", link: "RIDE", suffix: "SHARE" ))
        info.wordBank.append(Word(prefix: "GUMMY", link: "BEAR", suffix: "HUG" ))
        info.wordBank.append(Word(prefix: "JELLY", link: "BEAN", suffix: "SOUP" ))
        info.wordBank.append(Word(prefix: "TOM", link: "THUMB", suffix: "NAIL" ))
        info.wordBank.append(Word(prefix: "NORTH", link: "POLE", suffix: "VAULT" ))
        info.wordBank.append(Word(prefix: "QUICK", link: "SILVER", suffix: "SMITH" ))
        info.wordBank.append(Word(prefix: "FAST", link: "FORWARD", suffix: "GROUP" ))
        info.wordBank.append(Word(prefix: "MAIN", link: "FLOOR", suffix: "COVER" ))
        info.wordBank.append(Word(prefix: "CAR", link: "PET", suffix: "SHOP" ))
        info.wordBank.append(Word(prefix: "SUMMER", link: "TIME", suffix: "SHARE" ))
        info.wordBank.append(Word(prefix: "SHOUT", link: "OUT", suffix: "LAST" ))
        info.wordBank.append(Word(prefix: "MORE", link: "TIME", suffix: "LESS" ))
        info.wordBank.append(Word(prefix: "PIXIE", link: "DUST", suffix: "BIN" ))
        info.wordBank.append(Word(prefix: "WET", link: "RAG", suffix: "DOLL" ))
        info.wordBank.append(Word(prefix: "START", link: "UP", suffix: "STAIRS" ))
        info.wordBank.append(Word(prefix: "UNDER", link: "ARM", suffix: "WRESTLE" ))
        info.wordBank.append(Word(prefix: "TWO", link: "FOR", suffix: "TEA" ))
        info.wordBank.append(Word(prefix: "GRAND", link: "MASTER", suffix: "MIND" ))
        info.wordBank.append(Word(prefix: "RED", link: "BLOOD", suffix: "BANK" ))
        info.wordBank.append(Word(prefix: "EURO", link: "DOLLAR", suffix: "BILL" ))
        info.wordBank.append(Word(prefix: "DRIED", link: "DATE", suffix: "PALM" ))
        info.wordBank.append(Word(prefix: "RIPE", link: "FIG", suffix: "TREE" ))
        info.wordBank.append(Word(prefix: "GREEN", link: "COMMON", suffix: "SENSE" ))
        info.wordBank.append(Word(prefix: "FRONT", link: "TOOTH", suffix: "PASTE" ))
        info.wordBank.append(Word(prefix: "OPEN", link: "MOUTH", suffix: "WASH" ))
        info.wordBank.append(Word(prefix: "CARD", link: "BOARD", suffix: "ROOM" ))
    }
}

