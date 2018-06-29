//
//  CollectionViewDatasourceDelegate.swift
//  gitGraph
//
//  Created by Guilherme Siepmann on 26/06/2018.
//  Copyright © 2018 Guilherme Siepmann. All rights reserved.
//

import UIKit

class CollectionViewDataSource<T: UICollectionViewCell & SetupCellProtocol & ConfigureCellProtocol>: NSObject, UICollectionViewDataSource {
    typealias DataType = T.DataType
    private var data: [DataType] = []
    
    override init() { }
    
    init(data:[DataType] = []) {
        self.data = data
    }
    
    func setDataSource(data: [DataType]) {
        self.data = data
    }
      
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: T.cellIdentifier, for: indexPath) as! T
        cell.setupCell(data: self.data[indexPath.row])
        return cell
    }
}
