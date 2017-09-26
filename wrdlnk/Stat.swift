//
//  Stat.swift
//  wrdlnk
//
//  Created by sparkle on 9/26/17.
//  Copyright © 2017 teknowsys. All rights reserved.
//

import Foundation

// MARK:- Stat structure

class Stat: NSObject, NSCoding {
    struct Keys {
        static let phrase = "phrase"
        static let minimum = "minimum"
        static let accuracy = "accuracy"
        static let percentage = "percentage"
        static let timeSpan = "timeSpan"
    }
    
    private var _phrase: String? = ""
    private var _accuracy: Float = 0
    private var _minimum: Int = 0
    private var _percentage: Float = 0
    private var _timeSpan: TimeInterval = 0
    
    override init() {}
    
    init(phrase: String?, accuracy: Float, minimum: Int, percentage: Float, timeSpan: TimeInterval = 0) {
        self._phrase = phrase
        self._accuracy = accuracy
        self._minimum = minimum
        self._percentage = percentage
        self._timeSpan = timeSpan
    }
    
    required convenience init(coder decoder: NSCoder) {
        // Retrieve data
        self.init()
        _phrase = decoder.decodeObject(forKey: Keys.phrase) as? String
        _accuracy = decoder.decodeFloat(forKey: Keys.accuracy)
        _minimum = decoder.decodeInteger(forKey: Keys.minimum)
        _percentage = decoder.decodeFloat(forKey: Keys.percentage)
        _timeSpan = decoder.decodeDouble(forKey: Keys.timeSpan)
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(_phrase, forKey: "phrase")
        coder.encode(_accuracy, forKey: "accuracy")
        coder.encode(_minimum, forKey: "minimum")
        coder.encode(_percentage, forKey: "percentage")
        coder.encode(_timeSpan, forKey: "timeSpan")
    }
    
    var phrase: String? {
        get {
            return _phrase
        }
        set {
            _phrase = newValue
        }
    }
    
    var accuracy: Float {
        get {
            return _accuracy
        }
        set {
            _accuracy = newValue
        }
    }
    
    var minimum: Int {
        get {
            return _minimum
        }
        set {
            _minimum = newValue
        }
    }
    
    var percentage: Float {
        get {
            return _percentage
        }
        set {
            _percentage = newValue
        }
    }
    
    var timeSpan: TimeInterval {
        get {
            return _timeSpan
        }
        set {
            _timeSpan = newValue
        }
    }
}

public struct Queue<T>: ExpressibleByArrayLiteral {
    public private(set) var elements: Array<T> = []
    public mutating func push(value: T) { elements.append(value) }
    public mutating func pop() -> T { return elements.removeFirst() }
    public var isEmpty: Bool { return elements.isEmpty }
    public var isThreshold: Bool { return elements.count > StatDataSize }
    public var count: Int { return elements.count }
    public init(arrayLiteral elements: T...) { self.elements = elements }
}

struct StatData {
    
    var store = DataStore.sharedInstance
    
    var filePath: String {
        let manager = FileManager.default
        let url = manager.urls(for: .documentDirectory, in: .userDomainMask).first
        print("The url path in the document directory \(String(describing: url))")
        return(url!.appendingPathComponent(StorageForStatItem).path)
    }
    
    fileprivate struct info {
        static var statQueue = Queue<Stat>()
        static var initilize = false
    }
    
    static let sharedInstance = StatData()
    private init() {
        if debugInfo {
            self.purge()
        }
        if info.initilize { return }
        
        if AppDefinition.defaults.keyExist(key: preferenceGameStatKey)
            && AppDefinition.defaults.bool(forKey: preferenceGameStatKey) {
            if self.isEmpty() {
                loadData()
                info.initilize = true
            }
        }
    }
    
    func saveData() {
        NSKeyedArchiver.archiveRootObject(info.statQueue.elements, toFile: filePath)
        if !isEmpty() && !AppDefinition.defaults.keyExist(key: preferenceGameStatKey)
            || !AppDefinition.defaults.bool(forKey: preferenceGameStatKey) {
            AppDefinition.defaults.set(true, forKey: preferenceGameStatKey)
        }
    }
    
    fileprivate func clearData() {
        self.store.itemsStat.removeAll()
        self.purge()
        NSKeyedArchiver.archiveRootObject(self.store.itemsStat, toFile: filePath)
        AppDefinition.defaults.set(false, forKey: preferenceGameStatKey)
    }
    
    fileprivate func loadData() {
        if info.initilize { return }
        if let itemsStat = NSKeyedUnarchiver.unarchiveObject(withFile: filePath) as? [Stat] {
            self.store.itemsStat = itemsStat
            AppDefinition.defaults.set(true, forKey: preferenceGameStatKey)
        }
        for stat in self.store.itemsStat {
            print("reloaded phrase: \(String(describing: stat.phrase))")
            self.push(element: Stat(phrase: stat.phrase, accuracy: stat.accuracy, minimum: stat.minimum, percentage: stat.percentage, timeSpan: stat.timeSpan))
        }
    }
}

extension StatData {
    func isEmpty() -> Bool {
        return info.statQueue.elements.count == 0
    }
    
    func count() -> Int {
        return info.statQueue.count
    }
    
    func elements() -> [Stat] {
        return info.statQueue.elements
    }
    
    func push(element: Stat) {
        prune()
        unique()
        info.statQueue.push(value: element)
    }
    
    func pop() -> Stat? {
        return info.statQueue.pop()
    }
    
    func prune() {
        while info.statQueue.isThreshold {
            _ = pop()
        }
    }
    
    func purge() {
        while !isEmpty() {
            _ = pop()
        }
    }
    
    func unique() {
        print("To implement unique() method.")
    }
}

