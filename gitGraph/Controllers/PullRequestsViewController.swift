//
//  ViewController.swift
//  gitGraph
//
//  Created by Guilherme Siepmann on 21/06/2018.
//  Copyright © 2018 Guilherme Siepmann. All rights reserved.
//

import UIKit
import Apollo

class PullRequestsViewController: UIViewController {
    var pullRequestQuery: ListRepoPullRequestQuery!
    
    private var collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        flowLayout.estimatedItemSize = CGSize(width: 200, height: 100)
        flowLayout.minimumLineSpacing = 0
        flowLayout.minimumInteritemSpacing = 0
        
        return UICollectionView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height),
                                collectionViewLayout: flowLayout)
    }()
    
    fileprivate var pullRequest: [PullRequestData] = [] {
        didSet {
            collectionView.dataSource = CollectionViewDataSource<PullRequestCollectionViewCell>(data: pullRequest)
            collectionView.delegate = self
            collectionView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadRepos()
    }
    
    fileprivate func loadRepos() {
        apollo.fetch(query: pullRequestQuery) { [weak self] (result, error) in
            guard let data = result?.data?.repository?.pullRequests,
                  let nodes = data.nodes else { return }
            
            self?.pullRequest.append(contentsOf: nodes.flatMap{ $0?.fragments.pullRequestData })
       }
    }
}

extension PullRequestsViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let data = pullRequest[indexPath.row]
//        print("\(data.asRepository?.nameWithOwner ?? "")")
    }
}

