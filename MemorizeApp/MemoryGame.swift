//
//  MemoryGame.swift
//  MemorizeApp
//
//  Created by Abdulkerim Can on 2.06.2024.
//

import Foundation

struct MemoryGame<T> where T: Equatable {
    private(set) var cards: [Card]
    
    init(numberOfPairsOfCard: Int, cardContentFactory: (Int) -> T) {
        cards = []
        
        for pairIndex in 0..<max(2, numberOfPairsOfCard) {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content, id: "\(pairIndex+1)a"))
            cards.append(Card(content: content, id: "\(pairIndex+1)b"))
        }
    }
    
    mutating func shuffle() {
        cards.shuffle()
    }
    
    func choose(_ card: Card) {
        
    }
    struct Card: Equatable, Identifiable {
        var isFacedUp = true
        var isMatched = false
        var content: T
        var id: String
    }

}
