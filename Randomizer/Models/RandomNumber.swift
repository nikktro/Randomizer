//
//  RandomNumber.swift
//  Randomizer
//
//  Created by Nikolay Trofimov on 12.02.2022.
//

import Foundation

struct RandomNumber {
    let minimumValue: Int
    let maximumValue: Int
    
    var getRandom: Int {
        Int.random(in: minimumValue...maximumValue)
    }

}
