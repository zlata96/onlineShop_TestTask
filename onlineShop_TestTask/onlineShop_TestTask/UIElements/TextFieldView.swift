// TextFieldView.swift
// onlineSHop_TestTask. Created by Zlata Guseva.

import UIKit

class TextFieldView: UIView {
    var placeholder: String
    var imageIsHiden: Bool

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

    lazy var passwordImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "password")
        image.isHidden = imageIsHiden
        return image
    }()

    required init(placeholder: String, imageIsHiden: Bool = true) {
        self.placeholder = placeholder
        self.imageIsHiden = imageIsHiden
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
        layer.cornerRadius = 15
    }

    private func addSubviews() {
        addSubview(textField)
        addSubview(passwordImage)
    }

    private func makeConstraints() {
        textField.snp.makeConstraints {
            $0.top.leading.trailing.bottom.equalToSuperview()
        }
        passwordImage.snp.makeConstraints {
            $0.trailing.equalTo(textField.snp.trailing).inset(15)
            $0.top.bottom.equalToSuperview().inset(7)
        }
    }
}
