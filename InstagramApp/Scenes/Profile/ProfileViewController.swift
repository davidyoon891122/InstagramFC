//
//  ProfileViewController.swift
//  InstagramApp
//
//  Created by David Yoon on 2021/12/16.
//

import UIKit
import SnapKit

final class ProfileViewController: UIViewController {
    
    private lazy var profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 40
        imageView.layer.borderWidth = 1
        imageView.layer.borderColor = UIColor.quaternaryLabel.cgColor
        return imageView
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "User Name"
        label.font = .systemFont(ofSize: 14.0, weight: .semibold)
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "안녕하세요 방가워요~"
        label.font = .systemFont(ofSize: 14.0, weight: .medium)
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var followButton: UIButton = {
        let button = UIButton()
        button.setTitle("팔로우", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 14, weight: .semibold)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 3.0
        return button
    }()
    
    private lazy var messageButton: UIButton = {
        let button = UIButton()
        button.setTitle("메시지", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 14, weight: .semibold)
        button.backgroundColor = .white
        button.layer.cornerRadius = 3.0
        button.layer.borderWidth = 0.5
        button.layer.borderColor = UIColor.lightGray.cgColor
        return button
    }()
    
    private let photoDataView = ProfileDataview(title: "게시물", count: 123)
    private let followerDataView = ProfileDataview(title: "팔로워", count: 2420)
    private let followingDataView = ProfileDataview(title: "팔로잉", count: 1)
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setNavigation()
        self.setLayout()
    }
    
    
 
}


private extension ProfileViewController {
    func setNavigation() {
        self.navigationItem.title = "UserName"
        
        let rightBarButton = UIBarButtonItem(image: UIImage(systemName: "ellipsis"), style: .plain, target: self, action: nil)
        self.navigationItem.rightBarButtonItem = rightBarButton
    }
    
    
    func setLayout() {
        let buttonStackView = UIStackView(arrangedSubviews: [self.followButton, self.messageButton])
        
        buttonStackView.spacing = 4.0
        buttonStackView.distribution = .fillEqually
        
        let dataStackView = UIStackView(arrangedSubviews: [self.followerDataView, self.followingDataView, self.photoDataView])
        
        dataStackView.spacing = 4
        dataStackView.distribution = .fillEqually
        
        
        [
            self.profileImageView,
            self.nameLabel,
            self.descriptionLabel,
            buttonStackView,
            dataStackView
        ].forEach{
            self.view.addSubview($0)
        }
        
        let inset: CGFloat = 16.0
        
        self.profileImageView.snp.makeConstraints{
            $0.top.equalTo(self.view.safeAreaLayoutGuide).inset(inset)
            $0.leading.equalToSuperview().inset(inset)
            $0.width.equalTo(80)
            $0.height.equalTo(self.profileImageView.snp.width)
        }
        
        self.nameLabel.snp.makeConstraints{
            $0.top.equalTo(self.profileImageView.snp.bottom).offset(12)
            $0.leading.equalTo(self.profileImageView.snp.leading)
            $0.trailing.equalToSuperview().inset(inset)
        }
        
        self.descriptionLabel.snp.makeConstraints{
            $0.top.equalTo(self.nameLabel.snp.bottom).offset(6)
            $0.leading.equalTo(self.nameLabel.snp.leading)
            $0.trailing.equalTo(self.nameLabel.snp.trailing)
        }
        
        buttonStackView.snp.makeConstraints{
            $0.top.equalTo(self.descriptionLabel.snp.bottom).offset(12)
            $0.leading.equalTo(self.nameLabel.snp.leading)
            $0.trailing.equalTo(self.nameLabel.snp.trailing)
        }
        
        dataStackView.snp.makeConstraints{
            $0.leading.equalTo(self.profileImageView.snp.trailing).offset(inset)
            $0.trailing.equalToSuperview().inset(inset)
            $0.centerY.equalTo(self.profileImageView.snp.centerY)
            
        }
    }
}
