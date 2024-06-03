//
//  MemoryGame.swift
//  MemorizeApp
//
//  Created by Abdulkerim Can on 2.06.2024.
//

import Foundation

struct MemoryGame<T> where T: Equatable {
    private(set) var cards: [Card]
    
    var indexOfTheOneAndOnlyFaceUpCard: Int? {
        get {cards.indices.filter { index in cards[index].isFacedUp }.only }
        
        set {
            cards.indices.forEach { cards[$0].isFacedUp = (newValue == $0)}
        }
    }
    
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
    
    mutating func choose(_  card: Card) {
        if let choosenIndex = cards.firstIndex(where: { cardToCheck in
            cardToCheck.id == card.id
        }) {
            if !cards[choosenIndex].isFacedUp && !cards[choosenIndex].isMatched {
                if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard {
                    if cards[choosenIndex].content == cards[potentialMatchIndex].content {
                        cards[choosenIndex].isMatched = true
                        cards[potentialMatchIndex].isMatched = true
                    }
                } else {
                    indexOfTheOneAndOnlyFaceUpCard = choosenIndex
                }
                cards[choosenIndex].isFacedUp = true
            }
        }
    }
    
    struct Card: Equatable, Identifiable {
        var isFacedUp = false
        var isMatched = false
        var content: T
        var id: String
    }

}

extension Array {
    var only: Element? {
        return count == 1 ? first : nil
    }
}
