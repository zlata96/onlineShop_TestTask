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

    var firstNameInputView = TextFieldView(placeholder: "First name", imageIsHiden: true)
    var lastNameInputView = TextFieldView(placeholder: "Last name", imageIsHiden: true)
    var emailInputView = TextFieldView(placeholder: "Email", imageIsHiden: true)
    var passwordInputView = TextFieldView(placeholder: "Password", imageIsHiden: false)

    var signInButton = BlueButton(text: "Sign in", withoutImage: true)

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
        addSubview(passwordInputView)
        addSubview(signInButton)
        addSubview(alreadyLoginButton)
        addSubview(signInWithGoogleView)
        addSubview(signInWithAppleView)
    }

    private func makeConstraints() {
        mainLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(158)
            $0.centerX.equalToSuperview()
        }

        firstNameInputView.snp.makeConstraints {
            $0.height.equalTo(30)
            $0.leading.equalToSuperview().offset(44)
            $0.trailing.equalToSuperview().inset(42)
            $0.top.equalTo(mainLabel.snp.bottom).offset(80)
        }

        lastNameInputView.snp.makeConstraints {
            $0.height.equalTo(30)
            $0.leading.equalToSuperview().offset(44)
            $0.trailing.equalToSuperview().inset(42)
            $0.top.equalTo(firstNameInputView.snp.bottom).offset(35)
        }

        emailInputView.snp.makeConstraints {
            $0.height.equalTo(30)
            $0.leading.equalToSuperview().offset(44)
            $0.trailing.equalToSuperview().inset(42)
            $0.top.equalTo(lastNameInputView.snp.bottom).offset(35)
        }

        passwordInputView.snp.makeConstraints {
            $0.height.equalTo(30)
            $0.leading.equalToSuperview().offset(44)
            $0.trailing.equalToSuperview().inset(42)
            $0.top.equalTo(emailInputView.snp.bottom).offset(35)
        }

        signInButton.snp.makeConstraints {
            $0.top.equalTo(passwordInputView.snp.bottom).offset(35)
            $0.leading.trailing.equalToSuperview().inset(43)
            $0.height.equalTo(46)
        }

        alreadyLoginButton.snp.makeConstraints {
            $0.top.equalTo(signInButton.snp.bottom).offset(16)
            $0.leading.equalToSuperview().inset(43)
        }

        signInWithGoogleView.snp.makeConstraints {
            $0.top.equalTo(signInButton.snp.bottom).offset(100)
            $0.leading.equalToSuperview().offset(100)
        }

        signInWithAppleView.snp.makeConstraints {
            $0.top.equalTo(signInWithGoogleView.snp.bottom).offset(50)
            $0.leading.equalToSuperview().offset(100)
        }
    }

    private func setupTargets() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(UIView.endEditing))
        addGestureRecognizer(tapGesture)
        tapGesture.cancelsTouchesInView = false
    }
}
