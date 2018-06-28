//
//  ViewController.swift
//  gitGraph
//
//  Created by Guilherme Siepmann on 21/06/2018.
//  Copyright © 2018 Guilherme Siepmann. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    private var collectionView: UICollectionView = {
        return UICollectionView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let array: [Repository] = []
        
        self.collectionView.dataSource = CollectionViewDataSource<RepositoryCollectionViewCell>(data: array)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

