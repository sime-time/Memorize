//
//  Theme.swift
//  Memorize
//
//  Created by Simeon on 12/22/23.
//

import Foundation

struct Theme {
    
    private var emojis: Array<String>
    var num_pairs: Int
    var color: String
    
    private let veggies: Array<String> = ["🥕", "🌽", "🥦", "🍆", "🌶️", "🧅", "🍠"]
    private let sports: Array<String> = ["🏀", "⚽️", "⚾️", "🏈", "🎾", "🏐"]
    private let animals: Array<String> = ["🐅", "🦧", "🦩", "🦒", "🦏", "🐊", "🐪", "🐋"]
    
    
    
    init(num_pairs: Int, color: String) {
        let emoji_themes = [veggies, sports, animals]
        if let random_theme = emoji_themes.randomElement() {
            self.emojis = random_theme
        } else {
            self.emojis = emoji_themes[0]
        }
        self.emojis = emojis.shuffled()
        self.num_pairs = num_pairs
        self.color = color
    }
}
