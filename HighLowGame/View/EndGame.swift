//
//  EndGame.swift
//  HighLowGame
//
//  Created by Pavel on 2023-08-30.
//

import SwiftUI

struct EndGame: View {
    @State var totalScore: Int
    var body: some View {
        VStack {
            Text("Total score is: \(totalScore)")
                .padding()
        
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
        .navigationBarBackButtonHidden(true)
    }
}

struct EndGame_Previews: PreviewProvider {
    static var previews: some View {
        EndGame(totalScore: 10)
    }
}
