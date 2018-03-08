//
//  PasswordsListViewController.swift
//  PasswordGenerator
//
//  Created by Usuário Convidado on 07/03/18.
//  Copyright © 2018 FIAP. All rights reserved.
//

import UIKit

class PasswordViewController: UIViewController {

    //MARK: - Lets and Vars
    var passwordsList: [String] = []
    var maxCharacters: Int = 10
    var numberOfPasswords: Int = 1
    var useCapitalLetters: Bool!
    var useLowerCasedLetters: Bool!
    var useNumbers: Bool!
    var useSpecialCharacters: Bool!
    var passwordGenerator: PasswordGenerator?
    
    //MARK: - IBOutlets
    @IBOutlet weak var passwordsTableView: UITableView!
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configVariables()
        configViews()
        generatePasswords()
    }
    
    func configVariables() {
        passwordGenerator = PasswordGenerator(maxCharacters: self.maxCharacters, numberOfPasswords: self.numberOfPasswords, useCapitalLetters: self.useCapitalLetters, useLowerCasedLetters: self.useLowerCasedLetters, useNumbers: self.useNumbers, useSpecialCharacters: self.useSpecialCharacters)
    }
    
    func configViews() {
        passwordsTableView.tableFooterView = UIView()
    }
    
    func generatePasswords() {
        if let passwords = passwordGenerator?.generate() {
            passwordsList = passwords
            passwordsTableView.reloadData()
        }
    }
    
    //MARK: - Button Actions
    @IBAction func generateAgainBtnClicked(_ sender: Any) {
        generatePasswords()
    }
    
    //MARK: - Memory Management
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

//MARK: - UITableView Delegate & DataSource Methods
extension PasswordViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let alert = UIAlertController(title: nil, message: "Senha '\(passwordsList[indexPath.row])' copiada com sucesso", preferredStyle: UIAlertControllerStyle.alert)
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil)
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }
}

extension PasswordViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "passwordCell", for: indexPath) as! PasswordTableViewCell
        cell.password = passwordsList[indexPath.row]
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return passwordsList.count
    }
}
