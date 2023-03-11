//  LogInView.swift
//  onlineShop_TestTask
//
//  Created by Zlata Guseva on 10.03.2023.
//

import UIKit

class LogInView: UIView {
    var mainLabel: UILabel = {
        let label = UILabel()
        label.text = "Welcome back"
        label.textColor = .mainText
        label.font = .bold26
        return label
    }()
    var nameInputView = TextFieldView(placeholder: "First name", haveImage: true)
    var passwordInputView = TextFieldView(placeholder: "Password", haveImage: false)

    var loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Login", for: .normal)
        button.titleLabel?.textColor = .buttonText
        button.titleLabel?.font = .bold14
        button.backgroundColor = .button
        button.titleLabel?.textAlignment = .center
        button.layer.cornerRadius = 12
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func commonInit() {
        backgroundColor = .mainBackground
        addSubviews()
        makeConstraints()
        setupTargets()
    }

    private func addSubviews() {
        addSubview(mainLabel)
        addSubview(nameInputView)
        addSubview(passwordInputView)
        addSubview(loginButton)
    }

    private func makeConstraints() {
        mainLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(158)
            make.centerX.equalToSuperview()
            make.height.equalTo(20)
        }

        nameInputView.snp.makeConstraints { make in
            make.height.equalTo(30)
            make.leading.equalToSuperview().offset(44)
            make.trailing.equalToSuperview().inset(42)
            make.top.equalTo(mainLabel.snp.bottom).offset(80)
        }

        passwordInputView.snp.makeConstraints { make in
            make.top.equalTo(nameInputView.snp.bottom).offset(35)
            make.leading.equalToSuperview().offset(44)
            make.trailing.equalToSuperview().inset(42)
            make.height.equalTo(30)
        }

        loginButton.snp.makeConstraints { make in
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom).inset(24)
            make.leading.trailing.equalToSuperview().inset(43)
            make.height.equalTo(46)
        }
    }

    private func setupTargets() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(UIView.endEditing))
        addGestureRecognizer(tapGesture)
        tapGesture.cancelsTouchesInView = false
//        nameInputView.textField.addTarget(
//            self,
//            action: #selector(textFieldDidChange),
//            for: UIControl.Event.editingChanged
//        )
    }

//    @objc func textFieldDidChange(_: UITextField) {
//        addButton.backgroundColor = nameInputView.textField.isValid && !frequencyView.selectedFrequencies.isEmpty
//            ? Colors.buttonActive.color
//            : Colors.buttonInactive.color
//        addButton.titleLabel?.textColor = nameInputView.textField.isValid && !frequencyView.selectedFrequencies.isEmpty
//            ? Colors.textButton.color
//            : Colors.textSecondary.color
//    }
}
