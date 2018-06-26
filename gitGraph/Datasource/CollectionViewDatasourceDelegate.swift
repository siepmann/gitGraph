//
//  CollectionViewDatasourceDelegate.swift
//  gitGraph
//
//  Created by Guilherme Siepmann on 26/06/2018.
//  Copyright © 2018 Guilherme Siepmann. All rights reserved.
//

import UIKit

class CollectionViewDataSourceDelegate<T: UICollectionViewCell & SetupCellProtocol & ConfigureCellProtocol>: NSObject, UICollectionViewDataSource {
    typealias DataType = T.DataType
    private var data: [DataType] = []
    private let selectionBlock: SelectedItem
    typealias SelectedItem = (_ selectedItem: DataType) -> ()
    
    init(data:[DataType] = [], selectedItem: @escaping SelectedItem) {
        self.selectionBlock = selectedItem
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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.selectionBlock(self.data[indexPath.row])
    }
}
