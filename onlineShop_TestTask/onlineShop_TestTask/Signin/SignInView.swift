// SignInView.swift
// onlineSHop_TestTask. Created by Zlata Guseva.

import UIKit

class SignInView: UIView {
    var mainLabel: UILabel = {
        let label = UILabel()
        label.text = "Sign in"
        label.textColor = .mainText
        label.font = .bold26
        return label
    }()

    var firstNameInputView = TextFieldView(placeholder: "First name", haveImage: true)
    var lastNameInputView = TextFieldView(placeholder: "Last name", haveImage: true)
    var emailInputView = TextFieldView(placeholder: "Email", haveImage: true)

    var signInButton: UIButton = {
        let button = UIButton()
        button.setTitle("Sign in", for: .normal)
        button.titleLabel?.textColor = .buttonText
        button.titleLabel?.font = .bold14
        button.backgroundColor = .button
        button.titleLabel?.textAlignment = .center
        button.layer.cornerRadius = 12
        return button
    }()

    var alreadyLoginButton: UIButton = {
        let button = UIButton()
        button.buttonTextColorChange(For: "Already have an account? Log in", into: .button ?? .black, from: 25, to: 6)
        button.titleLabel?.textColor = .mainText
        button.titleLabel?.font = .regular10
        button.backgroundColor = .clear
        return button
    }()

    var signInWithGoogleView = SignInWithView(with: "Sign in with Google", iconImage: UIImage(named: "google"))

    var signInWithAppleView = SignInWithView(with: "Sign in with Apple", iconImage: UIImage(named: "apple"))

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
        addSubview(firstNameInputView)
        addSubview(lastNameInputView)
        addSubview(emailInputView)
        addSubview(signInButton)
        addSubview(alreadyLoginButton)
        addSubview(signInWithGoogleView)
        addSubview(signInWithAppleView)
    }

    private func makeConstraints() {
        mainLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(158)
            make.centerX.equalToSuperview()
        }

        firstNameInputView.snp.makeConstraints { make in
            make.height.equalTo(30)
            make.leading.equalToSuperview().offset(44)
            make.trailing.equalToSuperview().inset(42)
            make.top.equalTo(mainLabel.snp.bottom).offset(80)
        }

        lastNameInputView.snp.makeConstraints { make in
            make.height.equalTo(30)
            make.leading.equalToSuperview().offset(44)
            make.trailing.equalToSuperview().inset(42)
            make.top.equalTo(firstNameInputView.snp.bottom).offset(35)
        }

        emailInputView.snp.makeConstraints { make in
            make.height.equalTo(30)
            make.leading.equalToSuperview().offset(44)
            make.trailing.equalToSuperview().inset(42)
            make.top.equalTo(lastNameInputView.snp.bottom).offset(35)
        }

        signInButton.snp.makeConstraints { make in
            make.top.equalTo(emailInputView.snp.bottom).offset(35)
            make.leading.trailing.equalToSuperview().inset(43)
            make.height.equalTo(46)
        }

        alreadyLoginButton.snp.makeConstraints { make in
            make.top.equalTo(signInButton.snp.bottom).offset(16)
            make.leading.equalToSuperview().inset(43)
        }

        signInWithGoogleView.snp.makeConstraints { make in
            make.top.equalTo(signInButton.snp.bottom).offset(100)
            make.leading.equalToSuperview().offset(100)
        }

        signInWithAppleView.snp.makeConstraints { make in
            make.top.equalTo(signInWithGoogleView.snp.bottom).offset(50)
            make.leading.equalToSuperview().offset(100)
        }
    }

    private func setupTargets() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(UIView.endEditing))
        addGestureRecognizer(tapGesture)
        tapGesture.cancelsTouchesInView = false
    }
}
