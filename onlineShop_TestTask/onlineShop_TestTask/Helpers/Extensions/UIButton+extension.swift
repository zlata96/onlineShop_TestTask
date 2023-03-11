//
//  UIButton+extension.swift
//  onlineShop_TestTask
//
//  Created by Zlata Guseva on 11.03.2023.
//

import UIKit

extension UIButton {
    func buttonTextColorChange(For givenText: NSString,into color: UIColor, from locationNumber: Int, to length: Int) {
        let myMutableString = NSMutableAttributedString(string: givenText as String);
        myMutableString.addAttribute(NSAttributedString.Key.foregroundColor, value: color, range: NSRange(location: locationNumber,length: length))
        self.setAttributedTitle(myMutableString, for: .normal)

    }
}
