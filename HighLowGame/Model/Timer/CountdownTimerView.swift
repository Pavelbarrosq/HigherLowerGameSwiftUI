//
//  CountdownTimerView.swift
//  HighLowGame
//
//  Created by Pavel on 2023-08-25.
//

import SwiftUI

struct CountdownTimerView: View {
    
    @EnvironmentObject var countDownTimer: CountdownTimer
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        HStack {
            Text("Time:\(countDownTimer.count)")
                .onReceive(timer) { time in
                    if countDownTimer.count > 0 {
                        countDownTimer.count -= 1
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

    
