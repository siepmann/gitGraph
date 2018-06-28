//
//  APIRequests.swift
//  gitGraph
//
//  Created by Guilherme Siepmann on 28/06/2018.
//  Copyright © 2018 Guilherme Siepmann. All rights reserved.
//

import Foundation
import Apollo

class APIRequests {

    
    func listRepos(language: String) -> [Repository]? {
        apollo.fetch(query: SearchRepoByLanguageQuery(queryString: "language:\(language) stars:>10000")) { (result, error) in
            guard let data = result?.data else { return }
            
//            return data.search.edges?.flatMap({
//                $0?.node?.fragments.repository
//            })
            
            
        }
        return nil
    }
    
//    func doPRRequest(repoOwner: String, repoName: String) {
//        apollo.fetch(query: ListRepoPullRequestQuery(repoOwner: repoOwner, repoName: repoName)) { (result, error) in
//            guard let data = result?.data else { return }
//            
//            data.repository?.pullRequests.nodes?.forEach({ PR in
//                guard let pr = PR else { return }
//            })
//        }
//    }
}
