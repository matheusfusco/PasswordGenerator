//
//  UIButton.swift
//  PasswordGenerator
//
//  Created by Usuário Convidado on 07/03/18.
//  Copyright © 2018 FIAP. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
public class CustomButton : UIButton {
    
    @IBInspectable
    var cornerRadius: CGFloat = 0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }

    @IBInspectable
    var shadowColor: UIColor = .black {
        didSet {
            self.layer.shadowColor = shadowColor.cgColor
        }
    }

    @IBInspectable
    var shadowOffset: CGSize = CGSize(width: 0, height: 3) {
        didSet {
            self.layer.shadowOffset = shadowOffset
        }
    }

    @IBInspectable
    var shadowRadius: CGFloat = 1.0 {
        didSet {
            self.layer.shadowRadius = shadowRadius
        }
    }

    @IBInspectable
    var shadowOpacity: Float = 0.25 {
        didSet {
            self.layer.shadowOpacity = shadowOpacity
        }
    }

    @IBInspectable
    var masksToBounds: Bool = false {
        didSet {
            self.layer.masksToBounds = masksToBounds
        }
    }
    
    public override var isHighlighted: Bool {
        didSet {
            if isHighlighted {
                animateScaleBtn(scale: 0.95)
            }
            else {
                animateScaleBtn(scale: 1)
            }
        }
    }
    
    private func animateScaleBtn(scale: CGFloat) {
        UIView.beginAnimations("ActionButtonScale", context: nil)
        UIView.setAnimationDuration(0.2)
        self.transform = CGAffineTransform(scaleX: scale, y: scale)
        UIView.commitAnimations()
    }
}
