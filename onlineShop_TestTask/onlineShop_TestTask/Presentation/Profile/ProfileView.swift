// ProfileView.swift
// onlineSHop_TestTask. Created by Zlata Guseva.

import UIKit

class ProfileView: UIView {
    var profilePhotoView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "accountPhoto")
        image.layer.cornerRadius = 30
        return image
    }()

    var changePhotoButton: UIButton = {
        let button = UIButton()
        button.setTitle("Change photo", for: .normal)
        button.setTitleColor(.subTitle, for: .normal)
        button.titleLabel?.font = .regular8
        button.titleLabel?.textAlignment = .center
        return button
    }()

    var userNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Satria Adhi Pradana"
        label.font = .bold14
        return label
    }()

    var uploadButton = BlueButton(text: "Upload item", withoutImage: false)

    var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(cellWithClass: ProfileCell.self)
        tableView.rowHeight = 68
        tableView.separatorStyle = .none
        return tableView
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
        setupStyle()
        addSubviews()
        makeConstraints()
    }

    private func setupStyle() {
        backgroundColor = .profileBackground
    }

    private func addSubviews() {
        addSubview(profilePhotoView)
        addSubview(changePhotoButton)
        addSubview(userNameLabel)
        addSubview(uploadButton)
        addSubview(tableView)
    }

    private func makeConstraints() {
        profilePhotoView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(80)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(60)
        }

        changePhotoButton.snp.makeConstraints {
            $0.top.equalTo(profilePhotoView.snp.bottom).offset(8)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(15)
        }

        userNameLabel.snp.makeConstraints {
            $0.top.equalTo(changePhotoButton.snp.bottom).offset(20)
            $0.centerX.equalToSuperview()
        }

        uploadButton.snp.makeConstraints {
            $0.top.equalTo(userNameLabel.snp.bottom).offset(36)
            $0.leading.trailing.equalToSuperview().inset(43)
            $0.height.equalTo(40)
        }

        tableView.snp.makeConstraints {
            $0.top.equalTo(uploadButton.snp.bottom).offset(8)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(safeAreaLayoutGuide.snp.bottom)
        }
    }
}
