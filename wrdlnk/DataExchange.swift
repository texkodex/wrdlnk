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
        let urlString = remoteWordListSite
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
                        if debugInfo { print(dict) }
                        
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
    
    static func memoryFetchWorldList(completionnHander: @escaping ([Word]) -> ()) {
        let wordGroup = [Word]()
        DispatchQueue.main.async(execute: { () -> Void in completionnHander(wordGroup) })
    }
}

struct Word {
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
}

protocol Encodable {
    var encoded: Decodable? { get }
}

protocol Decodable {
    var decoded: Encodable? { get }
}

extension Sequence where Iterator.Element: Encodable {
    var encoded: [Decodable] {
        return self.filter({ $0.encoded != nil }).map({ $0.encoded! })
    }
}


extension Sequence where Iterator.Element: Decodable {
    var decoded: [Encodable] {
        return self.filter({ $0.decoded != nil }).map({ $0.decoded! })
    }
}

extension Word {
    class Coding: NSObject, NSCoding {
        let word: Word?
        
        init(word: Word) {
            self.word = word
            super.init()
        }

        required init?(coder aDecoder: NSCoder) {
            guard let prefix = aDecoder.decodeObject(forKey: "prefix") as? String,
                let link = aDecoder.decodeObject(forKey: "link") as? String,
                let suffix = aDecoder.decodeObject(forKey: "suffix") as? String,
                let level = aDecoder.decodeObject (forKey: "level") as? Int  else {
                    return nil
            }
            
            word = Word(prefix: prefix, link: link, suffix: suffix, level: level)
            
            super.init()
        }
        
        public func encode(with aCoder: NSCoder) {
            guard let word = word else {
                return
            }
            
            aCoder.encode(word.prefix, forKey: "prefix")
            aCoder.encode(word.link, forKey: "link")
            aCoder.encode(word.suffix, forKey: "suffix")
            aCoder.encode(word.level, forKey: "level")
        }
    }
}

extension Word: Encodable {
    var encoded: Decodable? {
        return Word.Coding(word: self)
    }
}

extension Word.Coding: Decodable {
    var decoded: Encodable? {
        return self.word
    }
}
