//
//  ContentView.swift
//  Memorize
//
//  Created by Simeon on 11/25/23.
//

import SwiftUI

struct ContentView: View {
    
    let veggies: Array<String> = ["🥕", "🌽", "🥦", "🍆", "🌶️", "🧅", "🍠"]
    let sports: Array<String> = ["🏀", "⚽️", "⚾️", "🏈", "🎾", "🏐"]
    let animals: Array<String> = ["🐅", "🦧", "🦩", "🦒", "🦏", "🐊", "🐪", "🐋"]
    
    @State var emojis: Array<String> = []
    @State var cardColor = Color.green
    
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
            ForEach(0..<emojis.count, id: \.self) { index in
                CardView(content: emojis[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
        .foregroundStyle(cardColor)
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
    
    func createThemeButton(theme_emojis: Array<String>, symbol: String, theme_name: String, theme_color: Color) -> some View {
        Button(action: {
            cardColor = theme_color
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
        return createThemeButton(theme_emojis: veggies, symbol: "carrot", theme_name: "Veggies", theme_color: Color.green)
    }
    
    var sportsThemeButton: some View {
        return createThemeButton(theme_emojis: sports, symbol: "basketball", theme_name: "Sports", theme_color: Color.orange)
    }
    
    var animalThemeButton: some View {
        return createThemeButton(theme_emojis: animals, symbol: "pawprint", theme_name: "Animals", theme_color: Color.red)
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
        
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}


#Preview {
    ContentView()
}
