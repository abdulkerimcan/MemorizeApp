//
//  ContentView.swift
//  MemorizeApp
//
//  Created by Abdulkerim Can on 26.05.2024.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel: MemoryViewModel
    
    var body: some View {
        
        VStack {
            title
            ScrollView {
                cards.animation(.default, value: viewModel.cards)
            }
            Button("Shuffle") {
                viewModel.shuffle()
            }
        }
        .padding()
    }
    
    
    var title: some View {
        Text("Memorize!").font(.largeTitle).bold(true)
    }
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 85),spacing: .zero)], spacing: .zero) {
            ForEach(viewModel.cards) { card in
                CardView(card: card)
                    .aspectRatio(2/3, contentMode: .fit)
                    .padding(4)
            }
        }
        .foregroundStyle(.orange)
    }
}

struct CardView: View {
    var card: MemoryGame<String>.Card
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
                .fill(.white)
            Group {
                base
                base.strokeBorder(lineWidth: 2)
                Text(card.content)
                    .font(.system(size: 200))
                    .minimumScaleFactor(0.01)
                    .aspectRatio(1, contentMode: .fit)
            }.opacity(card.isFacedUp ? 1 : 0)
            base.fill().opacity(card.isFacedUp ? 0 : 1)
            
        }
        
    }
}

#Preview {
    EmojiMemoryGameView(viewModel: MemoryViewModel())
}
