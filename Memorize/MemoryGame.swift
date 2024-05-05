//
//  MemoryGame.swift
//  Memorize
//
//  Created by solar on 2024/5/4.
//

import Foundation


struct MemoryGame<CardContent> {
    
    private(set) var cards: Array<Card>
    
    init(numberOfPairsOfCard: Int, cardContentFactory: (Int)->CardContent) {
        cards = []
        for pairOfIndex in 0..<max(2,numberOfPairsOfCard) {
            let content = cardContentFactory(pairOfIndex)
            cards.append(Card(content: content))
            cards.append(Card(content: content))
        }
    }
    
    mutating func shuffle () {
        cards.shuffle()
    }
    
    func chose(_ card: Card) {
        
    }
    
    struct Card {
        var isFaceUp:Bool = true
        var isMached:Bool = false
        let content:CardContent
    }
    
}
