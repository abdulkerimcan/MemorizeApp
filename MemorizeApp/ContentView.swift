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
        VStack {
            CardView(content: "🎃")
        }
        .padding()
    }
}

struct CardView: View {
    let content: String
    @State var isFaceUp = false
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 20)
                .strokeBorder(lineWidth: 2)
                .fill(.blue)
            Group {
                base
                Text(content)
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
