//
//  HomeViewController.swift
//  InfoMountain
//
//  Created by hyeon2, kyo on 2022/09/14.
//

import UIKit
import SafariServices

class HomeViewController: UIViewController, UICollectionViewDelegate {

    @IBOutlet weak var collectionView: UICollectionView!
    
    let flowLayout = UICollectionViewFlowLayout()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavi()
        setupCollectionView()
    }
    
    func setupNavi() {
        self.title = "InfoMountain"
    }
    
    func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .white
        
        flowLayout.scrollDirection = .vertical
        
        let collectionCellWidth = (UIScreen.main.bounds.width - CVCell.spacingWidth * (CVCell.cellColumns - 1)) / CVCell.cellColumns
        
        flowLayout.itemSize = CGSize(width: collectionCellWidth, height: collectionCellWidth)
        flowLayout.minimumInteritemSpacing = CVCell.spacingWidth
        flowLayout.minimumLineSpacing = CVCell.spacingWidth
        
        collectionView.collectionViewLayout = flowLayout
    }
}

extension HomeViewController: UICollectionViewDataSource {
    func collectionView( _ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 9
    }
    
    func collectionView( _ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCollectionViewCell", for: indexPath) as? HomeCollectionViewCell else { return UICollectionViewCell() }
        cell.titleLabel.text = Links().labels[indexPath.row]
        return cell
    }
}

extension HomeViewController {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let url = NSURL(string: Links().linkDatas[indexPath.row]) else { return }
        let blogSafariView: SFSafariViewController = SFSafariViewController(url: url as URL)
        blogSafariView.modalPresentationStyle = .pageSheet
        
        self.present(blogSafariView, animated: true, completion: nil)
    }
}

