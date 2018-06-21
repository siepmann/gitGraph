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
        configuration.httpAdditionalHeaders = ["Authorization": "Bearer daddcd3586a16de4f5f2bbeefb6a2dab8e86c4b4"]
        
        let url = URL(string: "https://api.github.com/graphql")!
        
        return ApolloClient(networkTransport: HTTPNetworkTransport(url: url, configuration: configuration))
    }()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        apollo.fetch(query: SearchJavaQuery(queryString: "language:java stars:>10000")) { (result, error) in
            guard let data = result?.data else { return }
            
            data.search.edges?.forEach({ edge in
                print("Repo name: " + (edge?.node?.asRepository?.name)!)
                print("Repo Owner: " + (edge?.node?.asRepository?.owner.login)!)
                print("Repo Stars: \(edge?.node?.asRepository?.stargazers.totalCount ?? 0)")
                print("#####")
            })
        }
        
        return true
    }
}

