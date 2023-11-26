//
//  ContentView.swift
//  Memorize
//
//  Created by Simeon on 11/25/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            CardView()
            CardView(isFaceUp: true)
            CardView()
            CardView()
        }
        .padding()
    }
}


struct CardView: View {
    @State var isFaceUp: Bool = false
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            if isFaceUp {
                base.fill(.white)
                base.stroke(lineWidth: 2)
                Text("🍒").font(.largeTitle)
            } else {
                base
            }
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
