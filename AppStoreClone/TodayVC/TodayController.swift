//
//  TodayController.swift
//  AppStoreClone
//
//  Created by F1xTeoNtTsS on 06.12.2021.
//

import UIKit

class TodayController: UICollectionViewController {

    
    var todayItems = [
        TodayItem(category: "LIFE HACK", title: "Utilazing your Time", image: UIImage(named: "garden")!, description: "All the tools and apps you need to intelligently organize your life in the right way.", backgroungColor: .white),
        TodayItem(category: "HOLIDAY", title: "Travel on a Badget", image: UIImage(named: "holiday")!, description: "Find out all you need to know on how to travel without packing everything!", backgroungColor: .init(named: "yellow")!)
    ]
    
    private let todayCellId = "todayCellId"
    private var startFrame: CGRect?
    private var fullViewController: TodayFullScreenView!
    private var topConstraint: NSLayoutConstraint?
    private var leftConstraint: NSLayoutConstraint?
    private var widthConstraint: NSLayoutConstraint?
    private var heightConstraint: NSLayoutConstraint?

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        collectionView.backgroundColor = UIColor(white: 0.95, alpha: 1)
        collectionView.register(TodayCell.self, forCellWithReuseIdentifier: todayCellId)
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return todayItems.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: todayCellId, for: indexPath) as! TodayCell
        cell.todayItem = todayItems[indexPath.row]
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.isUserInteractionEnabled = false
        self.fullViewController = TodayFullScreenView()
        fullViewController.todayItem = todayItems[indexPath.row]

        fullViewController.dismisFullVIew = {
            self.removeFullView()
        }
        let fullScreenView = fullViewController.view!
        view.addSubview(fullScreenView)
        addChild(fullViewController)
        fullScreenView.translatesAutoresizingMaskIntoConstraints = false
        guard let cell = collectionView.cellForItem(at: indexPath) else { return }
        guard let startFrame = cell.superview?.convert(cell.frame, to: nil) else { return }
        
        topConstraint = fullScreenView.topAnchor.constraint(equalTo: view.topAnchor, constant: startFrame.origin.y)
        leftConstraint = fullScreenView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: startFrame.origin.x)
        widthConstraint = fullScreenView.widthAnchor.constraint(equalToConstant: startFrame.width)
        heightConstraint = fullScreenView.heightAnchor.constraint(equalToConstant: startFrame.height)
        NSLayoutConstraint.activate([
        topConstraint!, leftConstraint!, widthConstraint!, heightConstraint!
        ])
        self.view.layoutIfNeeded()
        
        self.startFrame = startFrame
        fullScreenView.layer.cornerRadius = 16
        UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: .curveEaseOut, animations: {
            self.topConstraint?.constant = 0
            self.leftConstraint?.constant = 0
            self.widthConstraint?.constant = self.view.frame.width
            self.heightConstraint?.constant = self.view.frame.height
            self.view.layoutIfNeeded()
        }, completion: nil)
        
    }
    
    @objc func removeFullView(){
        UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: .curveEaseOut, animations: {
            self.fullViewController.tableView.scrollRectToVisible(.zero, animated: true)
            guard let startFrame = self.startFrame else { return }
            self.topConstraint?.constant = startFrame.origin.y
            self.leftConstraint?.constant = startFrame.origin.x
            self.widthConstraint?.constant = startFrame.width
            self.heightConstraint?.constant = startFrame.height
            
            self.view.layoutIfNeeded()
            
        }) { _ in
            self.fullViewController.view?.removeFromSuperview()
            self.fullViewController.removeFromParent()
            self.collectionView.isUserInteractionEnabled = true
        }
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
