//
//  FeeeViewController.swift
//  InstagramApp
//
//  Created by David Yoon on 2021/12/16.
//

import UIKit
import SnapKit

final class FeedViewController: UIViewController {
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.backgroundColor = .systemBackground
        tableView.separatorStyle = .none
        tableView.register(FeedTableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.dataSource = self
        
        return tableView
    }()
    
    private lazy var imagePickerViewController: UIImagePickerController = {
        let imagePickerViewController = UIImagePickerController()
        imagePickerViewController.sourceType = .photoLibrary
        imagePickerViewController.allowsEditing = true
        imagePickerViewController.delegate = self
        return imagePickerViewController
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setNavigation()
        self.setTableView()
        
    }
    

}


extension FeedViewController: UIImagePickerControllerDelegate & UINavigationControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        var selectImage: UIImage?
        
        if let editedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            selectImage = editedImage
        } else if let originalImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            selectImage = originalImage
        }
        
        self.imagePickerViewController.dismiss(animated: true) { [weak self] in
            guard let self = self,
                  let uploadImage = selectImage else { return
                
            }
            let navigationController = UINavigationController(rootViewController: UploadViewController(uploadImage: uploadImage))
            navigationController.modalPresentationStyle = .fullScreen
            self.present(navigationController, animated: true, completion: nil)
            
        }
        
        
    }
}

extension FeedViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? FeedTableViewCell
        cell?.setup()
        return cell ?? UITableViewCell()
    }
    
    
}

private extension FeedViewController {
    func setNavigation() {
        self.navigationItem.title = "Instagram"
        let uploadButton = UIBarButtonItem(image: UIImage(systemName: "plus.app"), style: .plain, target: self, action: #selector(didTapUploadButton))
        self.navigationItem.rightBarButtonItem = uploadButton
        
        
    }
    
    @objc func didTapUploadButton() {
        present(self.imagePickerViewController, animated: true, completion: nil)
    }
    
    func setTableView() {
        self.view.addSubview(self.tableView)
        self.tableView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
    }
}


