//
//  GameView.swift
//  HighLowGame
//
//  Created by Pavel on 2023-08-23.
//

import SwiftUI

struct NewGame: View {
    @State private var timeRemaining = 90
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    @State private var currentCardName: String = "blue_back"
    @State private var currentCardValue: Int = 0
    @State private var isDisabled: Bool = true
    
    var body: some View {
        VStack {
            HStack {
                Text("Time: \(timeRemaining)")
            }.font(.title)
                .foregroundColor(.white)
                .padding(EdgeInsets(top: 5, leading: 20, bottom: 5, trailing: 20))
                .background(.black.opacity(0.75))
                .clipShape(Capsule())
            
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
            .onReceive(timer) { time in
                if timeRemaining > 0 {
                    timeRemaining -= 1
                }
            }
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        NewGame()
    }
}
