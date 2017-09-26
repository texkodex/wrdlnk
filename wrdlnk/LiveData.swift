//
//  LiveData.swift
//  wrdlnk
//
//  Created by sparkle on 9/3/17.
//  Copyright © 2017 teknowsys. All rights reserved.
//

import Foundation

struct LiveData {
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let LiveDataArchiveURL = DocumentsDirectory.appendingPathComponent(StorageForLiveData)
    
    fileprivate struct info {
        static var index: Int = 0
        static var initialize: Bool = false
        static var liveDataList = [LiveData]()
    }
    
    public internal(set) var position: String
    public internal(set) var level: Int
    
    static var sharedInstance = LiveData()
    
    private init() {
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
}

extension LiveData {
    class Coding: NSObject, NSCoding {
        let liveData: LiveData?
        
        init(liveData: LiveData) {
            self.liveData = liveData
            super.init()
        }
        
        required init?(coder aDecoder: NSCoder) {
            guard let position = aDecoder.decodeObject(forKey: "position") as? String else {
                return nil
            }

            let level = aDecoder.decodeInteger (forKey: "level")
            
            liveData = LiveData(position: position, level: level)
            
            super.init()
        }
        
        public func encode(with aCoder: NSCoder) {
            guard let liveData = liveData else {
                return
            }
            
            aCoder.encode(liveData.position, forKey: "position")
            aCoder.encode(liveData.level, forKey: "level")
        }
    }
}

extension LiveData: Encodable {
    var encoded: Decodable? {
        return LiveData.Coding(liveData: self)
    }
}

extension LiveData.Coding: Decodable {
    var decoded: Encodable? {
        return self.liveData
    }
}

extension LiveData {
    func isEmpty() -> Bool {
        return info.liveDataList.isEmpty
    }
    
    func addItem(item: LiveData) {
        return info.liveDataList.append(item)
    }
    
    func contains(item: LiveData) -> Bool {
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
    
    func allItems() -> [LiveData] {
        return info.liveDataList
    }
    
    mutating func deleteLiveData() {
        self.clear()
        self.saveLiveData()
    }
    
    mutating func loadLiveData() {
        if info.initialize { return }
        do {
            let data = try Data(contentsOf: LiveData.LiveDataArchiveURL, options: .alwaysMapped)
            if let back = (NSKeyedUnarchiver.unarchiveObject(with: data) as? [LiveData.Coding])?.decoded {
                liveDataList(liveDataList: back as! [LiveData])
            }
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    mutating func saveLiveData() {
        do {
            let data = NSKeyedArchiver.archivedData(withRootObject: info.liveDataList.encoded)
            try data.write(to: LiveData.LiveDataArchiveURL, options: .atomic)
        } catch let error {
            print(error.localizedDescription)
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
