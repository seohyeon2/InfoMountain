//
//  MaterialsViewController.swift
//  InfoMountain
//
//  Created by hyeon2, kyo on 2022/09/19.
//

import UIKit

class MaterialsViewController: UIViewController {
    
    
    @IBAction func didTapCheckButton(_ sender: UIButton) {
        if sender.imageView?.image == UIImage(systemName: Image.square) {
            sender.setImage(UIImage(systemName: Image.checkmark), for: .normal)
            return
        }
        
        sender.setImage(UIImage(systemName: Image.square), for: .normal)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
}
