//
//  GameView.swift
//  HighLowGame
//
//  Created by Pavel on 2023-08-23.
//

import SwiftUI

struct NewGame: View {

//    @State private var currentCardName: String = "blue_back"
//    @State private var currentCardValue: Int = 0
    @State private var score = 0
    @State private var decreaseTime = 5
    @State private var currentCardImage = "blue_back"
    @State private var cardDeck = CardDeck()
    @State private var currentCard: Card?
    @State private var nextCard: Card?
    @State private var isDisabled: Bool = false
    @State private var timeLeft: Int = 0
    @State var timer = CountdownTimer()
    @State var gameHasStarted = true
    
    var body: some View {
        ZStack {
            
            // Add background color
            
            VStack {
                
                HStack {
                    Text("Score: \(score)")
                        .font(.title2)
                        .foregroundColor(.white)
                        .padding(EdgeInsets(top: 5, leading: 20, bottom: 5, trailing: 20))
                        .background(.black.opacity(0.75))
                        .clipShape(Capsule())
                    
                    Spacer()
                    
                    Text("Time: \(timer.count)")
                    
                        .font(.title2)
                        .foregroundColor(.white)
                        .padding(EdgeInsets(top: 5, leading: 20, bottom: 5, trailing: 20))
                        .background(.black.opacity(0.75))
                        .clipShape(Capsule())
                }
                
                Spacer()
                
                Image(currentCardImage)
                .padding()
                .shadow(radius: 7)
                
                Spacer()
                    
                
                HStack {
                    Button("Lower") {
                        checkAnswerForLowerButton()
                    }
                    .disabled(isDisabled)
                    .font(.title)
                    .padding()
                    
                    Button("Higher") {
                        checkAnswerForHigherButton()
                    }
                    .disabled(isDisabled)
                    .font(.title)
                    .padding()
                }
                
                Spacer()
                
            }.padding()
            .onReceive(timer.timer) { time in
                    timerControl()
                }
            .onAppear() {
                print("ONAPPEAR")
                play()
            }
        }
        
        
    }
    
    func play() {
        
        currentCard = cardDeck.getCard()
        
        guard let cardImage = currentCard?.name else {return}
        currentCardImage = cardImage
        nextCard = cardDeck.getCard()
        
        
    }
    
    func nextCardOnScreen() {

        if currentCard?.value != nextCard?.value {
            currentCard = nextCard
            guard let cardImage = nextCard?.name else {return}
            currentCardImage = cardImage
        }
        
        if currentCard?.value == nextCard?.value {
            currentCard = cardDeck.getCard()
            nextCardOnScreen()
        }
    }
    
    func checkAnswerForLowerButton() {
        guard let nextCardValue = nextCard?.value, let currentCardValue = currentCard?.value else {
            print("knas")
            return
        }
        if nextCardValue < currentCardValue {
            print("NEXTCARD VALUE: \(nextCardValue)")
            print("CURRENTCARD VALUE: \(currentCardValue)")
            increaseScore()
            nextCardOnScreen()
        } else {
            timer.count -= decreaseTime
        }
    }
    
    func checkAnswerForHigherButton() {
        guard let nextCardValue = nextCard?.value, let currentCardValue = currentCard?.value else {
            print("knas")
            return
        }
        if nextCardValue > currentCardValue {
            print("NEXTCARD VALUE: \(nextCardValue)")
            print("CURRENTCARD VALUE: \(currentCardValue)")
            increaseScore()
            nextCardOnScreen()
        } else {
            timer.count -= decreaseTime
        }
    }
    
    func increaseScore() {
        score += 1
    }
    
    func timerControl() {
        if (timer.count > 0) {
            timer.count -= 1
        } else if timer.count <= 0 {
            disablePlayButtons()
        }
    }
    
    func disablePlayButtons() {
        isDisabled = true
        endTimer()
    }
    
    func endTimer() {
        timer.timer.upstream.connect().cancel()
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        NewGame()
    }
}
