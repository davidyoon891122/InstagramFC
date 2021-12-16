//
//  ProfileCollectionViewCell.swift
//  InstagramApp
//
//  Created by David Yoon on 2021/12/16.
//

import SnapKit
import UIKit

final class ProfileCollectionViewCell: UICollectionViewCell {
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        
        return imageView
    }()
    
    
    func setup(with image: UIImage) {
        self.contentView.addSubview(self.imageView)
        self.imageView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
        self.imageView.backgroundColor = .tertiaryLabel
    }
}
