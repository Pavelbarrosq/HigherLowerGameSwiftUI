//
//  GameInfo.swift
//  HighLowGame
//
//  Created by Pavel on 2023-09-07.
//

import SwiftUI

struct GameInfo: View {
    
    var body: some View {
        VStack {
            ScrollView {
                Text("HOWTOPLAYINFO1_KEY")
                    .multilineTextAlignment(.leading)
                    .padding()
                
                Spacer()
                
                Text("HOWTOPLAYINFO2_KEY")
                    .multilineTextAlignment(.leading)
                    .padding()

                Spacer()
            }
        }
    }
}

struct GameInfo_Previews: PreviewProvider {
    static var previews: some View {
        GameInfo()
    }
}
