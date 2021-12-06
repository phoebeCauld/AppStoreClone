//
//  TodayController.swift
//  AppStoreClone
//
//  Created by F1xTeoNtTsS on 06.12.2021.
//

import UIKit

class TodayController: UICollectionViewController {

    private let todayCellId = "todayCellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        collectionView.backgroundColor = UIColor(white: 0.95, alpha: 1)
        collectionView.register(TodayCell.self, forCellWithReuseIdentifier: todayCellId)
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: todayCellId, for: indexPath) as! TodayCell

        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("select: \(indexPath.item)")
    }

    init(){
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    required init?(coder: NSCoder) {
        fatalError()
    }
}


extension TodayController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width-Spacing.cellSpace, height: 450)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return Spacing.cellSpace/2
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: Spacing.cellSpace/2, left: 0, bottom: Spacing.cellSpace/2, right: 0)
    }
}

fileprivate struct Spacing{
    static let cellSpace: CGFloat = 64
}
