//
//  GitHubNetworking.swift
//  GitClient
//
//  Created by Bartosz Swiety on 23/01/2020.
//  Copyright © 2020 Bartosz Swiety. All rights reserved.
//

import Foundation


public enum GitTarget
{
    case list(page: Int)
}

extension GitTarget
{
    public var baseURL: String { return "api.github.com/"; }

    public var path: String {
        switch self
        {
        case let .list(page):
            return "search/repositories?q=language:swift&sort=stars&order=desc&page=" + String(page)
        }
    }

    public var method: String
    {
        return "GET"
    }

    public var request: URLRequest
    {
        var url = URLComponents()
        url.scheme = "https"
        url.host = self.baseURL
        url.path = self.path
        var request = URLRequest(url: url.url!)
        request.httpMethod = self.method
        let urlSession = URLSession(configuration: .default, delegate: nil, delegateQueue: nil)
        //        request.allHTTPHeaderFields =

        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/vnd.github.v3+json", forHTTPHeaderField: "Accept")
        request.setValue("Awesome-Octocat-App", forHTTPHeaderField: "User-Agent")
        return request
    }
}
