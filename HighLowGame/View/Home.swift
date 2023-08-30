//
//  ContentView.swift
//  HighLowGame
//
//  Created by Pavel on 2023-08-23.
//

import SwiftUI

struct Home: View {
    var body: some View {
    
        NavigationStack {
            
            VStack {
                
                Spacer()
                
                NavigationLink("Start new game", destination: NewGame())
                    .foregroundColor(.white)
                    .padding(EdgeInsets(top: 5, leading: 20, bottom: 5, trailing: 20))
                        .background(.black.opacity(0.75))
                        .font(.title)
                        .clipShape(Capsule())
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
