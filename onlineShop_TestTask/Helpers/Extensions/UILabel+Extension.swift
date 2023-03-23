// UILabel+Extension.swift
// onlineSHop_TestTask. Created by Zlata Guseva.

import UIKit

extension UILabel {
    func labelColorChange(for text: String, color: UIColor, from locationNumber: Int, to length: Int, font: UIFont) {
        let myString: NSString = text as NSString
        var myMutableString = NSMutableAttributedString()
        myMutableString = NSMutableAttributedString(
            string: myString as String,
            attributes: [NSAttributedString.Key.font: font]
        )
        myMutableString.addAttribute(
            NSAttributedString.Key.foregroundColor,
            value: color,
            range: NSRange(location: locationNumber, length: length)
        )
        attributedText = myMutableString
    }
}
