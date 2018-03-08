//
//  PasswordGenerator.swift
//  PasswordGenerator
//
//  Created by Usuário Convidado on 07/03/18.
//  Copyright © 2018 FIAP. All rights reserved.
//

import Foundation
import UIKit

class PasswordGenerator {
    var passwordsList: [String] = []
    var maxCharacters: Int
    var numberOfPasswords: Int
    var useCapitalLetters: Bool
    var useLowerCasedLetters: Bool
    var useNumbers: Bool
    var useSpecialCharacters: Bool
    
    private var letters = "abcdefghijklmnopqrstuvwxyz"
    private var numbers = "1234567890"
    private var specialCharacters = "`~!@#$%ˆ&*()-_=+[{]};|:,<.>/?"
    
    init(maxCharacters: Int, numberOfPasswords: Int, useCapitalLetters: Bool, useLowerCasedLetters: Bool, useNumbers: Bool, useSpecialCharacters: Bool) {
        self.maxCharacters = maxCharacters
        self.numberOfPasswords = numberOfPasswords
        self.useCapitalLetters = useCapitalLetters
        self.useLowerCasedLetters = useLowerCasedLetters
        self.useNumbers = useNumbers
        self.useSpecialCharacters = useSpecialCharacters
    }
    
    func generate() -> [String] {
        passwordsList.removeAll()
        
        var universe = ""
        if useCapitalLetters {
            universe += letters.uppercased()
        }
        if useLowerCasedLetters {
            universe += letters
        }
        if useNumbers {
            universe += numbers
        }
        if useSpecialCharacters {
            universe += specialCharacters
        }
        let universeArray = Array(universe)
        
        while passwordsList.count < numberOfPasswords {
            var password: String = ""
            for _ in 1...maxCharacters {
                let index = Int(arc4random_uniform(UInt32(universeArray.count)))
                password += String(universeArray[index])
            }
            passwordsList.append(password)
        }
        
        return passwordsList
    }
}
