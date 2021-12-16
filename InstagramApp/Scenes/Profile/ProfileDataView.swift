//
//  ProfileDataView.swift
//  InstagramApp
//
//  Created by David Yoon on 2021/12/16.
//

import SnapKit
import UIKit

final class ProfileDataview: UIView {
    private let title: String
    private let count: Int
    
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14.0, weight: .medium)
        label.text = title
        return label
    }()
    
    private lazy var countLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16.0, weight: .bold)
        label.text = "\(count)"
        return label
    }()
    
    
    init(title: String, count: Int) {
        self.title = title
        self.count = count
        super.init(frame: .zero)
        
        self.setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}



private extension ProfileDataview {
    func setLayout() {
        let labelStackView = UIStackView(arrangedSubviews: [ self.countLabel, self.titleLabel])
        labelStackView.axis = .vertical
        labelStackView.alignment = .center
        labelStackView.spacing = 4
        
        self.addSubview(labelStackView)
        
        labelStackView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
    }
}
