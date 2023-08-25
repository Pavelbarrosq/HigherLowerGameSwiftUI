//
//  GameView.swift
//  HighLowGame
//
//  Created by Pavel on 2023-08-23.
//

import SwiftUI

struct NewGame: View {

    
    @State private var currentCardName: String = "blue_back"
    @State private var currentCardValue: Int = 0
    @State private var isDisabled: Bool = true
    @StateObject var countDownTimer = CountdownTimer()
    
    var body: some View {
        VStack {
            
            HStack {
                if isDisabled != true {
                    CountdownTimerView()
                }
            }
            
            Spacer()
            
            Image(currentCardName)
            
            HStack {
                Button("Lower") {
                    self.currentCardName = CardDeck().getCard().name
                    print(currentCardName)
                    print(CardDeck().usedDeck.count)
                }
                .disabled(isDisabled)
                .font(.title)
                .padding()
                Button("Higher") {
                    
                }
                .disabled(isDisabled)
                .font(.title)
                .padding()
            }
            
            Button("Start Game") {
                isDisabled = false
            }
            
            Spacer()
            
        }.padding()
            .environmentObject(countDownTimer)

    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        NewGame()
    }
}
