//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Simeon on 11/25/23.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    
    let veggies: Array<String> = ["🥕", "🌽", "🥦", "🍆", "🌶️", "🧅", "🍠"]
    let sports: Array<String> = ["🏀", "⚽️", "⚾️", "🏈", "🎾", "🏐"]
    let animals: Array<String> = ["🐅", "🦧", "🦩", "🦒", "🦏", "🐊", "🐪", "🐋"]
    
    @State var emojis: Array<String> = []
    
    var body: some View {
        VStack {
            Text("Memorize!").font(.largeTitle)
            ScrollView {
                cards
            }
            Spacer()
            Button("Shuffle") {
                viewModel.shuffle() 
            }
        }
        .padding()
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 85), spacing: 0)]) {
            ForEach(viewModel.cards.indices, id: \.self) { index in
                CardView(viewModel.cards[index])
                    .aspectRatio(2/3, contentMode: .fit)
                    .padding(4)
            }
        }
        .foregroundStyle(.green)
    }
    
    var cardThemeOptions: some View {
        HStack {
            Spacer()
            vegetableThemeButton
            Spacer()
            sportsThemeButton
            Spacer()
            animalThemeButton
            Spacer()
        }
    }
    
    func createThemeButton(theme_emojis: Array<String>, symbol: String, theme_name: String) -> some View {
        Button(action: {
            emojis = theme_emojis + theme_emojis
            emojis = emojis.shuffled()
        }, label: {
            VStack {
                Image(systemName: symbol).font(.title2)
                Text(theme_name).font(.body)
            }
        })
    }
    
    var vegetableThemeButton: some View {
        return createThemeButton(theme_emojis: veggies, symbol: "carrot", theme_name: "Veggies")
    }
    
    var sportsThemeButton: some View {
        return createThemeButton(theme_emojis: sports, symbol: "basketball", theme_name: "Sports")
    }
    
    var animalThemeButton: some View {
        return createThemeButton(theme_emojis: animals, symbol: "pawprint", theme_name: "Animals")
    }

}


struct CardView: View {
    let card: MemoryGame<String>.Card
    
    init(_ card: MemoryGame<String>.Card) {
        self.card = card
    }
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            
            Group {
                base.fill(.white)
                base.stroke(lineWidth: 3)
                Text(card.content)
                    .font(.system(size: 200))
                    .minimumScaleFactor(0.01)
                    .aspectRatio(1, contentMode: .fit)
            }
            .opacity(card.isFaceUp ? 1 : 0)
            
            base.fill().opacity(card.isFaceUp ? 0 : 1)
        }
    }
}


#Preview {
    EmojiMemoryGameView(viewModel: EmojiMemoryGame())
}
