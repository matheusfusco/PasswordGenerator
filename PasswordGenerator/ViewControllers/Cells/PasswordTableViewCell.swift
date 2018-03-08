//
//  PasswordTableViewCell.swift
//  PasswordGenerator
//
//  Created by Usuário Convidado on 07/03/18.
//  Copyright © 2018 FIAP. All rights reserved.
//

import UIKit

class PasswordTableViewCell: UITableViewCell {

    //MARK: - Lets and Vars
    var password: String = ""  {
        didSet {
            passwordLabel.text = password
        }
    }
    
    //MARK: - IBOutlets
    @IBOutlet weak var passwordLabel: UILabel!
    
    //MARK: - Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
