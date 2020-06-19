//
//  ViewController.swift
//  Trainning_CollectionView
//
//  Created by 植田圭祐 on 2020/06/19.
//  Copyright © 2020 Keisuke Ueda. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let iconArray: [String] = ["graph","logo","longTail","pc","phone","receipt","tablet","wifi"]
    
    var collectionView: UICollectionView!
    var layout: UICollectionViewFlowLayout!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //レイアウト定義
        layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        
        //CollectionView定義
        collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height),
                                          collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(CollectionCell.self, forCellWithReuseIdentifier: "CollectionCell")
        
        view.addSubview(collectionView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension ViewController: UICollectionViewDataSource {
    
    //表示するセルの個数
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return iconArray.count
    }
    
    //セルに表示する内容
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionCell", for: indexPath) as! CollectionCell
        cell.backgroundColor = .blue
        cell.imageView.image = UIImage(named: iconArray[indexPath.item])
        
        
        return cell
    }
}

extension ViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        moveView(index: indexPath)
    }
    
    func moveView(index: IndexPath) {
        print(iconArray[index.item])
        let vc = ContentViewController()
        vc.iconName = iconArray[index.item]
        
        present(vc, animated: true, completion: nil)
    }
}

//Cellのサイズの設定
extension ViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: view.frame.width / 2, height: view.frame.width / 2)
    }
}
