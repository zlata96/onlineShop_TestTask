// SignInViewController.swift
// onlineSHop_TestTask. Created by Zlata Guseva.

import UIKit

class SignInViewController: UIViewController {
    private var signInView = SignInView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view = signInView
        addTargets()
    }

    private func addTargets() {
        signInView.alreadyLoginButton.addTarget(self, action: #selector(goToLogInnViewController), for: .touchUpInside)
        signInView.signInButton.addTarget(self, action: #selector(signInnHaveMade), for: .touchUpInside)
    }

    @objc
    private func goToLogInnViewController() {
        let logInnViewController = NavigationController(rootViewController: LogInViewController())
        present(logInnViewController, animated: true)
    }

    @objc
    private func signInnHaveMade() {
        do {
            try KeychainManager.save(
                service: "onlineShop_TestTask",
                account: signInView.firstNameInputView.textField.text ?? "",
                password: signInView.passwordInputView.textField.text?.data(using: .utf8) ?? Data()
            )
        } catch {
            print(error)
        }

        let profileViewController = TabBarController()
        present(profileViewController, animated: true)
    }
}

class KeychainManager {
    enum KeychainError: Error {
        case duplacateEntry
        case unknown(OSStatus)
    }

    static func save(service: String, account: String,
                     password: Data) throws
    {
        let query: [String: AnyObject] = [kSecClass as String: kSecClassGenericPassword,
                                          kSecAttrService as String: service as AnyObject,
                                          kSecAttrAccount as String: account as AnyObject,
                                          kSecValueData as String: password as AnyObject]

        let status = SecItemAdd(query as CFDictionary, nil)
        guard status != errSecDuplicateItem else {
            throw KeychainError.duplacateEntry
        }

        guard status == errSecSuccess else {
            throw KeychainError.unknown(status)
        }
        print("saved")
    }

    private func get(service: String, account: String) -> Data? {
        let query: [String: AnyObject] = [kSecClass as String: kSecClassGenericPassword,
                                          kSecAttrService as String: service as AnyObject,
                                          kSecAttrAccount as String: account as AnyObject,
                                          kSecReturnData as String: kCFBooleanTrue,
                                          kSecMatchLimit as String: kSecMatchLimitOne]
        var result: AnyObject?
        let status = SecItemCopyMatching(query as CFDictionary, &result)
        print("Read status \(status)")
        return result as? Data
    }

    static func getPassword() -> String {
        guard let data = KeychainManager.get(service: "facebook.com", account: "afraz") else {
            print("failed to erad password")
            return
        }
        let password = String(decoding: data, as: UTF8.self)
        return password
    }
}
