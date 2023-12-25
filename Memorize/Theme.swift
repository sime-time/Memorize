//
//  Theme.swift
//  Memorize
//
//  Created by Simeon on 12/22/23.
//

import Foundation

struct Theme {
    
    // randomly choose between 6 themes
    private(set) var emojis: Array<String>
    private(set) var number_of_pairs: Int
    private(set) var color: String
    
    // array of colors
    private let colors: Array<String> = ["red", "orange", "yellow", "blue", "green", "purple"]
    
    // at least 6 distinct themes
    private let veggies: Array<String> = ["🥕", "🌽", "🥦", "🍆", "🌶️", "🧅", "🍠", "🫑", "🧄", "🫛"]
    private let sports: Array<String> = ["🏀", "⚽️", "⚾️", "🏈", "🎾", "🏐", "🎱", "🏓", "🥏", "🏉"]
    private let animals: Array<String> = ["🐅", "🦧", "🦩", "🦒", "🦏", "🐊", "🐪", "🐋", "🦭", "🦉"]
    
    
    
    init() {
        
        self.number_of_pairs = Int.random(in: 1...10)
        
        // randomly choose a color within an array of colors
        if let random_color = colors.randomElement() {
            self.color = random_color
        } else {
            self.color = colors[0]
        }
        
        // emojis are privately determined randomly, then shuffled
        let emoji_themes = [veggies, sports, animals]
        if let random_theme: [String] = emoji_themes.randomElement() {
            self.emojis = random_theme
        } else {
            self.emojis = emoji_themes[0]
        }
        self.emojis = emojis.shuffled()
    }
    
}
