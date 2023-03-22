// LogInView.swift
// onlineSHop_TestTask. Created by Zlata Guseva.

import UIKit

class LogInView: UIView {
    var mainLabel: UILabel = {
        let label = UILabel()
        label.text = "Welcome back"
        label.textColor = .mainText
        label.font = .bold26
        return label
    }()

    var emailInputView = TextFieldView(placeholder: "E-mail")
    var passwordInputView: TextFieldView = {
        let view = TextFieldView(placeholder: "Password", buttonIsHiden: false)
        view.textField.textContentType = .password
        view.textField.isSecureTextEntry = true
        return view
    }()

    var haveNoAccountButton: UIButton = {
        let button = UIButton()
        button.buttonTextColorChange(For: "Still have no account? Sign in", into: .button ?? .black, from: 23, to: 7)
        button.titleLabel?.textColor = .mainText
        button.titleLabel?.font = .regular10
        button.backgroundColor = .clear
        return button
    }()

    var loginButton = BlueButton(text: "Login")

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
        addSubview(emailInputView)
        addSubview(passwordInputView)
        addSubview(haveNoAccountButton)
        addSubview(loginButton)
    }

    private func makeConstraints() {
        mainLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(158)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(20)
        }

        emailInputView.snp.makeConstraints {
            $0.height.equalTo(30)
            $0.leading.equalToSuperview().offset(44)
            $0.trailing.equalToSuperview().inset(42)
            $0.top.equalTo(mainLabel.snp.bottom).offset(80)
        }

        passwordInputView.snp.makeConstraints {
            $0.top.equalTo(emailInputView.snp.bottom).offset(35)
            $0.leading.equalToSuperview().offset(44)
            $0.trailing.equalToSuperview().inset(42)
            $0.height.equalTo(30)
        }

        haveNoAccountButton.snp.makeConstraints {
            $0.top.equalTo(loginButton.snp.bottom).offset(16)
            $0.leading.equalToSuperview().inset(43)
        }

        loginButton.snp.makeConstraints {
            $0.top.equalTo(passwordInputView.snp.bottom).offset(35)
            $0.leading.trailing.equalToSuperview().inset(43)
            $0.height.equalTo(46)
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
}
