//
//  ContentView.swift
//  Memorize
//
//  Created by solar on 2024/4/19.
//

import SwiftUI

struct ContentView: View {
    static func generateEmojis () -> Array<String> {
        var emojis = ["🏀","🏀","⚽️","⚽️","🥎","🥎","🏸","🏸","🏓","🏓","🏂","🏂"]
        emojis.shuffle()
        return emojis
    }
    
    @State var emojis = generateEmojis()
    var body: some View {
        VStack {
            title
            ScrollView{
                cards
            }
            Spacer()
            HStack {
                Spacer()
                themeOne
                Spacer()
                themeTwo
                Spacer()
                themeThree
                Spacer()
            }
            .font(.title2)
        }

        .padding()
    }
    
    var title: some View {
        Text("Memorize!").font(.largeTitle)
    }
    
    var themeOne: some View {
        Button(action: choseThemeOne, label: {
            VStack {
                Image(systemName: "figure.disc.sports")
                Text("sports")
            }
        })
    }
    
    var themeTwo: some View {
        Button(action: choseThemeTwo, label: {
            VStack {
                Image(systemName: "questionmark.app.fill")
                Text("animal")
            }
        })
    }
    
    var themeThree: some View {
        Button(action: choseThemeThree, label: {
            VStack {
                Image(systemName: "face.smiling")
                Text("face")
            }
        })
    }
    
    func choseThemeOne () -> Void {
        let emojisOne = ["🏀","🏀","⚽️","⚽️","🥎","🥎","🏸","🏸","🏓","🏓","🏂","🏂"]
        emojis = emojisOne
        emojis.shuffle()
        return
    }
    
    func choseThemeTwo () -> Void{
        let emojisTwo = ["🐢","🐢","🕷️","🕷️","🙉","🙉","👾","👾","🐙","🐙","😺","😺","🐧","🐧"]
        emojis = emojisTwo
        emojis.shuffle()
        return
    }
    
    func choseThemeThree () -> Void{
        let emojisThree = ["😈","😈","👺","👺","🤡","🤡","🤔","🤔","👹","👹","🥲","🥲","😎","😎","🥺","🥺"]
        emojis = emojisThree
        emojis.shuffle()
        return
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
            ForEach(0..<emojis.count,id: \.self) {
                CardView(content: emojis[$0])
                    .aspectRatio(2/3,contentMode: .fit)
            }
        }
        .foregroundColor(.red)
    }
}

struct CardView: View {
    let content: String
    @State var isFaceUp = false
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
