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
