//
//  ContentView.swift
//  HighLowGame
//
//  Created by Pavel on 2023-08-23.
//

import SwiftUI

struct Home: View {
    
    @State var howToPlayPresented = false
    
    var body: some View {
        NavigationStack {
            
            VStack {
                
                Spacer()
                
                NavigationLink("STARTGAMEBUTTON_KEY", destination: NewGame())
                    .foregroundColor(.white)
                    .padding(EdgeInsets(top: 5, leading: 20, bottom: 5, trailing: 20))
                        .background(.black.opacity(0.75))
                        .font(.title)
                        .clipShape(Capsule())
                
                Button("HOWTOPLAY_KEY") {
                    howToPlayPresented.toggle()
                }
                .padding()
                .foregroundColor(.black)
            }
        }
        .sheet(isPresented: $howToPlayPresented) {
                if #available(iOS 16.4, *) {
                    GameInfo()
                        .presentationBackground(.thinMaterial)
                        .presentationDetents([.medium])
                } else {
                    GameInfo()
                }
                
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
