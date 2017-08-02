//
//  Diceware.swift
//  Diceware
//
//  Copyright © 2017 Steve Huey. All rights reserved.
//

import Foundation

protocol DicewarePasswordGenerator {
   func generatePassword(withNumberOfWords: Int, separator: String) -> String
}
