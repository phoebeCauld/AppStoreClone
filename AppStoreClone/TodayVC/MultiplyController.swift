//
//  MultiplyController.swift
//  AppStoreClone
//
//  Created by F1xTeoNtTsS on 09.12.2021.
//

import UIKit

enum Mode {
    case fullscreen, small
}

class MultiplyController: UICollectionViewController {
    
    var results = [FeedResults]()
    private var mode: Mode?
    private let cellId = "multiplyCell"
    override var prefersStatusBarHidden: Bool { return true }
    private let closeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "xmark.circle.fill"), for: .normal)
        button.tintColor = .systemBlue
        button.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        switch mode {
        case .fullscreen:
            setCloseButton()
        case .small: 
            self.collectionView.isScrollEnabled = false
        case .none:
            break
        }
        
        collectionView.register(MultiplyCell.self, forCellWithReuseIdentifier: cellId)
    }
    
    @objc func closeButtonTapped(){
        dismiss(animated: true)
    }
    
    
    private func setCloseButton(){
        self.view.addSubview(closeButton)
        NSLayoutConstraint.activate([
            closeButton.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 20),
            closeButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
            closeButton.widthAnchor.constraint(equalToConstant: 50),
            closeButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if mode == .fullscreen {
            return results.count
        }
        return min(4, results.count)
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! MultiplyCell
        cell.app = results[indexPath.item]
        return cell
    }
    
    init(mode: Mode){
        self.mode = mode
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}

extension MultiplyController: UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if mode == .fullscreen {
            return .init(top: 20, left: 20, bottom: 20, right: 20)
        }
        return .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height: CGFloat = 68
        if mode == .small {
            return .init(width: view.frame.width, height: height)
        }
//        let height = (view.frame.height - 16*3)/4
        return .init(width: view.frame.width - 40, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 16
    }
}
