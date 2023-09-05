//
//  GameView.swift
//  HighLowGame
//
//  Created by Pavel on 2023-08-23.
//

import SwiftUI

struct NewGame: View {
    
    @State private var score = 0
    @State private var decreaseTime = 5
    @State private var currentCardImage = "blue_back"
    @State private var cardDeck: CardDeck?
    @State private var currentCard: Card?
    @State private var nextCard: Card?
    @State private var isDisabled: Bool = false
    @State private var timeLeft: Int = 0
    @State var timer = CountdownTimer()
    @State var gameHasStarted = true
    @State private var isGameOver = false
    @State private var imageShadowColor = Color.black
    @State private var isRight = false
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        NavigationStack {
            ZStack {
                // Add background color
                
                VStack {
                    HStack {
                        Text("Score: \(score)")
                            .font(.title2)
                            .foregroundColor(colorScheme == .dark ? .white : .black)
                            .padding(EdgeInsets(top: 5, leading: 20, bottom: 5, trailing: 20))
                        
                        Spacer()
                        
                        Text("Time: \(timer.count)")
                        
                            .font(.title2)
                            .foregroundColor(colorScheme == .dark ? .white : .black)
                            .padding(EdgeInsets(top: 5, leading: 20, bottom: 5, trailing: 20))
                    }
                    
                    Spacer()
                    
                    Image(currentCardImage)
                    .padding()
                    .shadow(color: imageShadowColor, radius: 20)
                    .aspectRatio(contentMode: .fill)
                    
                    Spacer()
                        
                    HStack {
                        Button(" Lower ") {
                            checkAnswerForLowerButton()
                        }
                        .foregroundColor(colorScheme == .dark ? .white : .black)
                        .disabled(isDisabled)
                        .font(.title)
                        .buttonStyle(.bordered)
                        
                        Button(" Higher ") {
                            checkAnswerForHigherButton()
                        }
                        .foregroundColor(colorScheme == .dark ? .white : .black)
                        .disabled(isDisabled)
                        .buttonStyle(.bordered)
                        .font(.title)
                    }
    
                    Spacer()
                    
                }
                .padding()
                .onReceive(timer.timer) { time in
                    timerControl()
                }
                .onAppear() {
                    play()
                }
            }
        }
        .navigationDestination(isPresented: $isGameOver) {
            EndGame(totalScore: score)
        }
        .navigationBarBackButtonHidden(true)
        
        
    }
    
    func play() {
        cardDeck = CardDeck()
        
        guard let cCard = cardDeck?.getCard(),
              let nCard = cardDeck?.getCard() else {return}
        currentCard = cCard
        currentCardImage = cCard.name
        nextCard = nCard
        print("CURRENTCARD: \(cCard.value)")
        print("NEXTCARD: \(nCard.value)")
        
        if cCard.value == nCard.value {
            guard let nCard = cardDeck?.getCard() else {return}
            nextCard = nCard
        }
    }
    
    func nextCardOnScreen() {
        guard let cCardImage = nextCard?.name else {return}
        currentCardImage = cCardImage
        currentCard = nextCard
        guard let nCard = cardDeck?.getCard() else {return}
        nextCard = nCard
        
        print("CURRENTCARD: \(currentCard!.value)")
        print("NEXTCARD: \(nextCard!.value)")

        
        if currentCard?.value == nCard.value {
            guard let nCard = cardDeck?.getCard() else {return}
            nextCard = nCard
            nextCardOnScreen()
        }
    }
    
    func checkAnswerForLowerButton() {
        guard let nCardVal = nextCard?.value,
              let cCardVal = currentCard?.value else {return}
        
        if nCardVal < cCardVal {
            increaseScore()
            imageFeedback(isPulsing: true)
            nextCardOnScreen()
        } else if nCardVal > cCardVal {
            timer.count -= decreaseTime
            imageFeedback(isPulsing: false)
            nextCardOnScreen()
        }
    }
    
    func checkAnswerForHigherButton() {
        guard let nCardVal = nextCard?.value,
              let cCardVal = currentCard?.value else {return}
        
        if nCardVal > cCardVal {
            increaseScore()
            imageFeedback(isPulsing: true)
            nextCardOnScreen()
        } else if nCardVal < cCardVal{
            timer.count -= decreaseTime
            imageFeedback(isPulsing: false)
            nextCardOnScreen()
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
            timer.count = 0
            isGameOver = true
        }
    }
    
    func disablePlayButtons() {
        isDisabled = true
        endTimer()
    }
    
    func endTimer() {
        timer.timer.upstream.connect().cancel()
    }
    
    func imageFeedback(isPulsing: Bool) {
        if isPulsing {
            imageShadowColor = .green
        } else {
            imageShadowColor = .red
        }
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        NewGame()
    }
}
