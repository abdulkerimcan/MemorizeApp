//
//  MemorizeApp.swift
//  MemorizeApp
//
//  Created by Abdulkerim Can on 26.05.2024.
//

import SwiftUI

@main
struct MemorizeApp: App {
    @StateObject var game = MemoryViewModel()
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(viewModel: game)
        }
    }
}
