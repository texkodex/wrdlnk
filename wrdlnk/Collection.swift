//
//  Collection.swift
//  wrdlnk
//
//  Created by sparkle on 6/19/17.
//  Copyright © 2017 teknowsys. All rights reserved.
//

import Foundation

// Generic inSswift

extension Sequence
where Iterator.Element: Equatable {
    func containsOnly(_ value: (Iterator.Element)->Bool) -> Bool {
        return !contains { $0 != value }
    }
}
// let mySequence = [1, 2, 3, 4, 5, 6]

// mySequence.constainsOnly(5)


// Extending Sequence Swift 4

extension Sequence
where Element: Equatable {
    func containsOnly(_ value: (Element)->Bool) -> Bool {
        return
    }
}

// Swift 3 Sequence

protocol Sequence {
    associatedtype Iterator: IteratorProtocol
    
    func makeIterator() -> Iterator
}

protocol IteratorProtocol {
    associatedtype Element
    
    mutating func next() -> Element?
}

// SE-0142: Swift 4 Sequence

protocol Sequence {
    associatedtype Element
    associatedtype Iterator: IteratorProtocol where Iterator.Element == Element
    
    func makeIterator() -> Iterator
}

protocol IteratorProtocol {
    associatedtype Element
    
    mutating func next() -> Element?
}

// Other important constrainnts

protocol Sequence {
    associatedtype SubSequence: Sequence
        where Subsequence.Subsequence == SubSequence,
                SubSequence.Element == Element
}

// Reundant constarints in Swift 3

extension Collection
where   Element: Equatable,
        SubSequence: Collection,
        SubSequence.SubSequence == SubSequence,
        SubSequence.Element == Element {
    func containsOnly(_ x: Element) -> Bool {
        return is Empty
            || (first == x && dropFirst().containsOnly(x))
    }
}

// SE-0148: Generic Subscripts
// Use case: partial ranges

let values = "one,two,three..."

var i = values.startIndex
while let ccomma = values[i...].index(of: ",") {
    if values[i..<comma] == "two" {
        print("found it!")
    }
    i = values.index(after: comma)
}




// Range Expression Swift 4

struct PartialRangeFrom<Bound: Comparable> {
    let lowerBound: Bound
    
}

protocol RangeExpression {
    func relative<C: Collection>(to collection: C) -> Range<Bound>
        where C.Index == Bound
}

extension PartialRangeFrom: RangeExpression {
    func relative<C>(to collection: C) -> Range<Bound>
        where C.Index == Bound {
            return lowerBound..<collection.endIndex
    }
}

// Noew with protocol we can extend..

extension String {
    subscript<R: RangeExpression>(range: R) -> Substring where R.Bound == Index {
        return self[range.relative(to: self)]
    }
}

/*
 SE-0104 Protocol-oriented integers
 SE-0153 Dictionary & Set enhancements
 SE-0163 Improved String C Interop and Transcoding
 SE-0170 NSNumber bridging and Numeric types
 SE-0173 Add MutableCollection.swapAt(_:_:)
 SE-0174 Change fileter to return Self for RangeReplaceableCollecttion
 */










