//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by solar on 2024/5/4.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    
    private static let emojis =  ["🐢","🕷️","🙉","👾","🐙","😺","🐧"]
    
    private static func createModel () -> MemoryGame<String> {
        return MemoryGame(numberOfPairsOfCard: 16) {index in
            if emojis.indices.contains(index) {
               return emojis[index]
            } else {
                return "❓"
            }
        }
    }
    
    @Published private var model: MemoryGame<String> = createModel()
    
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    // MARK - intents
    func shuffle() {
        model.shuffle()
    }
    
    func chose(_ card: MemoryGame<String>.Card) {
        model.chose(card)
    }
}
