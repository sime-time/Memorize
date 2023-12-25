//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Simeon on 12/4/23.
//

import SwiftUI

// VIEWMODEL
class EmojiMemoryGame: ObservableObject {
    
    @Published private var model = createMemoryGame()
    @Published private var themes = createTheme()
    
    private static let emojis = ["🥕", "🌽", "🥦", "🍆", "🌶️", "🧅", "🍠"]
    
    private static func createMemoryGame() -> MemoryGame<String> {
        return MemoryGame(numberOfPairsOfCards: 6) { pairIndex in
            if emojis.indices.contains(pairIndex) {
                return emojis[pairIndex]
            } else {
                return "⁉️"
            }
            
        }
    }
    
    private static func createTheme() -> Theme {
        return Theme()
    }

    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    func shuffle() {
        model.shuffle()
    }
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
}
