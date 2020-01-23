//
//  ViewController.swift
//  GitClient
//
//  Created by Bartosz Swiety on 23/01/2020.
//  Copyright © 2020 Bartosz Swiety. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        API.shared.request(target: .list(page: 0)) { (data, response, error) in
            do {
                let jsonDecoder = JSONDecoder()
                let projects = try jsonDecoder.decode(GitProjectsResponse.self, from: data!)
            }
            catch
            {
                print("error while loading projects")
            }
        }
    }
}
