//
//  Card.swift
//  Deck Of One Card
//
//  Created by Curt McCune on 6/7/22.
//

import Foundation

struct Card: Decodable {
    var suit: String
    var value: String
    var image: URL
}

struct TopLevelObject: Decodable {
    var cards: [Card]
}
