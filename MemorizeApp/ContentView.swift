//
//  ContentView.swift
//  MemorizeApp
//
//  Created by Abdulkerim Can on 26.05.2024.
//

import SwiftUI

struct ContentView: View {
    @State var emojis: [String] = ["🎃","👻","🦇","💀","💀","👻","🎃","🦇"]

    var body: some View {
        
        VStack {
            title
            ScrollView {
                cards
            }
            Spacer()
            HStack(spacing: 50) {
                halloweenThemeButton
                forestThemeButton
                flagThemeButton
            }
        }
        .padding()
    }

    
    var title: some View {
        Text("Memorize!").font(.largeTitle).bold(true)
    }
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 60))]) {
            ForEach(emojis.indices,id: \.self) { index in
                CardView(content: emojis[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
        .foregroundStyle(.orange)
    }
    
    func configureThemeButton(content: [String], name: String) -> some View {
        Button(action: {
            emojis.removeAll()
            emojis.append(contentsOf: content.shuffled())
        }, label: {
            VStack {
                Text(name)
                Text(content.first ?? "").font(.largeTitle)
            }
        })
    }
    
    var halloweenThemeButton: some View {
        configureThemeButton(content: ["🎃","👻","🦇","💀","💀","👻","🎃","🦇"], name: "Halloween")
    }
    
    var forestThemeButton: some View {
        configureThemeButton(content: ["🌳","🏞️","💚","🍀","🌿","🌲","🏞️","🍀","🌿","🌳","💚","🌲"], name: "Forest")
    }
    
    var flagThemeButton: some View {
        configureThemeButton(content: ["🇹🇷","🇰🇷","🇺🇸","🇨🇦","🇮🇹","🇰🇷","🇨🇦","🇹🇷","🇺🇸","🇮🇹"], name: "Flags")
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
