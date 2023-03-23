// UIButton+Extension.swift
// onlineSHop_TestTask. Created by Zlata Guseva.

import UIKit

extension UIButton {
    func buttonTextColorChange(For givenText: NSString, into color: UIColor, from locationNumber: Int, to length: Int) {
        let myMutableString = NSMutableAttributedString(string: givenText as String)
        myMutableString.addAttribute(
            NSAttributedString.Key.foregroundColor,
            value: color,
            range: NSRange(location: locationNumber, length: length)
        )
        setAttributedTitle(myMutableString, for: .normal)
    }
}
