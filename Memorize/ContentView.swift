//
//  ContentView.swift
//  Memorize
//
//  Created by solar on 2024/4/19.
//

import SwiftUI

struct ContentView: View {
    let emojis = ["🐢","🎃","🕷️","👹","😭", "😊"]
    @State var cardCount: Int = 2
    var body: some View {
        VStack {
            cards
            cardCountAdjusters
        }

        .padding()
    }
    
    var cards: some View {
        HStack {
            ForEach(0..<cardCount,id: \.self) {
                CardView(content: emojis[$0])
            }
        }
        .foregroundColor(.orange)
    }
        
    var cardCountAdjusters: some View {
        HStack {
            cardAdder
            Spacer()
            cardRemover
        }
        .font(.largeTitle)
    }
    
    func cardCountAdjuster(by offset: Int, symbol: String) -> some View {
        Button(action: {
            cardCount += offset
        }, label: {
            Image(systemName: symbol)
        }).disabled(cardCount + offset < 1 || cardCount + offset > emojis.count)
    }
    
    var cardAdder: some View {
        cardCountAdjuster(by: 1, symbol: "folder.badge.plus")
    }
    
    var cardRemover: some View {
        cardCountAdjuster(by: -1, symbol: "folder.badge.minus")
    }
}

struct CardView: View {
    let content: String
    @State var isFaceUp = true
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            if isFaceUp {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(content).font(.largeTitle)
            } else {
                base.fill()
            }
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
