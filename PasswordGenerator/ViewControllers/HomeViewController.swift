//
//  ViewController.swift
//  PasswordGenerator
//
//  Created by Usuário Convidado on 07/03/18.
//  Copyright © 2018 FIAP. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    //MARK: Lets and Vars
    
    @IBOutlet weak var numberOfPasswordsTextField: UITextField!
    @IBOutlet weak var numberOfCharactersTextField: UITextField!
    @IBOutlet weak var lowerCaseSwitch: UISwitch!
    @IBOutlet weak var upperCaseSwitch: UISwitch!
    @IBOutlet weak var numberSwitch: UISwitch!
    @IBOutlet weak var specialCharacterSwitch: UISwitch!
    
    //MARK: IBOutlets
    
    
    //MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    //MARK: Memory Management
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
     // MARK: - Navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let passVC = segue.destination as? PasswordViewController {
            if let numberOfPasswords = Int(numberOfPasswordsTextField.text!) {
                passVC.numberOfPasswords = numberOfPasswords
            }
            if let maxCharacters = Int(numberOfCharactersTextField.text!) {
                passVC.maxCharacters = maxCharacters
            }
            passVC.useLowerCasedLetters = lowerCaseSwitch.isOn
            passVC.useCapitalLetters = upperCaseSwitch.isOn
            passVC.useNumbers = numberSwitch.isOn
            passVC.useSpecialCharacters = specialCharacterSwitch.isOn
        }
     }
 

}

