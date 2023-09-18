//
//  CountDownTimer.swift
//  HighLowGame
//
//  Created by Pavel on 2023-08-27.
//

import Foundation
import SwiftUI

struct CountdownTimer {
    var count: Int = 60
    var isOver: Bool = false
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
}
