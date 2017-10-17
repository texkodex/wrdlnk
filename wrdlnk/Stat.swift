//
//  Stat.swift
//  wrdlnk
//
//  Created by sparkle on 9/26/17.
//  Copyright © 2017 teknowsys. All rights reserved.
//

import Foundation

// MARK:- Stat structure

struct Stat: Codable {
    enum StatKeys: String, CodingKey{
        case phrase = "phrase"
        case minimum = "minimum"
        case accuracy = "accuracy"
        case percentage = "percentage"
        case timeSpan = "timeSpan"
    }
    
    var _phrase: String? = ""
    var _accuracy: Float = 0
    var _minimum: Int = 0
    var _percentage: Float = 0
    var _timeSpan: TimeInterval = 0
    
    
    init(phrase: String?, accuracy: Float, minimum: Int, percentage: Float, timeSpan: TimeInterval = 0) {
        self._phrase = phrase
        self._accuracy = accuracy
        self._minimum = minimum
        self._percentage = percentage
        self._timeSpan = timeSpan
    }
}

extension Stat {
    func encode(to encoder: Encoder) throws {
        // Store data
        var container = encoder.container(keyedBy: StatKeys.self)
        try container.encode(_phrase, forKey: .phrase)
        try container.encode(_accuracy, forKey: .accuracy)
        try container.encode(_minimum, forKey: .minimum)
        try container.encode(_percentage, forKey: .percentage)
        try container.encode(_timeSpan, forKey: .timeSpan)
    }
}

extension Stat {
    init(from decoder: Decoder) throws {
        // Retrieve data
        let container = try decoder.container(keyedBy: StatKeys.self)
        let _phrase: String = try container.decode(String.self, forKey: .phrase)
        let _accuracy: Float = try container.decode(Float.self, forKey: .accuracy)
        let _minimum: Int = try container.decode(Int.self, forKey: .minimum)
        let _percentage: Float = try container.decode(Float.self, forKey: .percentage)
        let _timeSpan: TimeInterval = try container.decode(TimeInterval.self, forKey: .timeSpan)
        
        self.init(phrase: _phrase, accuracy: _accuracy, minimum: _minimum, percentage: _percentage, timeSpan: _timeSpan)
    }
}

extension Stat {
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
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let LiveDataArchiveURL = DocumentsDirectory.appendingPathComponent(StorageForStatItem)
    
    var filePath: String {
        let manager = FileManager.default
        let url = manager.urls(for: .documentDirectory, in: .userDomainMask).first
        print("The url path in the document directory \(String(describing: url))")
        return(url!.appendingPathComponent(StorageForStatItem).path)
    }
    
    fileprivate struct info {
        static var statQueue = Queue<Stat>()
        static var initialize = false
    }
    
    var store = StatStore.sharedInstance
    
    static let sharedInstance = StatData()
    
    private init() {
        if debugInfo {
            self.purge()
        }
        if info.initialize { return }
        
        if AppDefinition.defaults.keyExist(key: preferenceGameStatKey)
            && AppDefinition.defaults.bool(forKey: preferenceGameStatKey) {
            if self.isEmpty() {
                loadData()
                info.initialize = true
            }
        }
    }
    
    func saveData() {
        trace("\(#file ) \(#line)", {"saveWordList - start: "})
        do {
            let stats = info.statQueue.elements
            let encoder = JSONEncoder()
            let data = try encoder.encode(stats)
            NSKeyedArchiver.archiveRootObject(data, toFile: filePath)
            
            if !isEmpty() && !AppDefinition.defaults.keyExist(key: preferenceGameStatKey)
                || !AppDefinition.defaults.bool(forKey: preferenceGameStatKey) {
                AppDefinition.defaults.set(true, forKey: preferenceGameStatKey)
            }
        } catch {
            print("saveData Stat Failed")
        }
    }
    
    fileprivate mutating func clearData() {
        if isEmpty() { return }
        trace("\(#file ) \(#line)", {"clearData Stat - ...: "})
        self.purge()
        NSKeyedArchiver.archiveRootObject(info.statQueue.elements, toFile: filePath)
        info.initialize = false
        AppDefinition.defaults.set(false, forKey: preferenceGameStatKey)
    }
    
    fileprivate mutating func loadData() {
        if info.initialize { return }
        guard let data = NSKeyedUnarchiver.unarchiveObject(withFile: filePath) as? Data else { return }
        do {
            let decoder = JSONDecoder()
            let itemsStat = try decoder.decode([Stat].self, from: data)
            assignLoadData(statList: itemsStat)
            if itemsStat.count > 0 { info.initialize = true }
        } catch {
            print("loadData Stat Failed")
        }
    }
    
    mutating func assignLoadData(statList: [Stat]) {
        if isEmpty() {
            for statItem in statList {
                info.statQueue.push(value: statItem)
            }
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
    
    mutating func push(element: Stat) {
        prune()
        unique()
        info.statQueue.push(value: element)
    }
    
    mutating func pop() -> Stat? {
        return info.statQueue.pop()
    }
    
    private func adjustThresholdIndices(isThreshold: Bool, copyIndex: Int) {
        if isThreshold {
            // adjust indices
            let diff = copyIndex - info.statQueue.count
            let lowerBound = AppDefinition.defaults.integer(forKey: preferenceAccuracyLowerBoundDataKey)
            if lowerBound > diff {
                AppDefinition.defaults.set(diff - lowerBound, forKey: preferenceAccuracyLowerBoundDataKey)
                AppDefinition.defaults.set(diff - lowerBound, forKey: preferenceTimeLowerBoundDataKey)
            } else {
                AppDefinition.defaults.set(0, forKey: preferenceAccuracyLowerBoundDataKey)
                AppDefinition.defaults.set(0, forKey: preferenceTimeLowerBoundDataKey)
            }
        }
    }
    
    mutating func prune() {
        let isThreshold = info.statQueue.isThreshold
        var copyIndex = 0
        if isThreshold {
            // record indices
            copyIndex = info.statQueue.count
        }
        while info.statQueue.isThreshold {
            let pruneSize = Int(StatDataSize / 10)
            for _ in 0..<pruneSize {
                _ = pop()
            }
        }
        adjustThresholdIndices(isThreshold: isThreshold, copyIndex: copyIndex)
    }
    
    mutating func purge() {
        while !isEmpty() {
            _ = pop()
        }
        info.initialize = false
    }
    
    func unique() {
        print("To implement unique() method.")
    }
}

class StatDataBox {
    private var statDataInstance: StatData!
    let queue = DispatchQueue(label: "com.teknowsys.statdata.queue")
    
    static var sharedInstance = StatDataBox()
    
    fileprivate init() {
        queue.sync {
            statDataInstance = StatData.sharedInstance
        }
    }
    
    func isEmpty() -> Bool {
        return statDataInstance.isEmpty()
    }
    
    func count() -> Int {
        return statDataInstance.count()
    }
    
    func elements() -> [Stat] {
        return statDataInstance.elements()
    }
    
    func push(element: Stat) {
        queue.sync {
            statDataInstance.push(element: element)
        }
    }
    
    func pop() -> Stat? {
        var result: Stat?
        queue.sync {
            result = statDataInstance.pop()
        }
        return result
    }

    func prune() {
        queue.sync {
            statDataInstance.prune()
        }
    }
    
    func purge() {
        queue.sync {
            statDataInstance.purge()
        }
    }
    
    func unique() {
        queue.sync {
            statDataInstance.unique()
        }
    }
    
    func loadData() {
        queue.sync {
            statDataInstance.loadData()
        }
    }
    
    func saveData() {
        queue.sync {
            statDataInstance.saveData()
        }
    }
}
