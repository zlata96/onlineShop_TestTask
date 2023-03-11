//  TextFieldView.swift
//  onlineShop_TestTask
//
//  Created by Zlata Guseva on 10.03.2023.

import UIKit
import SnapKit

class TextFieldView: UIView {
    var placeholder: String
    var haveImage: Bool

    lazy var textField: UITextField = {
        let textField = UITextField()
        //textField.font = .bodyRegular
        textField.placeholder = placeholder
        textField.attributedPlaceholder = NSAttributedString(
            string: placeholder,
            attributes: [.foregroundColor: UIColor.textFieldText]
        )
        textField.layer.cornerRadius = 15
        return textField
    }()

    lazy var passwordImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "password")
        image.isHidden = haveImage
        return image
    }()

    required init(placeholder: String, haveImage: Bool) {
        self.placeholder = placeholder
        self.haveImage = haveImage
        super.init(frame: .zero)
        commonInit()
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func commonInit() {
        setupStyle()
        addSubviews()
        makeConstraints()
    }

    private func setupStyle() {
        backgroundColor = .textFieldBackground
    }

    private func addSubviews() {
        addSubview(textField)
        addSubview(passwordImage)
    }

    private func makeConstraints() {
        textField.snp.makeConstraints { make in
            //make.height.equalTo(30)
            make.top.leading.trailing.bottom.equalToSuperview()
        }
        passwordImage.snp.makeConstraints { make in
            //make.height.equalTo(15)
            make.trailing.equalTo(textField.snp.trailing).inset(15)
            make.top.bottom.equalToSuperview().inset(7)
        }
    }
}
