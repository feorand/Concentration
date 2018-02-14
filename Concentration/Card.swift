//
//  Card.swift
//  Concentration
//
//  Created by Pavel Prokofyev on 27.12.2017.
//  Copyright © 2017 Pavel Prokofyev. All rights reserved.
//

import Foundation

struct Card {

    var isFlipped = false
    var isEnabled = true
    var id:Int
    
    init(withId id: Int) {
        self.id = id
    }
    
    mutating func flip() {
        isFlipped = !isFlipped
    }
}

extension Card: Equatable {
    public static func ==(lhs: Card, rhs: Card) -> Bool {
        return (lhs.id == rhs.id)
    }
}

extension Card: Hashable {
    var hashValue: Int {
        return id.hashValue
    }
}
