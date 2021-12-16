//
//  FeedTableViewCell.swift
//  InstagramApp
//
//  Created by David Yoon on 2021/12/16.
//

import UIKit
import SnapKit

final class FeedTableViewCell: UITableViewCell {
    private lazy var postImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .tertiaryLabel
        return imageView
    }()
    
    private lazy var likeButton: UIButton = {
        let button = UIButton()
        button.setImage(systemName: "heart")
        return button
    }()
    
    private lazy var commentButton: UIButton = {
        let button = UIButton()
        button.setImage(systemName: "message")
        return button
    }()
    
    private lazy var directMessageButton: UIButton = {
        let button = UIButton()
        button.setImage(systemName: "paperplane")
        return button
    }()
    
    private lazy var bookMarkButton: UIButton = {
        let button = UIButton()
        button.setImage(systemName: "bookmark")
        return button
    }()
    
    private lazy var currentLikedCountLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = .systemFont(ofSize: 13, weight: .semibold)
        label.text = "홍길동님 외 32명이 좋아합니다."
        return label
    }()
    
    private lazy var contentsLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = .systemFont(ofSize: 13, weight: .medium)
        label.text = "Swift Package Manager is a tool for managing the distribution of Swift code. It’s integrated with the Swift build system to automate the process of downloading, compiling, and linking dependencies.Xcode 11+ is required to build SnapKit using Swift Package Manager. To integrate SnapKit into your Xcode project using Swift Package Manager, add it to the dependencies value of your Package.swift:"
        label.numberOfLines = 5
        return label
    }()
    
    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.textColor = .secondaryLabel
        label.font = .systemFont(ofSize: 11, weight: .medium)
        label.text = "1일 전"
        return label
    }()
    
    func setup() {
        [
            self.postImageView,
            self.likeButton,
            self.commentButton,
            self.directMessageButton,
            self.bookMarkButton,
            self.currentLikedCountLabel,
            self.contentsLabel,
            self.dateLabel
        ].forEach{
            self.addSubview($0)
        }
        
        self.postImageView.snp.makeConstraints{
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.top.equalToSuperview()
            $0.height.equalTo(self.postImageView.snp.width)
        }
        
        let buttonWidth: CGFloat = 24.0
        let buttonInset: CGFloat = 16.0
        let buttonOffset: CGFloat = 12.0
        let labelOffset: CGFloat = 8.0
        
        self.likeButton.snp.makeConstraints{
            $0.leading.equalToSuperview().inset(buttonInset)
            $0.top.equalTo(self.postImageView.snp.bottom).offset(buttonInset)
            $0.width.equalTo(buttonWidth)
            $0.height.equalTo(buttonWidth)
        }
        
        self.commentButton.snp.makeConstraints{
            $0.leading.equalTo(self.likeButton.snp.trailing).offset(buttonOffset)
            $0.top.equalTo(self.likeButton.snp.top)
            $0.width.equalTo(buttonWidth)
            $0.height.equalTo(buttonWidth)
        }
        
        self.directMessageButton.snp.makeConstraints{
            $0.leading.equalTo(self.commentButton.snp.trailing).offset(buttonOffset)
            $0.top.equalTo(self.commentButton.snp.top)
            $0.width.equalTo(buttonWidth)
            $0.height.equalTo(buttonWidth)
        }
        
        self.bookMarkButton.snp.makeConstraints{
            $0.trailing.equalToSuperview().inset(buttonInset)
            $0.top.equalTo(self.likeButton.snp.top)
            $0.width.equalTo(buttonWidth)
            $0.height.equalTo(buttonWidth)
        }
        
        self.currentLikedCountLabel.snp.makeConstraints{
            $0.leading.equalTo(self.likeButton.snp.leading)
            $0.trailing.equalTo(bookMarkButton.snp.trailing)
            $0.top.equalTo(self.likeButton.snp.bottom).offset(14)
        }
        
        self.contentsLabel.snp.makeConstraints{
            $0.leading.equalTo(self.likeButton.snp.leading)
            $0.trailing.equalTo(self.bookMarkButton.snp.trailing)
            $0.top.equalTo(self.currentLikedCountLabel.snp.bottom).offset(labelOffset)
        }
        
        self.dateLabel.snp.makeConstraints{
            $0.leading.equalTo(self.likeButton.snp.leading)
            $0.trailing.equalTo(self.bookMarkButton.snp.trailing)
            $0.top.equalTo(self.contentsLabel.snp.bottom).offset(labelOffset)
            $0.bottom.equalToSuperview().inset(16)
        }
        
    }
}
