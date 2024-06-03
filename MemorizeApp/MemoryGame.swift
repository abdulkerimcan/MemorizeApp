//
//  MemoryGame.swift
//  MemorizeApp
//
//  Created by Abdulkerim Can on 2.06.2024.
//

import Foundation

struct MemoryGame<T>{
    private(set) var cards: [Card]
    
    init(numberOfPairsOfCard: Int, cardContentFactory: (Int) -> T) {
        cards = []
        
        for pairIndex in 0..<max(2, numberOfPairsOfCard) {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content))
            cards.append(Card(content: content))
        }
    }
    
    mutating func shuffle() {
        cards.shuffle()
    }
    
    func choose(_ card: Card) {
        
    }
    struct Card {
        var isFacedUp = true
        var isMatched = false
        var content: T
    }

}
