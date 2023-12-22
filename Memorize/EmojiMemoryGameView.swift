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
                    .animation(.default, value: viewModel.cards)
            }
            Spacer()
            HStack {
                Button("Shuffle") {
                    viewModel.shuffle()
                }
                Spacer()
                Button("New Game") {
                    // TODO: add stuff
                }
            }
            
        }
        .padding()
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 85), spacing: 0)], spacing: 0) {
            ForEach(viewModel.cards) { card in
                CardView(card)
                    .aspectRatio(2/3, contentMode: .fit)
                    .padding(4)
                    .onTapGesture {
                        viewModel.choose(card)
                    }
            }
        }
        .foregroundStyle(.green)
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
                .opacity(card.isFaceUp ? 0 : 1)
        }
        .opacity(card.isFaceUp || !card.isMatched ? 1 : 0)
    }
}


#Preview {
    EmojiMemoryGameView(viewModel: EmojiMemoryGame())
}
