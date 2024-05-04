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
        for pairOfIndex in 0..<numberOfPairsOfCard {
            cards.append(Card(content: cardContentFactory(pairOfIndex)))
        }
    }
    
    func chose(_ card: Card) {
        
    }
    
    
    struct Card {
        var isFaceUp:Bool = false
        var isMached:Bool = false
        let content:CardContent
    }
    
}
