//
//  CoundownOverlay.swift
//  HighLowGame
//
//  Created by Pavel on 2023-09-09.
//

import SwiftUI

struct CountdownOverlay: View {
    @State private var countDownFromThree = CountdownTimer()
    @Binding var isShowingOverlay: Bool
    var body: some View {
        if isShowingOverlay {
            ZStack {
                VStack {
                    Text("\(countDownFromThree.count)")
                        .font(.system(size: 200, design: .rounded))
                        .bold()
                }
                .onReceive(countDownFromThree.timer, perform: { _ in
                    print("TIME IS: \(countDownFromThree.count)")
                    startTimer()
                    
                })
                .onAppear() {
                    countDownFromThree.count = 3
                }
            }
        }
    }
    
    func startTimer() {
        if countDownFromThree.count > 0 {
            countDownFromThree.count -= 1
        } else if countDownFromThree.count < 1 {
            self.isShowingOverlay = false
            countDownFromThree.timer.upstream.connect().cancel()
        }
    }
}

struct CoundownOverlay_Previews: PreviewProvider {
    static var previews: some View {
        CountdownOverlay(isShowingOverlay: .constant(true))
    }
}
