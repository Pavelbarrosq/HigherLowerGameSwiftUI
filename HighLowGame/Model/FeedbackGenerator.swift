//
//  FeedbackGenerator.swift
//  HighLowGame
//
//  Created by Pavel on 2023-09-05.
//

import Foundation
import UIKit

func successFeedback() {
    let generator = UINotificationFeedbackGenerator()
    generator.notificationOccurred(.success)
}

func wrongFeedback() {
    let generator = UINotificationFeedbackGenerator()
    generator.notificationOccurred(.error)
}
