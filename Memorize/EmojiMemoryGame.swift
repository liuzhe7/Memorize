//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by solar on 2024/5/4.
//

import Foundation

struct EmojiMemoryGame {
    
    private static let emojis =  ["🐢","🕷️","🙉","👾","🐙","😺","🐧"]
    
    private static func createModel () -> MemoryGame<String> {
        return MemoryGame(numberOfPairsOfCard: 4) {index in
            emojis[index]
        }
    }
    
    private var model: MemoryGame<String> = createModel()
    
    var cards: Array<MemoryGame<String>.Card>{
        model.cards
    }
    
    func chose(_ card: MemoryGame<String>.Card) {
        model.chose(card)
    }
}
