//
//  UploadViewController.swift
//  InstagramApp
//
//  Created by David Yoon on 2021/12/16.
//

import UIKit
import SnapKit

final class UploadViewController: UIViewController {
    private let uploadImage: UIImage
    
    private lazy var uploadImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    
    private lazy var textView: UITextView = {
        let textView = UITextView()
        textView.font = .systemFont(ofSize: 15.0)
        textView.text = "문구 입력..."
        textView.textColor = .secondaryLabel
        textView.delegate = self
        return textView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
        self.setNavigation()
        self.setLayout()
        
        self.uploadImageView.image = self.uploadImage
    }
    
    init(uploadImage: UIImage) {
        self.uploadImage = uploadImage
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension UploadViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        guard textView.textColor == .secondaryLabel else {
            return
        }
        textView.text = nil
        textView.textColor = .label
    }
}


private extension UploadViewController {
    func setNavigation() {
        self.navigationItem.title = "새 게시물"
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "취소", style: .plain, target: self, action: #selector(didTapLeftBarButton))
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "공유", style: .plain, target: self, action: #selector(didTapRightBarButton))
        
    }
    
    @objc func didTapLeftBarButton() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func didTapRightBarButton() {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    func setLayout() {
        [
            self.uploadImageView,
            self.textView
        ].forEach{
            self.view.addSubview($0)
        }
        
        let imageViewInset: CGFloat = 16.0
        
        self.uploadImageView.snp.makeConstraints{
            $0.top.equalTo(self.view.safeAreaLayoutGuide).inset(imageViewInset)
            $0.leading.equalToSuperview().inset(imageViewInset)
            $0.width.equalTo(100)
            $0.height.equalTo(self.uploadImageView.snp.width)
        }
        
        self.textView.snp.makeConstraints{
            $0.leading.equalTo(self.uploadImageView.snp.trailing).inset(imageViewInset)
            $0.trailing.equalToSuperview().inset(imageViewInset)
            $0.top.equalTo(self.uploadImageView.snp.top)
            $0.bottom.equalTo(self.uploadImageView.snp.bottom)
        }
        
    }
}
