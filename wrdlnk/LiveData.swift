//
//  LiveData.swift
//  wrdlnk
//
//  Created by sparkle on 9/3/17.
//  Copyright © 2017 teknowsys. All rights reserved.
//

import Foundation

struct LiveData: Codable {
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let LiveDataArchiveURL = DocumentsDirectory.appendingPathComponent(StorageForLiveData)
    
    var filePath: String {
        let manager = FileManager.default
        let url = manager.urls(for: .documentDirectory, in: .userDomainMask).first
        print("The url path in the document directory \(String(describing: url))")
        return(url!.appendingPathComponent(StorageForLiveData).path)
    }
    
    fileprivate struct info {
        static var index: Int = 0
        static var initialize: Bool = false
        static var liveDataList = [LiveData]()
    }
    
    public internal(set) var position: String
    public internal(set) var level: Int
    
    static var sharedInstance = LiveData()
    
    fileprivate init() {
        if debugInfo {
            info.liveDataList.removeAll()
            info.initialize = false
        }
        self.position = ""
        self.level = 0
    }
    
    init(position: String, level: Int = 0) {
        self.position = position
        self.level = level
    }
    
    func isEmpty() -> Bool {
        return info.initialize == false
    }
    
    mutating func addItem(item: LiveData) {
        return info.liveDataList.append(item)
    }
    
    enum LiveDataKeys: String, CodingKey {
        case position = "position"
        case level = "level"
    }
}

extension LiveData {
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: LiveDataKeys.self)
        try container.encode(position, forKey: .position)
        try container.encode(level, forKey: .level)
    }
}

extension LiveData {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: LiveDataKeys.self)
        let position: String = try container.decode(String.self, forKey: .position)
        let level: Int = try container.decode(Int.self, forKey: .level)
                
        self.init(position: position, level: level)
    }
}

extension LiveData {
    func allItems() -> [LiveData] {
        return info.liveDataList
    }
    
    func contains(item: LiveData) -> Bool {
        if isEmpty() { return false }
        for dataItem in info.liveDataList.enumerated() {
            if dataItem.element.position == item.position {
                return true
            }
        }
        return false
    }
    
    mutating func clear() {
        info.liveDataList.removeAll()
        info.initialize = false
    }
    
    mutating func deleteLiveData() {
        self.clear()
        self.saveLiveData()
    }
    
    mutating func loadLiveData() {
        guard let data = NSKeyedUnarchiver.unarchiveObject(withFile: filePath) as? Data else { return }
        do {
            let decoder = JSONDecoder()
            let liveDataList = try decoder.decode([LiveData].self, from: data)
            info.liveDataList = liveDataList
            info.initialize = true
        } catch {
            print("loadLiveData Failed")
        }
    }
    
    mutating func saveLiveData() {
        trace("\(#file ) \(#line)", {"saveLiveData - start: "})
        do {
            let livedata = info.liveDataList
            let encoder = JSONEncoder()
            let data = try encoder.encode(livedata)
            NSKeyedArchiver.archiveRootObject(data, toFile: filePath)
        } catch {
            print("saveLiveData Failed")
        }
    }

    mutating func liveDataList(liveDataList: [LiveData]) {
        if isEmpty() {
            for dataItem in liveDataList {
                info.liveDataList.append(dataItem)
                if !info.initialize {
                    info.initialize = true
                }
            }
        }
    }
}

class LiveDataBox {
    private var liveDataInstance: LiveData!
    let queue = DispatchQueue(label: "com.teknowsys.livedata.queue")
    
    static var sharedInstance = LiveDataBox()
    
    fileprivate init() {
        queue.sync {
            liveDataInstance = LiveData.sharedInstance
        }
    }
    
    func addItem(item: LiveData) {
        queue.sync {
            liveDataInstance.addItem(item: item)
        }
    }
    
    func allItems() -> [LiveData] {
        return liveDataInstance.allItems()
    }
    
    func contains(item: LiveData) -> Bool {
        return liveDataInstance.contains(item: item)
    }
    
    func isEmpty() -> Bool {
        return liveDataInstance.isEmpty()
    }
    
    func clear() {
        queue.sync {
            liveDataInstance.clear()
        }
    }
    
    func deleteLiveData() {
        queue.sync {
         liveDataInstance.deleteLiveData()
        }
    }
    
    func loadLiveData() {
        queue.sync {
          liveDataInstance.loadLiveData()
        }
    }
    
    func saveLiveData() {
        queue.sync {
            liveDataInstance.saveLiveData()
        }
    }
    
    func liveDataList(liveDataList: [LiveData]) {
        queue.sync {
           liveDataInstance.liveDataList(liveDataList: liveDataList)
        }
    }
}
