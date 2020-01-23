//
//  API.swift
//  GitClient
//
//  Created by Bartosz Swiety on 23/01/2020.
//  Copyright © 2020 Bartosz Swiety. All rights reserved.
//  http://github.com/bartoszswiety/GITHubclient
//

import Foundation

/// API - Manager for connection with API and all data managment
public class API {
    // MARK: - Preporties

    public static var shared: API = API()
}

extension API {
    public typealias Callback = (Data?, URLResponse?, Error?) -> Void

    // MARK: -Request

    func request(target: GitTarget, callback: @escaping Callback) {
        let urlSession = URLSession(configuration: .default, delegate: nil, delegateQueue: nil)

        let task = urlSession.dataTask(with: target.request!) {
            data, response, error in

            let status = (response as! HTTPURLResponse).statusCode

            /// We check status codes and allow only 200
            if status == 200 { // OK
                callback(data, response, error)
                return
            } else { // ERROR
                callback(nil, nil, error)
                return
            }
            // TODO: Better Error handling is required.
        }
        task.resume()
    }
}
