//
//  ContentsViewController.swift
//  Trainning_CollectionView
//
//  Created by 植田圭祐 on 2020/06/20.
//  Copyright © 2020 Keisuke Ueda. All rights reserved.
//

import Foundation
import UIKit

class ContentViewController: UIViewController {
    
    var iconView: UIImageView!
    var iconName: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        iconView = UIImageView()
        iconView.frame = CGRect(x: 0, y: 0, width: view.frame.width / 2, height: view.frame.width / 2)
        iconView.image = UIImage(named: iconName)
        view.addSubview(iconView)
        
        let returnButton = UIButton()
        returnButton.frame.size = CGSize(width: 50, height: 50)
        returnButton.center = view.center
        returnButton.backgroundColor = .blue
        returnButton.addTarget(self, action: #selector(returnView), for: .touchUpInside)
        view.addSubview(returnButton)
    }
    
    @objc func returnView() {
        dismiss(animated: true, completion: nil)
    }
}
