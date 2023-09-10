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
            
            Text(String(format: NSLocalizedString("TOTALSCORE_KEY %@", comment: ""), totalScore.description))
                .font(.title)
                .padding(EdgeInsets(top: 20, leading: 20, bottom: 30, trailing: 20))
                .bold()
            
            Text(String(format: NSLocalizedString("HIGHSCORE_KEY %@", comment: ""), highScore.description))
                
        
            Spacer()
        
            HStack {
                NavigationLink("HOMEBUTTON_KEY", destination: Home())
                    .foregroundColor(.white)
                    .padding(EdgeInsets(top: 5, leading: 20, bottom: 5, trailing: 20))
                        .background(.black.opacity(0.75))
                        .font(.title)
                        .clipShape(Capsule())
                
                Spacer()
                
                NavigationLink("PLAYAGAINBUTTON_KEY", destination: NewGame())
                    .foregroundColor(.white)
                    .padding(EdgeInsets(top: 5, leading: 20, bottom: 5, trailing: 20))
                        .background(.black.opacity(0.75))
                        .font(.title)
                        .clipShape(Capsule())
            }
            .padding(EdgeInsets(top: 0, leading: 20, bottom: 20, trailing: 20))
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
