//
//  TempBits.swift
//  wrdlnk
//
//  Created by sparkle on 6/14/17.
//  Copyright © 2017 teknowsys. All rights reserved.
//

#if false
    class tempbits {
        // Memberwise initializer
        init(entities: [GKEntity], graphs: [String:GKGraph], counters: VowelCount, spriteNodeList: [SKSpriteNode]) {
            self.entities = entities
            self.graphs = graphs
            self.counters = counters
            self.spriteNodeList = spriteNodeList
            super.init(size: CGSize.init(width: 800, height: 800))
        }

        required convenience init?(coder decoder: NSCoder) {
            guard let entities = decoder.decodeObject(forKey: "entities") as? [GKEntity],
                let graphs = decoder.decodeObject(forKey: "graphs") as? [String:GKGraph],
                let counters = decoder.decodeObject(forKey: "counters") as? VowelCount,
                let spriteNodeList = decoder.decodeObject(forKey: "spriteNodeList") as? [SKSpriteNode]
                else { return nil }

            self.init(
                entities: entities,
                graphs: graphs,
                counters: counters,
                spriteNodeList: spriteNodeList
            )
        }

        func encodeWithCoder(coder: NSCoder) {
            coder.encode(self.entities, forKey: "entities")
            coder.encode(self.graphs, forKey: "graphs")
            coder.encode(self.counters, forKey: "counters")
            coder.encode(self.spriteNodeList, forKey: "spriteNodeList")
        }
    }
#endif
