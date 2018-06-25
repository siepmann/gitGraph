//
//  AppDelegate.swift
//  gitGraph
//
//  Created by Guilherme Siepmann on 21/06/2018.
//  Copyright © 2018 Guilherme Siepmann. All rights reserved.
//

import UIKit
import Apollo

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    let apollo: ApolloClient = {
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = ["Authorization": "Bearer bba254b71b6b9afa245b94de1141a774739dca1e"]
        
        let url = URL(string: "https://api.github.com/graphql")!
        
        return ApolloClient(networkTransport: HTTPNetworkTransport(url: url, configuration: configuration))
    }()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        var owner = ""
        var repoName = ""
        apollo.fetch(query: SearchRepoByLanguageQuery(queryString: "language:java stars:>10000")) { (result, error) in
            guard let data = result?.data else { return }
            
            data.search.edges?.forEach({ edge in
                if owner.isEmpty {
                    owner = (edge?.node?.asRepository?.owner.login)!
                }
                if repoName.isEmpty {
                    repoName = (edge?.node?.asRepository?.name)!
                }
                
                print("Repo name: " + (edge?.node?.asRepository?.name)!)
                print("Repo Owner: " + (edge?.node?.asRepository?.owner.login)!)
                print("Repo Stars: \(edge?.node?.asRepository?.stargazers.totalCount ?? 0)")
                print("#####")
            })
            
            self.doPRRequest(repoOwner: owner, repoName: repoName)
        }
        return true
    }
    
    func doPRRequest(repoOwner: String, repoName: String) {
        apollo.fetch(query: ListRepoPullRequestQuery(repoOwner: repoOwner, repoName: repoName)) { (result, error) in
            guard let data = result?.data else { return }
            
            data.repository?.pullRequests.nodes?.forEach({ PR in
                guard let pr = PR else { return }
                
                print("REPOSITORY NAME - \(repoName) | OWNER - \(repoOwner)")
                print("")
                print("\(pr.title)")
                print("")
                print("\(pr.author?.login ?? "")")
                print("")
                print("\(pr.body)")
                print("")
                print("")
                print("")
            })
        }
    }
}

