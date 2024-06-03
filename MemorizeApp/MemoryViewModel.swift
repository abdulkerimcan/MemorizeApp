//
//  MemoryViewModel.swift
//  MemorizeApp
//
//  Created by Abdulkerim Can on 2.06.2024.
//

import Foundation


class MemoryViewModel: ObservableObject {
    private static let emojis =  ["🎃","🦇","💀","👻"]
    
    @Published private var model = createMemoryGame()
    
    var cards: [MemoryGame<String>.Card] {
        return model.cards
    }
    
    private static func createMemoryGame() -> MemoryGame<String> {
        return MemoryGame<String>(numberOfPairsOfCard: 4) { index in
            return emojis.indices.contains(index) ? emojis[index] : "⁉️"
        }
    }
    
    func shuffle() {
        model.shuffle()
        objectWillChange.send()
    }
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
}
