//
//  Array+Extensions.swift
//  wrdlnk
//
//  Created by sparkle on 10/13/17.
//  Copyright © 2017 teknowsys. All rights reserved.
//

import Foundation

extension Array {
    
    mutating func popLast(to otherArray: inout [Element]) -> Element? {
        guard self.count > 0 else { return nil }
        return otherArray.appendAndReturn(self.popLast()!)
    }
    
    mutating func appendAndReturn(_ element: Element) -> Element {
        self.append(element)
        return element
    }
}
