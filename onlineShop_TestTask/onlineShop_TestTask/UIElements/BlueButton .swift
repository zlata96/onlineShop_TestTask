// BlueButton .swift
// onlineSHop_TestTask. Created by Zlata Guseva.

import UIKit

class BlueButton: UIButton {
    var text: String
    var withoutImage: Bool

    lazy var button: UIButton = {
        let button = UIButton()
        button.setTitle(text, for: .normal)
        button.titleLabel?.textColor = .buttonText
        button.titleLabel?.font = .bold14
        button.backgroundColor = .button
        button.titleLabel?.textAlignment = .center
        button.layer.cornerRadius = 12
        return button
    }()

    lazy var uploadImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "uploadIcon")
        image.image?.withTintColor(.buttonText ?? .white)
        image.isHidden = withoutImage
        return image
    }()

    required init(text: String, withoutImage: Bool = true) {
        self.text = text
        self.withoutImage = withoutImage
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
        addSubview(button)
        addSubview(uploadImage)
    }

    private func makeConstraints() {
        button.snp.makeConstraints {
            $0.top.leading.trailing.bottom.equalToSuperview()
        }
        uploadImage.snp.makeConstraints {
            $0.leading.equalTo(button.snp.leading).offset(52)
            $0.top.bottom.equalToSuperview().inset(12)
        }
    }
}
