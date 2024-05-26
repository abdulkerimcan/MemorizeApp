//
//  ContentView.swift
//  MemorizeApp
//
//  Created by Abdulkerim Can on 26.05.2024.
//

import SwiftUI

struct ContentView: View {
    let emojis: [String] = ["🎃","👻","🍬","🦇","💀","🧡"]

    var body: some View {

        VStack(alignment: .leading) {
            Text("Memorize!").font(.largeTitle).bold(true)
            ScrollView {
                cards
            }
        }
        .padding()
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 90))]) {
            ForEach(emojis.indices,id: \.self) { index in
                CardView(content: emojis[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
        .foregroundStyle(.orange)
    }
}

struct CardView: View {
    let content: String
    @State var isFaceUp = false
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
                .fill(.white)
            Group {
                base
                base.strokeBorder(lineWidth: 2)
                Text(content)
                    .imageScale(.large)
                    .font(.largeTitle)
            }.opacity(isFaceUp ? 1 : 0)
            base.fill().opacity(isFaceUp ? 0 : 1)
            
        }.onTapGesture {
            isFaceUp.toggle()
        }
        
    }
}

#Preview {
    ContentView()
}
