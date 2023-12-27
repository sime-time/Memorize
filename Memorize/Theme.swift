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
    private(set) var name: String
    
    // array of colors
    private let colors: Array<String> = ["red", "orange", "yellow", "blue", "green", "purple"]
    
    // at least 6 distinct themes
    private let veggies: Array<String> = ["🥕", "🌽", "🥦", "🍆", "🌶️", "🧅", "🍠", "🫑", "🧄", "🫛"]
    private let sports: Array<String> = ["🏀", "⚽️", "⚾️", "🏈", "🎾", "🏐", "🎱", "🏓", "🥏", "🏉"]
    private let animals: Array<String> = ["🐅", "🦧", "🦩", "🦒", "🦏", "🐊", "🐪", "🐋", "🦭", "🦉"]
    private let drinks: Array<String> = ["🥛", "☕", "🍵", "🧃", "🧋", "🍺", "🍷", "🥃", "🍸", "🍹"]
    private let vehicles: Array<String> = ["🚗", "🚌", "🚂", "🚑", "🚒", "🚓", "🚙", "🛻", "🚚", "🛺"]
    private let fruits: Array<String> = ["🥝", "🍇", "🍉", "🍊", "🍋", "🍌", "🥭", "🍑", "🍒", "🫐"]
    
    
    
    
    init() {
        
        self.number_of_pairs = Int.random(in: 1...10)
        
        // randomly choose a color within an array of colors
        if let random_color = colors.randomElement() {
            self.color = random_color
        } else {
            self.color = colors[0]
        }
        
        // emojis are privately determined randomly, then shuffled
        self.name = "Memorize!"
        let emoji_themes = [veggies, sports, animals, drinks, vehicles, fruits]
        if let random_theme: [String] = emoji_themes.randomElement() {
            self.emojis = random_theme
            self.name = selectName(random_theme)
        } else {
            self.emojis = emoji_themes[0]
        }
        self.emojis = emojis.shuffled()
    }
    
    private func selectName(_ emojiArray: [String]) -> String {
        var outputName: String
        switch emojiArray {
        case veggies:
            outputName = "Veggies!"
        case sports:
            outputName = "Sports!"
        case animals:
            outputName = "Animals!"
        case drinks:
            outputName = "Drinks!"
        case vehicles:
            outputName = "Vehicles!"
        case fruits:
            outputName = "Fruits!"
        default:
            outputName = "Memorize!"
        }
        return outputName
    }
    
}
