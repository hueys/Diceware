//
//  ViewController.swift
//  Diceware
//
//  Copyright © 2017 Steve Huey. All rights reserved.
//

import UIKit

import SwiftyButton

class ViewController: UIViewController {
   var diceware: DicewareFileGenerator!
   
   // MARK: - Outlets
   @IBOutlet weak var passphraseLabel: UILabel!
   @IBOutlet weak var slider: UISlider!
   @IBOutlet weak var generateButton: PressableButton!
   @IBOutlet weak var copyButton: PressableButton!
   
   // MARK: - View Lifecycle
   override func viewDidLoad() {
      diceware = DicewareFileGenerator(withResource: "diceware8k", ofType: "txt")
   }
   
   override func viewWillAppear(_ animated: Bool) {
      generatePassphrase(self)
   }
   
   // MARK: - UIViewController
   override var preferredStatusBarStyle: UIStatusBarStyle {
      return .lightContent
   }
   
   // MARK: - Actions
   @IBAction func sliderChanged(_ sender: Any) {
      generatePassphrase(sender)
   }

   @IBAction func generatePassphrase(_ sender: Any) {
      passphraseLabel.text = diceware.generatePassword(withNumberOfWords: numberOfWords())
   }

   @IBAction func copyPassphrase(_ sender: Any) {
      UIPasteboard.general.string = passphraseLabel.text!
   }
   
   // MARK: - Internal
   private func numberOfWords() -> Int {
      return Int(slider.value)
   }
}

