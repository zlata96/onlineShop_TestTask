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

    var uploadButton: UIButton = {
        let button = UIButton()
        button.setTitle("Upload item", for: .normal)
        button.setTitleColor(.buttonText, for: .normal)
        button.titleLabel?.font = .bold14
        button.backgroundColor = .button
        button.titleLabel?.textAlignment = .center
        button.layer.cornerRadius = 12
        return button
    }()

    var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(cellWithClass: ProfileCell.self)
        tableView.rowHeight = 70
        tableView.separatorStyle = .none
        tableView.backgroundColor = .profileBackground
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
        profilePhotoView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(80)
            make.centerX.equalToSuperview()
            make.height.equalTo(60)
        }

        changePhotoButton.snp.makeConstraints { make in
            make.top.equalTo(profilePhotoView.snp.bottom).offset(8)
            make.centerX.equalToSuperview()
            make.height.equalTo(15)
        }

        userNameLabel.snp.makeConstraints { make in
            make.top.equalTo(changePhotoButton.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
        }

        uploadButton.snp.makeConstraints { make in
            make.top.equalTo(userNameLabel.snp.bottom).offset(36)
            make.leading.trailing.equalToSuperview().inset(43)
            make.height.equalTo(40)
        }

        tableView.snp.makeConstraints { make in
            make.top.equalTo(uploadButton.snp.bottom).offset(8)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom)
        }
    }
}
