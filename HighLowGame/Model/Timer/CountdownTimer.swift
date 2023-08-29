//
//  CountDownTimer.swift
//  HighLowGame
//
//  Created by Pavel on 2023-08-27.
//

import Foundation
import SwiftUI

struct CountdownTimer {
    var count = 150
    var isOver: Bool = false
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
}
