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
    @State private var timeLeft: Int = 0
    @State var timer = CountdownTimer()
    
    var body: some View {
        VStack {

            HStack {
                HStack {
                    if !isDisabled {
                        Text("Time: \(timer.count)")
                            .onReceive(timer.timer) { time in
                                if timer.count > 0 {
                                    print("Count is: \(timer.count)")
                                    timer.count -= 1
                                    if timer.count <= 0 {
                                        timer.timer.upstream.connect().cancel()
                                    }
                                }
                            }
                    }
                    
                }.font(.title)
                    .foregroundColor(.white)
                    .padding(EdgeInsets(top: 5, leading: 20, bottom: 5, trailing: 20))
                    .background(.black.opacity(0.75))
                    .clipShape(Capsule())
            }
            
            Spacer()
            
            Image(currentCardName)
            
            HStack {
                Button("Lower") {
                    self.currentCardName = CardDeck().getCard().name
                    self.currentCardValue = CardDeck().getCard().value
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
            .disabled(!isDisabled)
            
            Spacer()
            
        }.padding()
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        NewGame()
    }
}
