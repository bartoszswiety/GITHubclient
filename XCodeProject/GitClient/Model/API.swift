//
//  API.swift
//  GitClient
//
//  Created by Bartosz Swiety on 23/01/2020.
//  Copyright © 2020 Bartosz Swiety. All rights reserved.
//

import Foundation

/// API - Manager for connection with API and all data managment
public class API {
    // MARK: - Preporties

    public static var shared: API = API()
}

extension API {
    // MARK: -Request

    func request(target: GitTarget) {
        let urlSession = URLSession(configuration: .default, delegate: nil, delegateQueue: nil)

        var task = urlSession.dataTask(with: target.request!)
        {
            (data, response, error) in
            print(String(data: data!, encoding: .utf8))
            print(response)

        }

        task.resume()
    }
}
