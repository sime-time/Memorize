//
//  ContentView.swift
//  Memorize
//
//  Created by Simeon on 11/25/23.
//

import SwiftUI

struct ContentView: View {
    
    let veggies: Array<String> = ["🥕", "🌽", "🥦", "🧅", "🍆", "🌶️"]
    let sports: Array<String> = ["🏀", "⚽️", "⚾️", "🏈", "🎾", "🏐"]
    let animals: Array<String> = ["🐅", "🦧", "🦩", "🦒", "🦏", "🐊"]
    
    @State var emojis: Array<String> = ["🥕", "🌽", "🥦", "🧅", "🍆", "🌶️"]
    @State var cardCount: Int = 6
    
    var body: some View {
        VStack {
            Text("Memorize!").font(.largeTitle)
            ScrollView {
                cards
            }
            Spacer()
            cardThemeOptions
        }
        .padding()
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 80))]) {
            ForEach(0..<cardCount, id: \.self) { index in
                CardView(content: emojis[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
    }
    
    var cardThemeOptions: some View {
        HStack {
            Spacer()
            vegetableTheme
            Spacer()
            sportsTheme
            Spacer()
            animalTheme
            Spacer()
        }
    }
    
    func cardThemeButton(theme_emojis: Array<String>, symbol: String, theme_name: String) -> some View {
        Button(action: {
            emojis = theme_emojis
        }, label: {
            VStack {
                Image(systemName: symbol).font(.title2)
                Text(theme_name).font(.body)
            }
        })
    }
    
    var vegetableTheme: some View {
        return cardThemeButton(theme_emojis: veggies, symbol: "carrot", theme_name: "Veggies")
    }
    
    var sportsTheme: some View {
        return cardThemeButton(theme_emojis: sports, symbol: "basketball", theme_name: "Sports")
    }
    
    var animalTheme: some View {
        return cardThemeButton(theme_emojis: animals, symbol: "pawprint", theme_name: "Animals")
    }

}


struct CardView: View {
    let content: String
    @State var isFaceUp: Bool = true
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            
            Group {
                base.fill(.white)
                base.stroke(lineWidth: 3)
                Text(content).font(.largeTitle)
            }
            .opacity(isFaceUp ? 1 : 0)
            
            base.fill().opacity(isFaceUp ? 0 : 1)
        }
        .foregroundStyle(.green)
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}


#Preview {
    ContentView()
}
