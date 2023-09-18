//
//  SettingsView.swift
//  HighLowGame
//
//  Created by Pavel on 2023-09-10.
//

import SwiftUI

struct Settings: View {
    
    @State private var inGameSeconds: Double = .zero
    @AppStorage("highscore") private var highScore: Int = 0
    @AppStorage("timeSelected") private var timeSelected: Double = .zero
    @State private var isShowingAlert : Bool = false
    
    var body: some View {
        VStack {
            List {
                Text(String(format: NSLocalizedString("INGAMESECONDS_KEY %@", comment: ""), timeSelected.description))
                
                Slider(value: $timeSelected, in: 50...120, step: 5) {
                    Text("")
                } minimumValueLabel: {
                    Text("50")
                        .font(.footnote)
                        .fontWeight(.thin)
                } maximumValueLabel: {
                    Text("120")
                        .font(.footnote)
                        .fontWeight(.thin)
                }
                
                Spacer()
                Button("RESETHIGHSCORE_KEY") {
                    highScore = 0
                    isShowingAlert = true
                }
                .alert("HIGHSCOREALERT_KEY", isPresented: $isShowingAlert) {
                    Button("OK", role: .cancel) { }
                }
            }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        Settings()
    }
}
