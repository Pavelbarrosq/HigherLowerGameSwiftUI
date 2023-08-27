//
//  Card.swift
//  HighLowGame
//
//  Created by Pavel on 2023-08-23.
//

import Foundation
import SwiftUI

class Card {
    var name: String
    var value: Int
    
    init(name: String, value: Int) {
        self.name = name
        self.value = value
    }
    
    var image: Image {
        return Image(name)
    }
}
