//
//  GitHubNetworking.swift
//  GitClient
//
//  Created by Bartosz Swiety on 23/01/2020.
//  Copyright © 2020 Bartosz Swiety. All rights reserved.
//  http://github.com/bartoszswiety/GITHubclient
//

import Foundation

public enum GitTarget {
    case list(page: Int)
    case contributors(path: String)
    case stats(path: String)
}

extension GitTarget {
    public var baseURL: String { return "api.github.com" }

    public var path: String {
        switch self {
        case .list:
            return "/search/repositories"
        case let .contributors(path):
            return "/repos/" + path + "/contributors"
        case let .stats(path):
            return "/repos/" + path + "/stats/contributors"
        }
    }

    public var query: String {
        switch self {
        case let .list(page):
            return "q=language:swift&sort=stars&order=desc&per_page=25&page=" + String(page)
        case .contributors:
            return ""
        case .stats:
            return ""
        }
    }

    public var method: String {
        return "GET"
    }

    public var request: URLRequest? {
        var url = URLComponents()
        url.scheme = "https"
        url.host = baseURL
        url.path = path
        url.query = query
        print(url)
        if let url = url.url {
            var request = URLRequest(url: url)
            request.httpMethod = method
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.setValue("application/vnd.github.v3+json", forHTTPHeaderField: "Accept")
            request.setValue("Awesome-Octocat-App", forHTTPHeaderField: "User-Agent")
            return request
        } else {
            print("Error: no url")
        }
        return nil
    }
}
