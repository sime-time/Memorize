//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Simeon on 12/4/23.
//

import SwiftUI

// VIEWMODEL
class EmojiMemoryGame: ObservableObject {
    
    @Published private var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
    
    
    private static func createMemoryGame() -> MemoryGame<String> {
        
        let theme = createTheme()
        
        return MemoryGame(numberOfPairsOfCards: theme.number_of_pairs) { pairIndex in
            if theme.emojis.indices.contains(pairIndex) {
                return theme.emojis[pairIndex]
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
    
    func newGame() {
        model = EmojiMemoryGame.createMemoryGame()
    }
    
}
