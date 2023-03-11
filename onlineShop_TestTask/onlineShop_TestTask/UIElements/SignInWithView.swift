//  SignInWithView.swift
//  onlineShop_TestTask
//
//  Created by Zlata Guseva on 11.03.2023.

import UIKit
import SnapKit

class SignInWithView: UIView {
    var text: String
    var iconImage: UIImage?

    lazy var mainLabel: UILabel = {
        let mainLabel = UILabel()
        mainLabel.text = text
        mainLabel.font = .regular12
        mainLabel.textColor = .mainText
        return mainLabel
    }()

    lazy var iconImageView: UIImageView = {
        let image = UIImageView()
        image.image = iconImage ?? UIImage(systemName: "paperplane")
        image.tintColor = .black
        return image
    }()

    required init(with text: String, iconImage: UIImage?) {
        self.text = text
        self.iconImage = iconImage
        super.init(frame: .zero)
        commonInit()
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func commonInit() {
        addSubviews()
        makeConstraints()
    }

    private func addSubviews() {
        addSubview(mainLabel)
        addSubview(iconImageView)
    }

    private func makeConstraints() {
        mainLabel.snp.makeConstraints { make in
            make.trailing.equalToSuperview()
            make.centerY.equalTo(iconImageView.snp.centerY)
            make.leading.equalTo(iconImageView.snp.trailing).offset(12)
        }

        iconImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.size.equalTo(36)
        }
    }
}
