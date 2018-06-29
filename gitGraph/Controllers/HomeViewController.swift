//
//  ViewController.swift
//  gitGraph
//
//  Created by Guilherme Siepmann on 21/06/2018.
//  Copyright © 2018 Guilherme Siepmann. All rights reserved.
//

import UIKit
import Apollo

class HomeViewController: UIViewController {
    private var collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        flowLayout.estimatedItemSize = CGSize(width: 200, height: 100)
        flowLayout.minimumLineSpacing = 0
        flowLayout.minimumInteritemSpacing = 0
        
        return UICollectionView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height),
                                collectionViewLayout: flowLayout)
    }()
    
    var repositories: [Repository] = [] {
        didSet {
            let dataSource = CollectionViewDataSource<RepositoryCollectionViewCell>(data: self.repositories)
            collectionView.dataSource = dataSource
            collectionView.delegate = self
            collectionView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(RepositoryCollectionViewCell.self, forCellWithReuseIdentifier: RepositoryCollectionViewCell.cellIdentifier)
        self.view.addSubview(collectionView)
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

extension HomeViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let data = repositories[indexPath.row].asRepository else { return }
        let vc = PullRequestsViewController()
        vc.pullRequestQuery = ListRepoPullRequestQuery(repoOwner: data.owner.login, repoName: data.name)
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
