//
//  ListViewController.swift
//  InfoMountain
//
//  Created by seohyeon park on 2022/09/14.
//

import UIKit

class ListViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func didTapButton(_ sender: UIButton) {
        if sender.isSelected {
            sender.setImage(UIImage(systemName: "square"), for: .normal)
        } else {
            sender.setImage(UIImage(systemName: "checkmark.square.fill"), for: .normal)
        }
    }
    
}
