//
//  ViewController.swift
//  GitClient
//
//  Created by Bartosz Swiety on 23/01/2020.
//  Copyright © 2020 Bartosz Swiety. All rights reserved.
//

import UIKit

class ProjectListViewController: UITableViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        API.shared.request(target: .list(page: 0)) { data, _, _ in
            do {
                let jsonDecoder = JSONDecoder()
                let projects = try jsonDecoder.decode(GitProjectsResponse.self, from: data!)
            } catch {
                print("error while loading projects")
            }
        }
    }
}

extension ProjectListViewController {
    public override func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        return 2
    }

    public override func tableView(_: UITableView, cellForRowAt _: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProjectViewCell") as! ProjectViewCell
        return cell
    }
}
