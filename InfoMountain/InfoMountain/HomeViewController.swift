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
        setupCollectionView()
    }

    func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .white
        
        flowLayout.scrollDirection = .vertical
        
        let collectionCellWidth = (UIScreen.main.bounds.width - HVCell.spacingWidth * (HVCell.cellColumns - 1)) / HVCell.cellColumns
        
        flowLayout.itemSize = CGSize(width: collectionCellWidth, height: collectionCellWidth)
        flowLayout.minimumInteritemSpacing = HVCell.spacingWidth
        flowLayout.minimumLineSpacing = HVCell.spacingWidth
        
        collectionView.collectionViewLayout = flowLayout
    }
}

extension HomeViewController: UICollectionViewDataSource {
    func collectionView( _ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 9
    }
    
    func collectionView( _ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: String(describing: HomeCollectionViewCell.self),
            for: indexPath
        ) as? HomeCollectionViewCell else {
            return UICollectionViewCell()
        }

        cell.titleLabel.text = Links().labels[indexPath.row]
        return cell
    }
}

extension HomeViewController {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let storyboard = storyboard else {
            return
        }
        
        if indexPath.row == 0 {
            guard let CautionVC = storyboard.instantiateViewController(
                withIdentifier: String(describing: CautionViewController.self)
            ) as? CautionViewController else {
                return
            }
            
            self.present(CautionVC, animated: true)
            return
        }
        
        if indexPath.row == 1 {
            guard let materialsVC = storyboard.instantiateViewController(
                withIdentifier: String(describing: MaterialsViewController.self)
            ) as? MaterialsViewController else {
                return
            }
            
            self.present(materialsVC, animated: true)
            return
        }
        
        if (3...5).contains(indexPath.row) {
            guard let recommendationVC = storyboard.instantiateViewController(
                withIdentifier: String(describing: RecommendationViewController.self)
            ) as? RecommendationViewController else {
                return
            }
            
            self.present(recommendationVC, animated: true)
            return
        }
        
        guard let url = NSURL(string: Links().linkDatas[indexPath.row]) else { return }
        let blogSafariView: SFSafariViewController = SFSafariViewController(url: url as URL)
        blogSafariView.modalPresentationStyle = .pageSheet
        
        self.present(blogSafariView, animated: true, completion: nil)
    }
}

