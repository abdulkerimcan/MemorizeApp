//
//  ContentView.swift
//  MemorizeApp
//
//  Created by Abdulkerim Can on 26.05.2024.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel: MemoryViewModel
    let aspectRadio: CGFloat = 2/3
    var body: some View {
        VStack {
            title
            cards.animation(.default, value: viewModel.cards)
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
        AspectVGrid(items: viewModel.cards, aspectRadio: aspectRadio) { card in
            CardView(card: card)
                .padding(4)
                .onTapGesture {
                    viewModel.choose(card)
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
            Group {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(card.content)
                    .font(.system(size: 200))
                    .minimumScaleFactor(0.01)
                    .aspectRatio(1, contentMode: .fit)
            }.opacity(card.isFacedUp ? 1 : 0)
            base.fill().opacity(card.isFacedUp ? 0 : 1)
        }.opacity(card.isFacedUp || !card.isMatched ? 1: 0)
        
    }
}

#Preview {
    EmojiMemoryGameView(viewModel: MemoryViewModel())
}
