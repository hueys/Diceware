//
//  DicewareFileGenerator.swift
//  Diceware
//
//  Copyright © 2017 Steve Huey. All rights reserved.
//

import Foundation

class DicewareFileGenerator {
   let dicewareFile: String
   var words = [String]()
   
   init(dicewareFile: String) {
      self.dicewareFile = dicewareFile
      self.words = loadWords()
   }
   
   convenience init?(withResource: String, ofType: String) {
      if let path = Bundle.main.path(forResource: withResource, ofType: ofType) {
         self.init(dicewareFile: path)
      } else {
         return nil
      }
   }
   
   func word(forValue value: Int) -> String? {
      return isValidIndex(value) ? words[value] : nil
   }
   
   fileprivate func randomWord() -> String {
      let value = Int(arc4random_uniform(UInt32(self.words.count)))
      
      return word(forValue: value)!
   }
   
   private func isValidIndex(_ value: Int) -> Bool {
      return (value >= 0 && value < words.count)
   }
   
   private func loadWords() -> [String] {
      guard let fileData = try? String(contentsOfFile:self.dicewareFile) else {
         return []
      }
      
      return fileData.components(separatedBy: CharacterSet.newlines)
                     .map { $0.trimmingCharacters(in: CharacterSet.whitespaces) }
                     .filter { $0.characters.count > 0 }
   }
}

extension DicewareFileGenerator: DicewarePasswordGenerator {
   func generatePassword(withNumberOfWords n: Int, separator: String = "-") -> String {
      var words = [String]()
      
      for _ in 0 ..< n {
         words.append(self.randomWord())
      }
      
      return words.joined(separator: separator)
   }
}
