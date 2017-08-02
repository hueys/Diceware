//
//  DicewareFileGeneratorTests.swift
//  Diceware
//
//  Copyright © 2017 Steve Huey. All rights reserved.
//

import XCTest

class DicewareFileGeneratorTests: XCTestCase {
    
   func testResourceInit() {
      let dicewareGenerator = DicewareFileGenerator(withResource: "diceware8k", ofType: "txt")
      XCTAssert(dicewareGenerator != nil)
   }
   
   func testWordsHaveExpectedIndicies() {
      if let dicewareGenerator = DicewareFileGenerator(withResource: "diceware8k", ofType: "txt") {
         XCTAssertEqual("a", dicewareGenerator.word(forValue: 0))
         XCTAssertEqual("fable", dicewareGenerator.word(forValue: 2230))
         XCTAssertEqual("india", dicewareGenerator.word(forValue: 3310))
         XCTAssertEqual("wrap", dicewareGenerator.word(forValue: 7438))
      }
   }
   
   func testPasswordsHaveXNumberOfWords() {
      if let dicewareGenerator = DicewareFileGenerator(withResource: "diceware8k", ofType: "txt") {

         let fourWords = dicewareGenerator.generatePassword(withNumberOfWords: 4, separator: "@")
         XCTAssertEqual(4, splitPassword(fourWords, separator: "@").count)
         
         let sixWords = dicewareGenerator.generatePassword(withNumberOfWords: 6)
         XCTAssertEqual(6, splitPassword(sixWords, separator: "-").count)
      }
   }
   
   private func splitPassword(_ password: String, separator: String) -> [String] {
      return password.components(separatedBy: separator)
   }
}
