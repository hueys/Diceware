//
//  Diceware.swift
//  Diceware
//
//  Copyright © 2017 Steve Huey. All rights reserved.
//

import Foundation

protocol DicewarePasswordGenerator {
   
   /// Generate a 'diceware' style passphrase
   ///
   /// - Parameters:
   ///   - withNumberOfWords: the number of words to include in the passphrase
   ///   - separator: the separator to join the words of the passphrase with
   /// - Returns: a 'diceware' style passphrase
   func generatePassword(withNumberOfWords: Int, separator: String) -> String
}
