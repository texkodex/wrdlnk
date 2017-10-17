//
//  StatStore.swift
//  wrdlnk
//
//  Created by sparkle on 7/17/17.
//  Copyright © 2017 teknowsys. All rights reserved.
//

class StatStore {
    static let sharedInstance = StatStore()
    private init() {}
    var itemsStat: [Stat] = []
}
