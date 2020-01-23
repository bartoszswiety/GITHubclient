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
    public var baseURL: String { return "https://api.github.com/"; }

    public var path: String {
        switch self
        {
        case let .list(page):
            return ""
        }
    }

    public var method: String
    {
        return "GET"
    }

    public var request: URLRequest
    {
        return req
    }
}
