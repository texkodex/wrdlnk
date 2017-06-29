//
//  DataExchange.swift
//  wrdlnk
//
//  Created by sparkle on 6/14/17.
//  Copyright © 2017 teknowsys. All rights reserved.
//

import Foundation

// Test using http.bin and requestb.in
// "https://httpbin.org/ip"

class DataExchange: NSObject {
    var name: String?
    var groupid: String?
    var key: String?
    var wordGroup: [Word]?
    
    override func setValue(_ value: Any?, forKey key: String) {
        if key == "words" {
            wordGroup = [Word]()
            for dict in value as! [[String: Any]] {
                let word = Word(prefix: dict["prefix"] as! String, link: dict["link"] as! String, suffix: dict["suffix"] as! String)
                //word.setValuesForKeys(dict)
                wordGroup?.append(word)
            }
        } else {
            super.setValue(value, forKey: key)
        }
    }
    
    static func fetchWordList(completionnHander: @escaping ([Word]) -> ()) {
        print("Entering \(#file):: \(#function) at line \(#line)")
        let urlString = "http://www.owsys.com/wlink/api/wlink_default.json"
        let request = URLRequest(url:URL(string: urlString)!)
        URLSession.shared.dataTask(with: request as URLRequest) { (data, response, error)  in
            
            if error != nil {
                print(error!)
                return
            }
            
            do {
                let json = try JSONSerialization.jsonObject(with: data!) as! [String: Any]
                var wordGroup = [Word]()
                
                for outer in json["wordgroups"] as! [[String: Any]] {
                    
                    for dict in outer["words"] as! [[String: Any]] {
                        print(dict)
                        
                        let word = Word(prefix: dict["prefix"] as! String, link: dict["link"] as! String, suffix: dict["suffix"] as! String)
                        wordGroup.append(word)
                    }
                }
                
                DispatchQueue.main.async(execute: { () -> Void in
                    completionnHander(wordGroup)
                })
            } catch let error as NSError {
                print("Error: \(error)")
            }
        }.resume()
    }
    
    static func fileFetchWorldList(completionnHander: @escaping ([Word]) -> ()) {
        if let path = Bundle.main.url(forResource: "wlink_default", withExtension: "json") {
            
            do {
                let jsonData = try Data(contentsOf: path, options: [] )
                var wordGroup = [Word]()
                do {
                   
                    let json = try JSONSerialization.jsonObject(with: jsonData) as! [String: Any]
                    
                    
                    for outer in json["wordgroups"] as! [[String: Any]] {
                     
                        for dict in outer["words"] as! [[String: Any]] {
                        print(dict)
                        
                        let word = Word(prefix: dict["prefix"] as! String, link: dict["link"] as! String, suffix: dict["suffix"] as! String)
                        //word.setValuesForKeys(dict)
                        wordGroup.append(word)
                        }
                    }
                    
                    DispatchQueue.main.async(execute: { () -> Void in
                        completionnHander(wordGroup)
                    })
                    
                } catch let error as NSError {
                    print("Error: \(error)")
                }
            } catch let error as NSError {
                print("Error: \(error)")
            }
        }
    }
}

struct Word {
    let prefix: String
    let link: String
    let suffix: String
    let level: Int
    
    init(prefix: String, link: String, suffix: String, level: Int = 0) {
        self.prefix = prefix
        self.link = link
        self.suffix = suffix
        self.level = level
    }
}

struct WordList {
    
    fileprivate struct info {
        static var index: Int = 0
        static var initialize: Bool = false
        static var wordBank: [Word] = []
    }
    
    init() {
    }
}

extension WordList {
   
    
    func isEmpty() -> Bool {
        return info.initialize == false
    }
    
    mutating func setupWords() {
        if isEmpty() {
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
        }
    }
    
    mutating func getWords() -> Word? {
        if isEmpty() {
            setupWords()
            info.initialize = true
        }
        else {
            info.index = info.index + 1
            info.index = info.index % info.wordBank.count
        }
        
        return info.wordBank.count > 0 ? info.wordBank[info.index] : nil
    }
   
    func getCurrentWords() -> Word? {
        return isEmpty() ? nil : info.wordBank[info.index]
    }
    
 }