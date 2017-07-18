//
//  DataStore.swift
//  wrdlnk
//
//  Created by sparkle on 7/17/17.
//  Copyright © 2017 teknowsys. All rights reserved.
//

class DataStore {
    static let sharedInstance = DataStore()
    private init() {}
    var statDataItems: [Stat] = []
}
