// ProfileCell.swift
// onlineSHop_TestTask. Created by Zlata Guseva.

import UIKit

enum ProfileCellState {
    case pointer
    case text(value: String)
    case none
}

class ProfileCell: UITableViewCell {
    lazy var iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .profileCycleBackground
        imageView.layer.cornerRadius = 20
        imageView.contentMode = .center
        return imageView
    }()

    var profileItemLabel: UILabel = {
        let label = UILabel()
        label.font = .regular12
        label.textColor = .mainText
        return label
    }()

    var rightPointer: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "rightPointer")
        image.tintColor = .mainText
        return image
    }()

    var balanceLabel: UILabel = {
        let label = UILabel()
        label.font = .regular12
        label.textColor = .mainText
        label.isHidden = true
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        commonInit()
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func commonInit() {
        addSubviews()
        makeConstraints()
        setupStyle()
    }

    private func setupStyle() {
        selectionStyle = .none
        backgroundColor = .profileBackground
    }

    private func addSubviews() {
        addSubview(iconImageView)
        addSubview(profileItemLabel)
        addSubview(rightPointer)
        addSubview(balanceLabel)
    }

    private func makeConstraints() {
        iconImageView.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(32)
            $0.centerY.equalToSuperview()
            $0.size.equalTo(40)
        }

        profileItemLabel.snp.makeConstraints {
            $0.leading.equalTo(iconImageView.snp.trailing).offset(8)
            $0.top.bottom.equalToSuperview().inset(10)
        }

        rightPointer.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(44)
            $0.centerY.equalToSuperview()
            $0.height.equalTo(10)
            $0.width.equalTo(6)
        }

        balanceLabel.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(44)
            $0.centerY.equalToSuperview()
            $0.top.bottom.equalToSuperview().inset(10)
        }
    }
}

extension ProfileCell: Configurable {
    func configure(with viewModel: ProfileCellModel) {
        profileItemLabel.text = viewModel.name
        iconImageView.image = viewModel.iconImage
        switch viewModel.state {
        case .none:
            rightPointer.isHidden = true; balanceLabel.isHidden = true
        case let .text(value):
            rightPointer.isHidden = true; balanceLabel.isHidden = false; balanceLabel.text = value
        case .pointer:
            rightPointer.isHidden = false; balanceLabel.isHidden = true
        }
    }
}
