//
//  CountdownTimerView.swift
//  HighLowGame
//
//  Created by Pavel on 2023-08-25.
//

import SwiftUI

//class CountdownTimer {
//    var count: Int
//    var isCountOver = false
//
//    init(count: Int, isCountOver: Bool = false) {
//        self.count = count
//        self.isCountOver = isCountOver
//    }
//}

struct CountdownTimerView: View {
    
    @State var totalCountdown = 90
    
//    @State var countDownTimer = CountdownTimer(count: totalCountdown)
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        HStack {
            Text("Time:\(totalCountdown)")
                .onReceive(timer) { time in
                    if totalCountdown > 0 {
                        totalCountdown -= 1
                    }
                }
            
        }.font(.title)
            .foregroundColor(.white)
            .padding(EdgeInsets(top: 5, leading: 20, bottom: 5, trailing: 20))
            .background(.black.opacity(0.75))
            .clipShape(Capsule())

    }
    
}

struct CountdownTimerView_Previews: PreviewProvider {
    static var previews: some View {
        CountdownTimerView()
    }
}

    
