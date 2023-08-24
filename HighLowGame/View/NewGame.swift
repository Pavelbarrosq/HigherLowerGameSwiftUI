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
            
            Image("hearts_8")
                .shadow(radius: 18)
            
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
