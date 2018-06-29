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
        return UICollectionView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
    }()
    
    fileprivate var pullRequest: [PullRequests] = [] {
        didSet {
            collectionView.dataSource = CollectionViewDataSource<PullRequestCollectionViewCell>(data: pullRequest)
            collectionView.delegate = self
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
            
            self?.pullRequest.append(contentsOf: nodes.flatMap{ $0?.fragments.pullRequests })
       }
    }
}

extension PullRequestsViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let data = pullRequest[indexPath.row]
//        print("\(data.asRepository?.nameWithOwner ?? "")")
    }
}

