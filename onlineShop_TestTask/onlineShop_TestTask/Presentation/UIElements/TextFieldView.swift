// TextFieldView.swift
// onlineSHop_TestTask. Created by Zlata Guseva.

import UIKit

class TextFieldView: UIView {
    var placeholder: String
    var buttonIsHiden: Bool

    lazy var textField: UITextField = {
        let textField = UITextField()
        textField.font = .regular10
        textField.placeholder = placeholder
        textField.textAlignment = .center
        textField.attributedPlaceholder = NSAttributedString(
            string: placeholder,
            attributes: [.foregroundColor: UIColor.textFieldText ?? .clear]
        )
        return textField
    }()

    lazy var passwordButton: UIButton = {
        var button = UIButton()
        button.setImage(UIImage(named: "password"), for: .normal)
        button.isHidden = buttonIsHiden
        button.tintColor = .subTitle
        return button
    }()

    required init(placeholder: String, buttonIsHiden: Bool = true) {
        self.placeholder = placeholder
        self.buttonIsHiden = buttonIsHiden
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
        addTargets()
    }

    private func setupStyle() {
        backgroundColor = .textFieldBackground
        layer.cornerRadius = 15
    }

    private func addSubviews() {
        addSubview(textField)
        addSubview(passwordButton)
    }

    private func makeConstraints() {
        textField.snp.makeConstraints {
            $0.top.leading.trailing.bottom.equalToSuperview()
        }
        passwordButton.snp.makeConstraints {
            $0.trailing.equalTo(textField.snp.trailing).inset(15)
            $0.top.bottom.equalToSuperview().inset(7)
        }
    }

    private func addTargets() {
        passwordButton.addTarget(self, action: #selector(changeVisible), for: .touchUpInside)
    }

    @objc
    private func changeVisible() {
        textField.isSecureTextEntry.toggle()
    }
}
