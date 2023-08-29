//
//  CardDeck.swift
//  HighLowGame
//
//  Created by Pavel on 2023-08-23.
//

import Foundation

class CardDeck {
    
    var deck = [Card]()
    var usedDeck = [Card]()
    
    let cardC2 = Card(name: "clubs_2", value: 2)
    let cardC3 = Card(name: "clubs_3", value: 3)
    let cardC4 = Card(name: "clubs_4", value: 4)
    let cardC5 = Card(name: "clubs_5", value: 5)
    let cardC6 = Card(name: "clubs_6", value: 6)
    let cardC7 = Card(name: "clubs_7", value: 7)
    let cardC8 = Card(name: "clubs_8", value: 8)
    let cardC9 = Card(name: "clubs_9", value: 9)
    let cardC10 = Card(name: "clubs_10", value: 10)
    let cardCJ = Card(name: "clubs_jack", value: 11)
    let cardCQ = Card(name: "clubs_queen", value: 12)
    let cardCK = Card(name: "clubs_king", value: 13)
    let cardCA = Card(name: "clubs_ace", value: 14)
    
    let cardD2 = Card(name: "diamonds_2", value: 2)
    let cardD3 = Card(name: "diamonds_3", value: 3)
    let cardD4 = Card(name: "diamonds_4", value: 4)
    let cardD5 = Card(name: "diamonds_5", value: 5)
    let cardD6 = Card(name: "diamonds_6", value: 6)
    let cardD7 = Card(name: "diamonds_7", value: 7)
    let cardD8 = Card(name: "diamonds_8", value: 8)
    let cardD9 = Card(name: "diamonds_9", value: 9)
    let cardD10 = Card(name: "diamonds_10", value: 10)
    let cardDJ = Card(name: "diamonds_jack", value: 11)
    let cardDQ = Card(name: "diamonds_queen", value: 12)
    let cardDK = Card(name: "diamonds_king", value: 13)
    let cardDA = Card(name: "diamonds_ace", value: 14)
    
    let cardH2 = Card(name: "hearts_2", value: 2)
    let cardH3 = Card(name: "hearts_3", value: 3)
    let cardH4 = Card(name: "hearts_4", value: 4)
    let cardH5 = Card(name: "hearts_5", value: 5)
    let cardH6 = Card(name: "hearts_6", value: 6)
    let cardH7 = Card(name: "hearts_7", value: 7)
    let cardH8 = Card(name: "hearts_8", value: 8)
    let cardH9 = Card(name: "hearts_9", value: 9)
    let cardH10 = Card(name: "hearts_10", value: 10)
    let cardHJ = Card(name: "hearts_jack", value: 11)
    let cardHQ = Card(name: "hearts_queen", value: 12)
    let cardHK = Card(name: "hearts_king", value: 13)
    let cardHA = Card(name: "hearts_ace", value: 14)
    
    let cardS2 = Card(name: "spades_2", value: 2)
    let cardS3 = Card(name: "spades_3", value: 3)
    let cardS4 = Card(name: "spades_4", value: 4)
    let cardS5 = Card(name: "spades_5", value: 5)
    let cardS6 = Card(name: "spades_6", value: 6)
    let cardS7 = Card(name: "spades_7", value: 7)
    let cardS8 = Card(name: "spades_8", value: 8)
    let cardS9 = Card(name: "spades_9", value: 9)
    let cardS10 = Card(name: "spades_10", value: 10)
    let cardSJ = Card(name: "spades_jack", value: 11)
    let cardSQ = Card(name: "spades_queen", value: 12)
    let cardSK = Card(name: "spades_king", value: 13)
    let cardSA = Card(name: "spades_ace", value: 14)
    
    
    init() {
        deck.append(cardC2)
        deck.append(cardC3)
        deck.append(cardC4)
        deck.append(cardC5)
        deck.append(cardC6)
        deck.append(cardC7)
        deck.append(cardC8)
        deck.append(cardC9)
        deck.append(cardC10)
        deck.append(cardCJ)
        deck.append(cardCQ)
        deck.append(cardCK)
        deck.append(cardCA)
        
        deck.append(cardD2)
        deck.append(cardD3)
        deck.append(cardD4)
        deck.append(cardD5)
        deck.append(cardD6)
        deck.append(cardD7)
        deck.append(cardD8)
        deck.append(cardD9)
        deck.append(cardD10)
        deck.append(cardDJ)
        deck.append(cardDQ)
        deck.append(cardDK)
        deck.append(cardDA)
        
        deck.append(cardH2)
        deck.append(cardH3)
        deck.append(cardH4)
        deck.append(cardH5)
        deck.append(cardH6)
        deck.append(cardH7)
        deck.append(cardH8)
        deck.append(cardH9)
        deck.append(cardH10)
        deck.append(cardHJ)
        deck.append(cardHQ)
        deck.append(cardHK)
        deck.append(cardHA)
        
        deck.append(cardS2)
        deck.append(cardS3)
        deck.append(cardS4)
        deck.append(cardS5)
        deck.append(cardS6)
        deck.append(cardS7)
        deck.append(cardS8)
        deck.append(cardS9)
        deck.append(cardS10)
        deck.append(cardSJ)
        deck.append(cardSQ)
        deck.append(cardSK)
        deck.append(cardSA)
        
        deck.shuffle()
    }
    
    func getCard() -> Card {
        if deck.isEmpty {
            deck = usedDeck
//            usedDeck = [Card]()
            deck.shuffle()
        }
        
        
        let card = deck[0]
        deck.remove(at: 0)
        usedDeck.append(card)
        
        return card
        
    }
}



