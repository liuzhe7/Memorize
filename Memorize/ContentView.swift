//
//  ContentView.swift
//  Memorize
//
//  Created by solar on 2024/4/19.
//

import SwiftUI

struct ContentView: View {
    @State var emojis = ["🐢","🐢","🎃","🎃","🕷️","🕷️","👹","👹","😊","😊","🤔","🤔"]
    @State var cardCount: Int = 12
    var body: some View {
        VStack {
            title
            ScrollView{
                cards
            }
            Spacer()
            HStack {
                refreshButton
                cardCountAdjusters
            }
        }

        .padding()
    }
    
    var title: some View {
        Text("Memorize!").font(.largeTitle)
    }
    
    var refreshButton: some View {
        Button(action: refreshEmojis, label: {
            Text("tap me!")
        })
    }
    
    func refreshEmojis () -> Void{
        let emojisOne = ["🐢","🐢","🎃","🎃","🕷️","🕷️","👹","👹","😊","😊","🤔","🤔"]
        let emojisTwo = ["👻","👻","💀","💀","👽","👽","👾","👾","🤖","🤖","😺","😺"]
        let emojisThree = ["😈","😈","👺","👺","🤡","🤡","💩","💩","🐽","🐽","🐸","🐸"]

        while true {
            let radomIndex = Int.random(in: 0...2)
            let allTheme = [emojisOne, emojisTwo, emojisThree]
            if emojis != allTheme[radomIndex] {
                emojis = allTheme[radomIndex]
                return
            }
        }
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 60))]) {
            ForEach(0..<cardCount,id: \.self) {
                CardView(content: emojis[$0])
                    .aspectRatio(2/3,contentMode: .fit)
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
            
            Group {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
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

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
