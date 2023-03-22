// SearchBarView.swift
// onlineSHop_TestTask. Created by Zlata Guseva.

import UIKit

class SearchBarView: UIView {
    var searchTextField: UITextField = {
        var textField = UITextField()
        textField.font = .regular10
        textField.layer.cornerRadius = 12
        textField.backgroundColor = .searchBarBackground
        textField.textAlignment = .center
        textField.attributedPlaceholder = NSAttributedString(
            string: "What are you loking for?",
            attributes: [.foregroundColor: UIColor.textFieldText ?? .clear]
        )
        return textField
    }()

    var seachImageView: UIImageView = {
        var view = UIImageView()
        view.image = UIImage(systemName: "magnifyingglass")
        view.tintColor = .subTitle
        return view
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
    }

    private func addSubviews() {
        addSubview(searchTextField)
        addSubview(seachImageView)
    }

    private func makeConstraints() {
        searchTextField.snp.makeConstraints {
            $0.top.bottom.leading.trailing.equalToSuperview()
        }

        seachImageView.snp.makeConstraints {
            $0.height.equalTo(20)
            $0.trailing.equalTo(searchTextField).inset(8)
            $0.centerY.equalTo(searchTextField.snp.centerY)
        }
    }
}
