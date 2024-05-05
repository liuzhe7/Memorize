//
//  ContentView.swift
//  Memorize
//
//  Created by solar on 2024/4/19.
//

import SwiftUI

struct EmojiMemoryGameView: View {

    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
        VStack {
            title
            ScrollView{
                cards
            }
            
            Button("shuffle") {
                viewModel.shuffle()
            }
        }

        .padding()
    }
    
    var title: some View {
        Text("Memorize!").font(.largeTitle)
    }

    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 85),spacing: 0)],spacing: 0) {
            ForEach(viewModel.cards.indices, id: \.self) {index in
                CardView(card: viewModel.cards[index])
                    .aspectRatio(2/3,contentMode: .fit)
                    .padding(4)
            }
        }
        .foregroundColor(.red)
    }
}

struct CardView: View {
    let card: MemoryGame<String>.Card
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            
            Group {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(card.content)
                    .aspectRatio(1, contentMode: ContentMode.fit)
                    .font(Font.system(size: 200))
                    .minimumScaleFactor(0.01)
            }
            .opacity(card.isFaceUp ? 1 : 0)
            
            base.fill().opacity(card.isFaceUp ? 0 : 1)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiMemoryGameView(viewModel: EmojiMemoryGame())
    }
}
