//
//  TodayController.swift
//  AppStoreClone
//
//  Created by F1xTeoNtTsS on 06.12.2021.
//

import UIKit

class TodayController: UICollectionViewController {

    private var todayListView = TodayListView()
    var todayItems = [TodayItem]()

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
        todayListView.setConstraints(view)
        todayListView.activityIndicator.startAnimating()
        fetchData()
        collectionView.backgroundColor = UIColor(white: 0.95, alpha: 1)
        collectionView.register(TodayCell.self, forCellWithReuseIdentifier: TodayItem.CellStyle.single.rawValue)
        collectionView.register(TodayMultiplyCell.self, forCellWithReuseIdentifier: TodayItem.CellStyle.multiply.rawValue)
    }
    
    private func fetchData(){
        let dispatchGroup = DispatchGroup()
        dispatchGroup.enter()
        var topFreeGames: AppsFetch?
        var topPaidGames: AppsFetch?
        
        NetworkManager.shared.fetchTopFreeApps { apps, error in
            dispatchGroup.leave()
            if let error = error {
                print("Fetching games for todayList is failed with", error.localizedDescription)
                return
            }
            if let apps = apps {
                topFreeGames = apps
            }
        }
        
        dispatchGroup.enter()
        NetworkManager.shared.fetchTopPaidApps { apps, error in
            dispatchGroup.leave()
            if let error = error {
                print("Fetching games for todayList is failed with", error.localizedDescription)
                return
            }
            if let apps = apps {
                topPaidGames = apps
            }
        }
        
        dispatchGroup.notify(queue: .main) {
            self.todayListView.activityIndicator.stopAnimating()
            self.todayItems = [
                TodayItem(category: "Daily List", title: topPaidGames?.feed.title ?? "", image: UIImage(named: "garden")!, description: "", backgroungColor: .white, cellStyle: .multiply, appsResult: topPaidGames?.feed.results ?? []),
                TodayItem(category: "LIFE HACK", title: "Utilazing your Time", image: UIImage(named: "garden")!, description: "All the tools and apps you need to intelligently organize your life in the right way.", backgroungColor: .white, cellStyle: .single, appsResult: []),
                TodayItem(category: "Daily List", title: topFreeGames?.feed.title ?? "", image: UIImage(named: "garden")!, description: "", backgroungColor: .white, cellStyle: .multiply, appsResult: topFreeGames?.feed.results ?? []),
                TodayItem(category: "HOLIDAY", title: "Travel on a Badget", image: UIImage(named: "holiday")!, description: "Find out all you need to know on how to travel without packing everything!", backgroungColor: .init(named: "yellow")!, cellStyle: .single, appsResult: [])
            ]
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return todayItems.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellId = todayItems[indexPath.item].cellStyle.rawValue
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId , for: indexPath) as! BaseTodayCell
        cell.todayItem = todayItems[indexPath.item]
        (cell as? TodayMultiplyCell)?.multiplyCellVC.collectionView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(appInCellTapped)))

        return cell
    }
    
    // доработать!
    @objc func appInCellTapped(gesture: UIGestureRecognizer){
        
        let collectionView = gesture.view
        var superview = collectionView?.superview
        
        while superview != nil {
            if let cell = superview as? TodayMultiplyCell {
                guard let indexPath = self.collectionView.indexPath(for: cell) else { return }
                showTodayListFullScreen(indexPath)
                return
            }
            superview = superview?.superview
        }
    }
    
    fileprivate func showTodayListFullScreen(_ indexPath: IndexPath) {
        let appsCellView = MultiplyController(mode: .fullscreen)
        appsCellView.apps = todayItems[indexPath.row].appsResult
        let navController = BackEnabledNavigationController(rootViewController: appsCellView)
        navController.modalPresentationStyle = .fullScreen
        self.present(navController, animated: true)
    }
    
    fileprivate func setStartPositionForCell(_ indexPath: IndexPath){
        let fullScreenView = fullViewController.view!
        self.view.addSubview(fullScreenView)
        
        self.addChild(fullViewController)
        
        collectionView.isUserInteractionEnabled = false

        guard let cell = collectionView.cellForItem(at: indexPath) else { return }
        guard let startFrame = cell.superview?.convert(cell.frame, to: nil) else { return }
        
        fullScreenView.translatesAutoresizingMaskIntoConstraints = false
        
        topConstraint = fullScreenView.topAnchor.constraint(equalTo: view.topAnchor, constant: startFrame.origin.y)
        leftConstraint = fullScreenView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: startFrame.origin.x)
        widthConstraint = fullScreenView.widthAnchor.constraint(equalToConstant: startFrame.width)
        heightConstraint = fullScreenView.heightAnchor.constraint(equalToConstant: startFrame.height)
        NSLayoutConstraint.activate([
        topConstraint!, leftConstraint!, widthConstraint!, heightConstraint!
        ])
        self.view.layoutIfNeeded()
        
        self.startFrame = startFrame
    }
    
    fileprivate func beginAnimationForCells(_ indexPath: IndexPath){
        UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: .curveEaseOut, animations: {
            self.topConstraint?.constant = 0
            self.leftConstraint?.constant = 0
            self.widthConstraint?.constant = self.view.frame.width
            self.heightConstraint?.constant = self.view.frame.height
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        if todayItems[indexPath.row].cellStyle == .multiply {
            showTodayListFullScreen(indexPath)
            return
        } else {
            self.fullViewController = TodayFullScreenView()
            fullViewController.todayItem = todayItems[indexPath.row]
            fullViewController.view.layer.cornerRadius = 16
            fullViewController.dismisFullVIew = {
                self.removeFullView()
            }
            setStartPositionForCell(indexPath)
            beginAnimationForCells(indexPath)
        }
    }
    
    @objc func removeFullView(){
        UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: .curveEaseOut, animations: {
            self.fullViewController.tableView.contentInsetAdjustmentBehavior = .never
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
        return .init(width: view.frame.width-Spacing.cellSpace, height: 500)
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
