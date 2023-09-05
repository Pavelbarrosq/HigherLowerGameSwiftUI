//
//  EndGame.swift
//  HighLowGame
//
//  Created by Pavel on 2023-08-30.
//

import SwiftUI

struct EndGame: View {
    
    @AppStorage("highscore") private var highScore = 0
    @State var totalScore: Int
    
    var body: some View {
        VStack {
            Text("Total score is: \(totalScore)")
                .padding()
            
            Text("Current highs score is: \(highScore)")
        
            Spacer()
        
            HStack {
                NavigationLink("Home", destination: Home())
                    .foregroundColor(.white)
                    .padding(EdgeInsets(top: 5, leading: 20, bottom: 5, trailing: 20))
                        .background(.black.opacity(0.75))
                        .font(.title)
                        .clipShape(Capsule())
                
                Spacer()
                
                NavigationLink("Play Again", destination: NewGame())
                    .foregroundColor(.white)
                    .padding(EdgeInsets(top: 5, leading: 20, bottom: 5, trailing: 20))
                        .background(.black.opacity(0.75))
                        .font(.title)
                        .clipShape(Capsule())
            }
            .padding()
        }
        .onAppear() {
            highScore = saveHighScore(currentScore: totalScore)
        }
        .navigationBarBackButtonHidden(true)
    }
    
    private func saveHighScore(currentScore: Int) -> Int {
        guard let savedHighScore = UserDefaults.standard.value(forKey: "highscore") else {return 0}
        
        print("Saved highscore is: \(savedHighScore)")
        
        if savedHighScore as! Int > currentScore {
            return savedHighScore as! Int
        } else {
            return currentScore
        }
    }
}

struct EndGame_Previews: PreviewProvider {
    static var previews: some View {
        EndGame(totalScore: 10)
    }
}
