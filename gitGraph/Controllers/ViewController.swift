//
//  ViewController.swift
//  gitGraph
//
//  Created by Guilherme Siepmann on 21/06/2018.
//  Copyright © 2018 Guilherme Siepmann. All rights reserved.
//

import UIKit
import Apollo

class ViewController: UIViewController {
    private var collectionView: UICollectionView = {
        return UICollectionView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
    }()
    
    var repositories: [Repository] = [] {
        didSet {
            collectionView.dataSource = CollectionViewDataSource<RepositoryCollectionViewCell>(data: repositories)
            collectionView.delegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadRepos()
    }
    
    fileprivate func loadRepos() {
        let query = SearchRepoByLanguageQuery(queryString: "language:java stars:>10000")
        apollo.fetch(query: query) { [weak self] (result, error) in
            guard let edges = result?.data?.search.edges else { return }
            
            self?.repositories.append(contentsOf: edges.flatMap { $0?.node?.fragments.repository })
        }
    }
}

extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let data = repositories[indexPath.row]
        print("\(data.asRepository?.nameWithOwner ?? "")")
    }
}
