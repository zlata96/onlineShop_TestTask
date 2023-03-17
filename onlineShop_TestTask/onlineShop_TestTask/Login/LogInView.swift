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

    var nameInputView = TextFieldView(placeholder: "First name", haveImage: true)
    var passwordInputView = TextFieldView(placeholder: "Password", haveImage: false)

    var loginButton = BlueButton(text: "Login", withoutImage: true)

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
            make.top.equalTo(passwordInputView.snp.bottom).inset(35)
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
}
