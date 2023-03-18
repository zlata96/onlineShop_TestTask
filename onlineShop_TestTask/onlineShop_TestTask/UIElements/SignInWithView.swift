// SignInWithView.swift
// onlineSHop_TestTask. Created by Zlata Guseva.

import SnapKit
import UIKit

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
        mainLabel.snp.makeConstraints {
            $0.trailing.equalToSuperview()
            $0.centerY.equalTo(iconImageView.snp.centerY)
            $0.leading.equalTo(iconImageView.snp.trailing).offset(12)
        }

        iconImageView.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.size.equalTo(36)
        }
    }
}
