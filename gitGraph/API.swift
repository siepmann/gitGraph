//  This file was automatically generated and should not be edited.

import Apollo

public final class ListRepoPullRequestQuery: GraphQLQuery {
  public static let operationString =
    "query listRepoPullRequest($repoOwner: String!, $repoName: String!, $id: String) {\n  repository(owner: $repoOwner, name: $repoName) {\n    __typename\n    pullRequests(states: [OPEN], first: 10, after: $id, orderBy: {field: CREATED_AT, direction: DESC}) {\n      __typename\n      totalCount\n      pageInfo {\n        __typename\n        endCursor\n        startCursor\n      }\n      nodes {\n        __typename\n        title\n        body\n        author {\n          __typename\n          login\n          avatarUrl\n        }\n      }\n    }\n  }\n}"

  public var repoOwner: String
  public var repoName: String
  public var id: String?

  public init(repoOwner: String, repoName: String, id: String? = nil) {
    self.repoOwner = repoOwner
    self.repoName = repoName
    self.id = id
  }

  public var variables: GraphQLMap? {
    return ["repoOwner": repoOwner, "repoName": repoName, "id": id]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("repository", arguments: ["owner": GraphQLVariable("repoOwner"), "name": GraphQLVariable("repoName")], type: .object(Repository.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(repository: Repository? = nil) {
      self.init(snapshot: ["__typename": "Query", "repository": repository.flatMap { (value: Repository) -> Snapshot in value.snapshot }])
    }

    /// Lookup a given repository by the owner and repository name.
    public var repository: Repository? {
      get {
        return (snapshot["repository"] as? Snapshot).flatMap { Repository(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "repository")
      }
    }

    public struct Repository: GraphQLSelectionSet {
      public static let possibleTypes = ["Repository"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("pullRequests", arguments: ["states": ["OPEN"], "first": 10, "after": GraphQLVariable("id"), "orderBy": ["field": "CREATED_AT", "direction": "DESC"]], type: .nonNull(.object(PullRequest.selections))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(pullRequests: PullRequest) {
        self.init(snapshot: ["__typename": "Repository", "pullRequests": pullRequests.snapshot])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      /// A list of pull requests that have been opened in the repository.
      public var pullRequests: PullRequest {
        get {
          return PullRequest(snapshot: snapshot["pullRequests"]! as! Snapshot)
        }
        set {
          snapshot.updateValue(newValue.snapshot, forKey: "pullRequests")
        }
      }

      public struct PullRequest: GraphQLSelectionSet {
        public static let possibleTypes = ["PullRequestConnection"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("totalCount", type: .nonNull(.scalar(Int.self))),
          GraphQLField("pageInfo", type: .nonNull(.object(PageInfo.selections))),
          GraphQLField("nodes", type: .list(.object(Node.selections))),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(totalCount: Int, pageInfo: PageInfo, nodes: [Node?]? = nil) {
          self.init(snapshot: ["__typename": "PullRequestConnection", "totalCount": totalCount, "pageInfo": pageInfo.snapshot, "nodes": nodes.flatMap { (value: [Node?]) -> [Snapshot?] in value.map { (value: Node?) -> Snapshot? in value.flatMap { (value: Node) -> Snapshot in value.snapshot } } }])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        /// Identifies the total count of items in the connection.
        public var totalCount: Int {
          get {
            return snapshot["totalCount"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "totalCount")
          }
        }

        /// Information to aid in pagination.
        public var pageInfo: PageInfo {
          get {
            return PageInfo(snapshot: snapshot["pageInfo"]! as! Snapshot)
          }
          set {
            snapshot.updateValue(newValue.snapshot, forKey: "pageInfo")
          }
        }

        /// A list of nodes.
        public var nodes: [Node?]? {
          get {
            return (snapshot["nodes"] as? [Snapshot?]).flatMap { (value: [Snapshot?]) -> [Node?] in value.map { (value: Snapshot?) -> Node? in value.flatMap { (value: Snapshot) -> Node in Node(snapshot: value) } } }
          }
          set {
            snapshot.updateValue(newValue.flatMap { (value: [Node?]) -> [Snapshot?] in value.map { (value: Node?) -> Snapshot? in value.flatMap { (value: Node) -> Snapshot in value.snapshot } } }, forKey: "nodes")
          }
        }

        public struct PageInfo: GraphQLSelectionSet {
          public static let possibleTypes = ["PageInfo"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("endCursor", type: .scalar(String.self)),
            GraphQLField("startCursor", type: .scalar(String.self)),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(endCursor: String? = nil, startCursor: String? = nil) {
            self.init(snapshot: ["__typename": "PageInfo", "endCursor": endCursor, "startCursor": startCursor])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          /// When paginating forwards, the cursor to continue.
          public var endCursor: String? {
            get {
              return snapshot["endCursor"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "endCursor")
            }
          }

          /// When paginating backwards, the cursor to continue.
          public var startCursor: String? {
            get {
              return snapshot["startCursor"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "startCursor")
            }
          }
        }

        public struct Node: GraphQLSelectionSet {
          public static let possibleTypes = ["PullRequest"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("title", type: .nonNull(.scalar(String.self))),
            GraphQLField("body", type: .nonNull(.scalar(String.self))),
            GraphQLField("author", type: .object(Author.selections)),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(title: String, body: String, author: Author? = nil) {
            self.init(snapshot: ["__typename": "PullRequest", "title": title, "body": body, "author": author.flatMap { (value: Author) -> Snapshot in value.snapshot }])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          /// Identifies the pull request title.
          public var title: String {
            get {
              return snapshot["title"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "title")
            }
          }

          /// The body as Markdown.
          public var body: String {
            get {
              return snapshot["body"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "body")
            }
          }

          /// The actor who authored the comment.
          public var author: Author? {
            get {
              return (snapshot["author"] as? Snapshot).flatMap { Author(snapshot: $0) }
            }
            set {
              snapshot.updateValue(newValue?.snapshot, forKey: "author")
            }
          }

          public struct Author: GraphQLSelectionSet {
            public static let possibleTypes = ["Organization", "User", "Bot"]

            public static let selections: [GraphQLSelection] = [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("login", type: .nonNull(.scalar(String.self))),
              GraphQLField("avatarUrl", type: .nonNull(.scalar(String.self))),
            ]

            public var snapshot: Snapshot

            public init(snapshot: Snapshot) {
              self.snapshot = snapshot
            }

            public static func makeOrganization(login: String, avatarUrl: String) -> Author {
              return Author(snapshot: ["__typename": "Organization", "login": login, "avatarUrl": avatarUrl])
            }

            public static func makeUser(login: String, avatarUrl: String) -> Author {
              return Author(snapshot: ["__typename": "User", "login": login, "avatarUrl": avatarUrl])
            }

            public static func makeBot(login: String, avatarUrl: String) -> Author {
              return Author(snapshot: ["__typename": "Bot", "login": login, "avatarUrl": avatarUrl])
            }

            public var __typename: String {
              get {
                return snapshot["__typename"]! as! String
              }
              set {
                snapshot.updateValue(newValue, forKey: "__typename")
              }
            }

            /// The username of the actor.
            public var login: String {
              get {
                return snapshot["login"]! as! String
              }
              set {
                snapshot.updateValue(newValue, forKey: "login")
              }
            }

            /// A URL pointing to the actor's public avatar.
            public var avatarUrl: String {
              get {
                return snapshot["avatarUrl"]! as! String
              }
              set {
                snapshot.updateValue(newValue, forKey: "avatarUrl")
              }
            }
          }
        }
      }
    }
  }
}

public final class SearchRepoByLanguageQuery: GraphQLQuery {
  public static let operationString =
    "query searchRepoByLanguage($queryString: String!, $cursor: String) {\n  search(query: $queryString, type: REPOSITORY, first: 10, after: $cursor) {\n    __typename\n    repositoryCount\n    edges {\n      __typename\n      cursor\n      node {\n        __typename\n        ...repository\n      }\n    }\n  }\n}"

  public static var requestString: String { return operationString.appending(Repository.fragmentString).appending(Owner.fragmentString) }

  public var queryString: String
  public var cursor: String?

  public init(queryString: String, cursor: String? = nil) {
    self.queryString = queryString
    self.cursor = cursor
  }

  public var variables: GraphQLMap? {
    return ["queryString": queryString, "cursor": cursor]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("search", arguments: ["query": GraphQLVariable("queryString"), "type": "REPOSITORY", "first": 10, "after": GraphQLVariable("cursor")], type: .nonNull(.object(Search.selections))),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(search: Search) {
      self.init(snapshot: ["__typename": "Query", "search": search.snapshot])
    }

    /// Perform a search across resources.
    public var search: Search {
      get {
        return Search(snapshot: snapshot["search"]! as! Snapshot)
      }
      set {
        snapshot.updateValue(newValue.snapshot, forKey: "search")
      }
    }

    public struct Search: GraphQLSelectionSet {
      public static let possibleTypes = ["SearchResultItemConnection"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("repositoryCount", type: .nonNull(.scalar(Int.self))),
        GraphQLField("edges", type: .list(.object(Edge.selections))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(repositoryCount: Int, edges: [Edge?]? = nil) {
        self.init(snapshot: ["__typename": "SearchResultItemConnection", "repositoryCount": repositoryCount, "edges": edges.flatMap { (value: [Edge?]) -> [Snapshot?] in value.map { (value: Edge?) -> Snapshot? in value.flatMap { (value: Edge) -> Snapshot in value.snapshot } } }])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      /// The number of repositories that matched the search query.
      public var repositoryCount: Int {
        get {
          return snapshot["repositoryCount"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "repositoryCount")
        }
      }

      /// A list of edges.
      public var edges: [Edge?]? {
        get {
          return (snapshot["edges"] as? [Snapshot?]).flatMap { (value: [Snapshot?]) -> [Edge?] in value.map { (value: Snapshot?) -> Edge? in value.flatMap { (value: Snapshot) -> Edge in Edge(snapshot: value) } } }
        }
        set {
          snapshot.updateValue(newValue.flatMap { (value: [Edge?]) -> [Snapshot?] in value.map { (value: Edge?) -> Snapshot? in value.flatMap { (value: Edge) -> Snapshot in value.snapshot } } }, forKey: "edges")
        }
      }

      public struct Edge: GraphQLSelectionSet {
        public static let possibleTypes = ["SearchResultItemEdge"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("cursor", type: .nonNull(.scalar(String.self))),
          GraphQLField("node", type: .object(Node.selections)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(cursor: String, node: Node? = nil) {
          self.init(snapshot: ["__typename": "SearchResultItemEdge", "cursor": cursor, "node": node.flatMap { (value: Node) -> Snapshot in value.snapshot }])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        /// A cursor for use in pagination.
        public var cursor: String {
          get {
            return snapshot["cursor"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "cursor")
          }
        }

        /// The item at the end of the edge.
        public var node: Node? {
          get {
            return (snapshot["node"] as? Snapshot).flatMap { Node(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue?.snapshot, forKey: "node")
          }
        }

        public struct Node: GraphQLSelectionSet {
          public static let possibleTypes = ["Issue", "PullRequest", "Repository", "User", "Organization", "MarketplaceListing"]

          public static let selections: [GraphQLSelection] = [
            GraphQLTypeCase(
              variants: ["Repository": AsRepository.selections],
              default: [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              ]
            )
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public static func makeIssue() -> Node {
            return Node(snapshot: ["__typename": "Issue"])
          }

          public static func makePullRequest() -> Node {
            return Node(snapshot: ["__typename": "PullRequest"])
          }

          public static func makeUser() -> Node {
            return Node(snapshot: ["__typename": "User"])
          }

          public static func makeOrganization() -> Node {
            return Node(snapshot: ["__typename": "Organization"])
          }

          public static func makeMarketplaceListing() -> Node {
            return Node(snapshot: ["__typename": "MarketplaceListing"])
          }

          public static func makeRepository(name: String, nameWithOwner: String, owner: AsRepository.Owner, descriptionHtml: String, stargazers: AsRepository.Stargazer, forks: AsRepository.Fork, updatedAt: String) -> Node {
            return Node(snapshot: ["__typename": "Repository", "name": name, "nameWithOwner": nameWithOwner, "owner": owner.snapshot, "descriptionHTML": descriptionHtml, "stargazers": stargazers.snapshot, "forks": forks.snapshot, "updatedAt": updatedAt])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          public var fragments: Fragments {
            get {
              return Fragments(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }

          public struct Fragments {
            public var snapshot: Snapshot

            public var repository: Repository {
              get {
                return Repository(snapshot: snapshot)
              }
              set {
                snapshot += newValue.snapshot
              }
            }
          }

          public var asRepository: AsRepository? {
            get {
              if !AsRepository.possibleTypes.contains(__typename) { return nil }
              return AsRepository(snapshot: snapshot)
            }
            set {
              guard let newValue = newValue else { return }
              snapshot = newValue.snapshot
            }
          }

          public struct AsRepository: GraphQLSelectionSet {
            public static let possibleTypes = ["Repository"]

            public static let selections: [GraphQLSelection] = [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("name", type: .nonNull(.scalar(String.self))),
              GraphQLField("nameWithOwner", type: .nonNull(.scalar(String.self))),
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("owner", type: .nonNull(.object(Owner.selections))),
              GraphQLField("descriptionHTML", type: .nonNull(.scalar(String.self))),
              GraphQLField("stargazers", type: .nonNull(.object(Stargazer.selections))),
              GraphQLField("forks", type: .nonNull(.object(Fork.selections))),
              GraphQLField("updatedAt", type: .nonNull(.scalar(String.self))),
            ]

            public var snapshot: Snapshot

            public init(snapshot: Snapshot) {
              self.snapshot = snapshot
            }

            public init(name: String, nameWithOwner: String, owner: Owner, descriptionHtml: String, stargazers: Stargazer, forks: Fork, updatedAt: String) {
              self.init(snapshot: ["__typename": "Repository", "name": name, "nameWithOwner": nameWithOwner, "owner": owner.snapshot, "descriptionHTML": descriptionHtml, "stargazers": stargazers.snapshot, "forks": forks.snapshot, "updatedAt": updatedAt])
            }

            public var __typename: String {
              get {
                return snapshot["__typename"]! as! String
              }
              set {
                snapshot.updateValue(newValue, forKey: "__typename")
              }
            }

            /// The name of the repository.
            public var name: String {
              get {
                return snapshot["name"]! as! String
              }
              set {
                snapshot.updateValue(newValue, forKey: "name")
              }
            }

            /// The repository's name with owner.
            public var nameWithOwner: String {
              get {
                return snapshot["nameWithOwner"]! as! String
              }
              set {
                snapshot.updateValue(newValue, forKey: "nameWithOwner")
              }
            }

            /// The User owner of the repository.
            public var owner: Owner {
              get {
                return Owner(snapshot: snapshot["owner"]! as! Snapshot)
              }
              set {
                snapshot.updateValue(newValue.snapshot, forKey: "owner")
              }
            }

            /// The description of the repository rendered to HTML.
            public var descriptionHtml: String {
              get {
                return snapshot["descriptionHTML"]! as! String
              }
              set {
                snapshot.updateValue(newValue, forKey: "descriptionHTML")
              }
            }

            /// A list of users who have starred this starrable.
            public var stargazers: Stargazer {
              get {
                return Stargazer(snapshot: snapshot["stargazers"]! as! Snapshot)
              }
              set {
                snapshot.updateValue(newValue.snapshot, forKey: "stargazers")
              }
            }

            /// A list of direct forked repositories.
            public var forks: Fork {
              get {
                return Fork(snapshot: snapshot["forks"]! as! Snapshot)
              }
              set {
                snapshot.updateValue(newValue.snapshot, forKey: "forks")
              }
            }

            /// Identifies the date and time when the object was last updated.
            public var updatedAt: String {
              get {
                return snapshot["updatedAt"]! as! String
              }
              set {
                snapshot.updateValue(newValue, forKey: "updatedAt")
              }
            }

            public var fragments: Fragments {
              get {
                return Fragments(snapshot: snapshot)
              }
              set {
                snapshot += newValue.snapshot
              }
            }

            public struct Fragments {
              public var snapshot: Snapshot

              public var repository: Repository {
                get {
                  return Repository(snapshot: snapshot)
                }
                set {
                  snapshot += newValue.snapshot
                }
              }

              public var owner: Owner {
                get {
                  return Owner(snapshot: snapshot)
                }
                set {
                  snapshot += newValue.snapshot
                }
              }
            }

            public struct Owner: GraphQLSelectionSet {
              public static let possibleTypes = ["Organization", "User"]

              public static let selections: [GraphQLSelection] = [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
                GraphQLField("login", type: .nonNull(.scalar(String.self))),
                GraphQLField("avatarUrl", type: .nonNull(.scalar(String.self))),
              ]

              public var snapshot: Snapshot

              public init(snapshot: Snapshot) {
                self.snapshot = snapshot
              }

              public static func makeOrganization(id: GraphQLID, login: String, avatarUrl: String) -> Owner {
                return Owner(snapshot: ["__typename": "Organization", "id": id, "login": login, "avatarUrl": avatarUrl])
              }

              public static func makeUser(id: GraphQLID, login: String, avatarUrl: String) -> Owner {
                return Owner(snapshot: ["__typename": "User", "id": id, "login": login, "avatarUrl": avatarUrl])
              }

              public var __typename: String {
                get {
                  return snapshot["__typename"]! as! String
                }
                set {
                  snapshot.updateValue(newValue, forKey: "__typename")
                }
              }

              public var id: GraphQLID {
                get {
                  return snapshot["id"]! as! GraphQLID
                }
                set {
                  snapshot.updateValue(newValue, forKey: "id")
                }
              }

              /// The username used to login.
              public var login: String {
                get {
                  return snapshot["login"]! as! String
                }
                set {
                  snapshot.updateValue(newValue, forKey: "login")
                }
              }

              /// A URL pointing to the owner's public avatar.
              public var avatarUrl: String {
                get {
                  return snapshot["avatarUrl"]! as! String
                }
                set {
                  snapshot.updateValue(newValue, forKey: "avatarUrl")
                }
              }
            }

            public struct Stargazer: GraphQLSelectionSet {
              public static let possibleTypes = ["StargazerConnection"]

              public static let selections: [GraphQLSelection] = [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("totalCount", type: .nonNull(.scalar(Int.self))),
              ]

              public var snapshot: Snapshot

              public init(snapshot: Snapshot) {
                self.snapshot = snapshot
              }

              public init(totalCount: Int) {
                self.init(snapshot: ["__typename": "StargazerConnection", "totalCount": totalCount])
              }

              public var __typename: String {
                get {
                  return snapshot["__typename"]! as! String
                }
                set {
                  snapshot.updateValue(newValue, forKey: "__typename")
                }
              }

              /// Identifies the total count of items in the connection.
              public var totalCount: Int {
                get {
                  return snapshot["totalCount"]! as! Int
                }
                set {
                  snapshot.updateValue(newValue, forKey: "totalCount")
                }
              }
            }

            public struct Fork: GraphQLSelectionSet {
              public static let possibleTypes = ["RepositoryConnection"]

              public static let selections: [GraphQLSelection] = [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("totalCount", type: .nonNull(.scalar(Int.self))),
              ]

              public var snapshot: Snapshot

              public init(snapshot: Snapshot) {
                self.snapshot = snapshot
              }

              public init(totalCount: Int) {
                self.init(snapshot: ["__typename": "RepositoryConnection", "totalCount": totalCount])
              }

              public var __typename: String {
                get {
                  return snapshot["__typename"]! as! String
                }
                set {
                  snapshot.updateValue(newValue, forKey: "__typename")
                }
              }

              /// Identifies the total count of items in the connection.
              public var totalCount: Int {
                get {
                  return snapshot["totalCount"]! as! Int
                }
                set {
                  snapshot.updateValue(newValue, forKey: "totalCount")
                }
              }
            }
          }
        }
      }
    }
  }
}

public struct Owner: GraphQLFragment {
  public static let fragmentString =
    "fragment owner on Repository {\n  __typename\n  owner {\n    __typename\n    id\n    login\n    avatarUrl\n  }\n}"

  public static let possibleTypes = ["Repository"]

  public static let selections: [GraphQLSelection] = [
    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
    GraphQLField("owner", type: .nonNull(.object(Owner.selections))),
  ]

  public var snapshot: Snapshot

  public init(snapshot: Snapshot) {
    self.snapshot = snapshot
  }

  public init(owner: Owner) {
    self.init(snapshot: ["__typename": "Repository", "owner": owner.snapshot])
  }

  public var __typename: String {
    get {
      return snapshot["__typename"]! as! String
    }
    set {
      snapshot.updateValue(newValue, forKey: "__typename")
    }
  }

  /// The User owner of the repository.
  public var owner: Owner {
    get {
      return Owner(snapshot: snapshot["owner"]! as! Snapshot)
    }
    set {
      snapshot.updateValue(newValue.snapshot, forKey: "owner")
    }
  }

  public struct Owner: GraphQLSelectionSet {
    public static let possibleTypes = ["Organization", "User"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
      GraphQLField("login", type: .nonNull(.scalar(String.self))),
      GraphQLField("avatarUrl", type: .nonNull(.scalar(String.self))),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public static func makeOrganization(id: GraphQLID, login: String, avatarUrl: String) -> Owner {
      return Owner(snapshot: ["__typename": "Organization", "id": id, "login": login, "avatarUrl": avatarUrl])
    }

    public static func makeUser(id: GraphQLID, login: String, avatarUrl: String) -> Owner {
      return Owner(snapshot: ["__typename": "User", "id": id, "login": login, "avatarUrl": avatarUrl])
    }

    public var __typename: String {
      get {
        return snapshot["__typename"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "__typename")
      }
    }

    public var id: GraphQLID {
      get {
        return snapshot["id"]! as! GraphQLID
      }
      set {
        snapshot.updateValue(newValue, forKey: "id")
      }
    }

    /// The username used to login.
    public var login: String {
      get {
        return snapshot["login"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "login")
      }
    }

    /// A URL pointing to the owner's public avatar.
    public var avatarUrl: String {
      get {
        return snapshot["avatarUrl"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "avatarUrl")
      }
    }
  }
}

public struct Repository: GraphQLFragment {
  public static let fragmentString =
    "fragment repository on Node {\n  __typename\n  ... on Repository {\n    name\n    nameWithOwner\n    ...owner\n    descriptionHTML\n    stargazers {\n      __typename\n      totalCount\n    }\n    forks {\n      __typename\n      totalCount\n    }\n    updatedAt\n  }\n}"

  public static let possibleTypes = ["License", "MarketplaceCategory", "MarketplaceListing", "Organization", "Project", "ProjectColumn", "ProjectCard", "Issue", "User", "Repository", "CommitComment", "UserContentEdit", "Reaction", "Commit", "Status", "StatusContext", "Tree", "Ref", "PullRequest", "Label", "IssueComment", "PullRequestCommit", "Milestone", "ReviewRequest", "Team", "OrganizationInvitation", "PullRequestReview", "PullRequestReviewComment", "CommitCommentThread", "PullRequestReviewThread", "ClosedEvent", "ReopenedEvent", "SubscribedEvent", "UnsubscribedEvent", "MergedEvent", "ReferencedEvent", "CrossReferencedEvent", "AssignedEvent", "UnassignedEvent", "LabeledEvent", "UnlabeledEvent", "MilestonedEvent", "DemilestonedEvent", "RenamedTitleEvent", "LockedEvent", "UnlockedEvent", "DeployedEvent", "Deployment", "DeploymentStatus", "HeadRefDeletedEvent", "HeadRefRestoredEvent", "HeadRefForcePushedEvent", "BaseRefForcePushedEvent", "ReviewRequestedEvent", "ReviewRequestRemovedEvent", "ReviewDismissedEvent", "DeployKey", "Language", "ProtectedBranch", "PushAllowance", "ReviewDismissalAllowance", "Release", "ReleaseAsset", "RepositoryTopic", "Topic", "Gist", "GistComment", "PublicKey", "OrganizationIdentityProvider", "ExternalIdentity", "Blob", "Bot", "RepositoryInvitation", "BaseRefChangedEvent", "AddedToProjectEvent", "CommentDeletedEvent", "ConvertedNoteToIssueEvent", "MentionedEvent", "MovedColumnsInProjectEvent", "RemovedFromProjectEvent", "Tag"]

  public static let selections: [GraphQLSelection] = [
    GraphQLTypeCase(
      variants: ["Repository": AsRepository.selections],
      default: [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      ]
    )
  ]

  public var snapshot: Snapshot

  public init(snapshot: Snapshot) {
    self.snapshot = snapshot
  }

  public static func makeLicense() -> Repository {
    return Repository(snapshot: ["__typename": "License"])
  }

  public static func makeMarketplaceCategory() -> Repository {
    return Repository(snapshot: ["__typename": "MarketplaceCategory"])
  }

  public static func makeMarketplaceListing() -> Repository {
    return Repository(snapshot: ["__typename": "MarketplaceListing"])
  }

  public static func makeOrganization() -> Repository {
    return Repository(snapshot: ["__typename": "Organization"])
  }

  public static func makeProject() -> Repository {
    return Repository(snapshot: ["__typename": "Project"])
  }

  public static func makeProjectColumn() -> Repository {
    return Repository(snapshot: ["__typename": "ProjectColumn"])
  }

  public static func makeProjectCard() -> Repository {
    return Repository(snapshot: ["__typename": "ProjectCard"])
  }

  public static func makeIssue() -> Repository {
    return Repository(snapshot: ["__typename": "Issue"])
  }

  public static func makeUser() -> Repository {
    return Repository(snapshot: ["__typename": "User"])
  }

  public static func makeCommitComment() -> Repository {
    return Repository(snapshot: ["__typename": "CommitComment"])
  }

  public static func makeUserContentEdit() -> Repository {
    return Repository(snapshot: ["__typename": "UserContentEdit"])
  }

  public static func makeReaction() -> Repository {
    return Repository(snapshot: ["__typename": "Reaction"])
  }

  public static func makeCommit() -> Repository {
    return Repository(snapshot: ["__typename": "Commit"])
  }

  public static func makeStatus() -> Repository {
    return Repository(snapshot: ["__typename": "Status"])
  }

  public static func makeStatusContext() -> Repository {
    return Repository(snapshot: ["__typename": "StatusContext"])
  }

  public static func makeTree() -> Repository {
    return Repository(snapshot: ["__typename": "Tree"])
  }

  public static func makeRef() -> Repository {
    return Repository(snapshot: ["__typename": "Ref"])
  }

  public static func makePullRequest() -> Repository {
    return Repository(snapshot: ["__typename": "PullRequest"])
  }

  public static func makeLabel() -> Repository {
    return Repository(snapshot: ["__typename": "Label"])
  }

  public static func makeIssueComment() -> Repository {
    return Repository(snapshot: ["__typename": "IssueComment"])
  }

  public static func makePullRequestCommit() -> Repository {
    return Repository(snapshot: ["__typename": "PullRequestCommit"])
  }

  public static func makeMilestone() -> Repository {
    return Repository(snapshot: ["__typename": "Milestone"])
  }

  public static func makeReviewRequest() -> Repository {
    return Repository(snapshot: ["__typename": "ReviewRequest"])
  }

  public static func makeTeam() -> Repository {
    return Repository(snapshot: ["__typename": "Team"])
  }

  public static func makeOrganizationInvitation() -> Repository {
    return Repository(snapshot: ["__typename": "OrganizationInvitation"])
  }

  public static func makePullRequestReview() -> Repository {
    return Repository(snapshot: ["__typename": "PullRequestReview"])
  }

  public static func makePullRequestReviewComment() -> Repository {
    return Repository(snapshot: ["__typename": "PullRequestReviewComment"])
  }

  public static func makeCommitCommentThread() -> Repository {
    return Repository(snapshot: ["__typename": "CommitCommentThread"])
  }

  public static func makePullRequestReviewThread() -> Repository {
    return Repository(snapshot: ["__typename": "PullRequestReviewThread"])
  }

  public static func makeClosedEvent() -> Repository {
    return Repository(snapshot: ["__typename": "ClosedEvent"])
  }

  public static func makeReopenedEvent() -> Repository {
    return Repository(snapshot: ["__typename": "ReopenedEvent"])
  }

  public static func makeSubscribedEvent() -> Repository {
    return Repository(snapshot: ["__typename": "SubscribedEvent"])
  }

  public static func makeUnsubscribedEvent() -> Repository {
    return Repository(snapshot: ["__typename": "UnsubscribedEvent"])
  }

  public static func makeMergedEvent() -> Repository {
    return Repository(snapshot: ["__typename": "MergedEvent"])
  }

  public static func makeReferencedEvent() -> Repository {
    return Repository(snapshot: ["__typename": "ReferencedEvent"])
  }

  public static func makeCrossReferencedEvent() -> Repository {
    return Repository(snapshot: ["__typename": "CrossReferencedEvent"])
  }

  public static func makeAssignedEvent() -> Repository {
    return Repository(snapshot: ["__typename": "AssignedEvent"])
  }

  public static func makeUnassignedEvent() -> Repository {
    return Repository(snapshot: ["__typename": "UnassignedEvent"])
  }

  public static func makeLabeledEvent() -> Repository {
    return Repository(snapshot: ["__typename": "LabeledEvent"])
  }

  public static func makeUnlabeledEvent() -> Repository {
    return Repository(snapshot: ["__typename": "UnlabeledEvent"])
  }

  public static func makeMilestonedEvent() -> Repository {
    return Repository(snapshot: ["__typename": "MilestonedEvent"])
  }

  public static func makeDemilestonedEvent() -> Repository {
    return Repository(snapshot: ["__typename": "DemilestonedEvent"])
  }

  public static func makeRenamedTitleEvent() -> Repository {
    return Repository(snapshot: ["__typename": "RenamedTitleEvent"])
  }

  public static func makeLockedEvent() -> Repository {
    return Repository(snapshot: ["__typename": "LockedEvent"])
  }

  public static func makeUnlockedEvent() -> Repository {
    return Repository(snapshot: ["__typename": "UnlockedEvent"])
  }

  public static func makeDeployedEvent() -> Repository {
    return Repository(snapshot: ["__typename": "DeployedEvent"])
  }

  public static func makeDeployment() -> Repository {
    return Repository(snapshot: ["__typename": "Deployment"])
  }

  public static func makeDeploymentStatus() -> Repository {
    return Repository(snapshot: ["__typename": "DeploymentStatus"])
  }

  public static func makeHeadRefDeletedEvent() -> Repository {
    return Repository(snapshot: ["__typename": "HeadRefDeletedEvent"])
  }

  public static func makeHeadRefRestoredEvent() -> Repository {
    return Repository(snapshot: ["__typename": "HeadRefRestoredEvent"])
  }

  public static func makeHeadRefForcePushedEvent() -> Repository {
    return Repository(snapshot: ["__typename": "HeadRefForcePushedEvent"])
  }

  public static func makeBaseRefForcePushedEvent() -> Repository {
    return Repository(snapshot: ["__typename": "BaseRefForcePushedEvent"])
  }

  public static func makeReviewRequestedEvent() -> Repository {
    return Repository(snapshot: ["__typename": "ReviewRequestedEvent"])
  }

  public static func makeReviewRequestRemovedEvent() -> Repository {
    return Repository(snapshot: ["__typename": "ReviewRequestRemovedEvent"])
  }

  public static func makeReviewDismissedEvent() -> Repository {
    return Repository(snapshot: ["__typename": "ReviewDismissedEvent"])
  }

  public static func makeDeployKey() -> Repository {
    return Repository(snapshot: ["__typename": "DeployKey"])
  }

  public static func makeLanguage() -> Repository {
    return Repository(snapshot: ["__typename": "Language"])
  }

  public static func makeProtectedBranch() -> Repository {
    return Repository(snapshot: ["__typename": "ProtectedBranch"])
  }

  public static func makePushAllowance() -> Repository {
    return Repository(snapshot: ["__typename": "PushAllowance"])
  }

  public static func makeReviewDismissalAllowance() -> Repository {
    return Repository(snapshot: ["__typename": "ReviewDismissalAllowance"])
  }

  public static func makeRelease() -> Repository {
    return Repository(snapshot: ["__typename": "Release"])
  }

  public static func makeReleaseAsset() -> Repository {
    return Repository(snapshot: ["__typename": "ReleaseAsset"])
  }

  public static func makeRepositoryTopic() -> Repository {
    return Repository(snapshot: ["__typename": "RepositoryTopic"])
  }

  public static func makeTopic() -> Repository {
    return Repository(snapshot: ["__typename": "Topic"])
  }

  public static func makeGist() -> Repository {
    return Repository(snapshot: ["__typename": "Gist"])
  }

  public static func makeGistComment() -> Repository {
    return Repository(snapshot: ["__typename": "GistComment"])
  }

  public static func makePublicKey() -> Repository {
    return Repository(snapshot: ["__typename": "PublicKey"])
  }

  public static func makeOrganizationIdentityProvider() -> Repository {
    return Repository(snapshot: ["__typename": "OrganizationIdentityProvider"])
  }

  public static func makeExternalIdentity() -> Repository {
    return Repository(snapshot: ["__typename": "ExternalIdentity"])
  }

  public static func makeBlob() -> Repository {
    return Repository(snapshot: ["__typename": "Blob"])
  }

  public static func makeBot() -> Repository {
    return Repository(snapshot: ["__typename": "Bot"])
  }

  public static func makeRepositoryInvitation() -> Repository {
    return Repository(snapshot: ["__typename": "RepositoryInvitation"])
  }

  public static func makeBaseRefChangedEvent() -> Repository {
    return Repository(snapshot: ["__typename": "BaseRefChangedEvent"])
  }

  public static func makeAddedToProjectEvent() -> Repository {
    return Repository(snapshot: ["__typename": "AddedToProjectEvent"])
  }

  public static func makeCommentDeletedEvent() -> Repository {
    return Repository(snapshot: ["__typename": "CommentDeletedEvent"])
  }

  public static func makeConvertedNoteToIssueEvent() -> Repository {
    return Repository(snapshot: ["__typename": "ConvertedNoteToIssueEvent"])
  }

  public static func makeMentionedEvent() -> Repository {
    return Repository(snapshot: ["__typename": "MentionedEvent"])
  }

  public static func makeMovedColumnsInProjectEvent() -> Repository {
    return Repository(snapshot: ["__typename": "MovedColumnsInProjectEvent"])
  }

  public static func makeRemovedFromProjectEvent() -> Repository {
    return Repository(snapshot: ["__typename": "RemovedFromProjectEvent"])
  }

  public static func makeTag() -> Repository {
    return Repository(snapshot: ["__typename": "Tag"])
  }

  public static func makeRepository(name: String, nameWithOwner: String, owner: AsRepository.Owner, descriptionHtml: String, stargazers: AsRepository.Stargazer, forks: AsRepository.Fork, updatedAt: String) -> Repository {
    return Repository(snapshot: ["__typename": "Repository", "name": name, "nameWithOwner": nameWithOwner, "owner": owner.snapshot, "descriptionHTML": descriptionHtml, "stargazers": stargazers.snapshot, "forks": forks.snapshot, "updatedAt": updatedAt])
  }

  public var __typename: String {
    get {
      return snapshot["__typename"]! as! String
    }
    set {
      snapshot.updateValue(newValue, forKey: "__typename")
    }
  }

  public var asRepository: AsRepository? {
    get {
      if !AsRepository.possibleTypes.contains(__typename) { return nil }
      return AsRepository(snapshot: snapshot)
    }
    set {
      guard let newValue = newValue else { return }
      snapshot = newValue.snapshot
    }
  }

  public struct AsRepository: GraphQLSelectionSet {
    public static let possibleTypes = ["Repository"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("name", type: .nonNull(.scalar(String.self))),
      GraphQLField("nameWithOwner", type: .nonNull(.scalar(String.self))),
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("owner", type: .nonNull(.object(Owner.selections))),
      GraphQLField("descriptionHTML", type: .nonNull(.scalar(String.self))),
      GraphQLField("stargazers", type: .nonNull(.object(Stargazer.selections))),
      GraphQLField("forks", type: .nonNull(.object(Fork.selections))),
      GraphQLField("updatedAt", type: .nonNull(.scalar(String.self))),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(name: String, nameWithOwner: String, owner: Owner, descriptionHtml: String, stargazers: Stargazer, forks: Fork, updatedAt: String) {
      self.init(snapshot: ["__typename": "Repository", "name": name, "nameWithOwner": nameWithOwner, "owner": owner.snapshot, "descriptionHTML": descriptionHtml, "stargazers": stargazers.snapshot, "forks": forks.snapshot, "updatedAt": updatedAt])
    }

    public var __typename: String {
      get {
        return snapshot["__typename"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "__typename")
      }
    }

    /// The name of the repository.
    public var name: String {
      get {
        return snapshot["name"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "name")
      }
    }

    /// The repository's name with owner.
    public var nameWithOwner: String {
      get {
        return snapshot["nameWithOwner"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "nameWithOwner")
      }
    }

    /// The User owner of the repository.
    public var owner: Owner {
      get {
        return Owner(snapshot: snapshot["owner"]! as! Snapshot)
      }
      set {
        snapshot.updateValue(newValue.snapshot, forKey: "owner")
      }
    }

    /// The description of the repository rendered to HTML.
    public var descriptionHtml: String {
      get {
        return snapshot["descriptionHTML"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "descriptionHTML")
      }
    }

    /// A list of users who have starred this starrable.
    public var stargazers: Stargazer {
      get {
        return Stargazer(snapshot: snapshot["stargazers"]! as! Snapshot)
      }
      set {
        snapshot.updateValue(newValue.snapshot, forKey: "stargazers")
      }
    }

    /// A list of direct forked repositories.
    public var forks: Fork {
      get {
        return Fork(snapshot: snapshot["forks"]! as! Snapshot)
      }
      set {
        snapshot.updateValue(newValue.snapshot, forKey: "forks")
      }
    }

    /// Identifies the date and time when the object was last updated.
    public var updatedAt: String {
      get {
        return snapshot["updatedAt"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "updatedAt")
      }
    }

    public var fragments: Fragments {
      get {
        return Fragments(snapshot: snapshot)
      }
      set {
        snapshot += newValue.snapshot
      }
    }

    public struct Fragments {
      public var snapshot: Snapshot

      public var owner: Owner {
        get {
          return Owner(snapshot: snapshot)
        }
        set {
          snapshot += newValue.snapshot
        }
      }
    }

    public struct Owner: GraphQLSelectionSet {
      public static let possibleTypes = ["Organization", "User"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("login", type: .nonNull(.scalar(String.self))),
        GraphQLField("avatarUrl", type: .nonNull(.scalar(String.self))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public static func makeOrganization(id: GraphQLID, login: String, avatarUrl: String) -> Owner {
        return Owner(snapshot: ["__typename": "Organization", "id": id, "login": login, "avatarUrl": avatarUrl])
      }

      public static func makeUser(id: GraphQLID, login: String, avatarUrl: String) -> Owner {
        return Owner(snapshot: ["__typename": "User", "id": id, "login": login, "avatarUrl": avatarUrl])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      /// The username used to login.
      public var login: String {
        get {
          return snapshot["login"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "login")
        }
      }

      /// A URL pointing to the owner's public avatar.
      public var avatarUrl: String {
        get {
          return snapshot["avatarUrl"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "avatarUrl")
        }
      }
    }

    public struct Stargazer: GraphQLSelectionSet {
      public static let possibleTypes = ["StargazerConnection"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("totalCount", type: .nonNull(.scalar(Int.self))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(totalCount: Int) {
        self.init(snapshot: ["__typename": "StargazerConnection", "totalCount": totalCount])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      /// Identifies the total count of items in the connection.
      public var totalCount: Int {
        get {
          return snapshot["totalCount"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "totalCount")
        }
      }
    }

    public struct Fork: GraphQLSelectionSet {
      public static let possibleTypes = ["RepositoryConnection"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("totalCount", type: .nonNull(.scalar(Int.self))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(totalCount: Int) {
        self.init(snapshot: ["__typename": "RepositoryConnection", "totalCount": totalCount])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      /// Identifies the total count of items in the connection.
      public var totalCount: Int {
        get {
          return snapshot["totalCount"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "totalCount")
        }
      }
    }
  }
}