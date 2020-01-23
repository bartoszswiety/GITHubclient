//
//  ViewController.swift
//  GitClient
//
//  Created by Bartosz Swiety on 23/01/2020.
//  Copyright © 2020 Bartosz Swiety. All rights reserved.
//

import UIKit

/// Lists of Projects
class ProjectListViewController: UITableViewController {
    // MARK: -Property

    var projects: [GitProject] = []
    var actualPage = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        loadProjects()
    }

    func loadProjects(page _: Int = 0) {
        API.shared.request(target: .list(page: 0)) { data, _, _ in
            do {
                let jsonDecoder = JSONDecoder()
                let response = try jsonDecoder.decode(GitProjectsResponse.self, from: data!)
                if let items = response.items {
                    self.projects.insert(contentsOf: items, at: 0)

                    DispatchQueue.main.async {
                        self.tableView.reloadData(with: .fade)
                    }
                }
            } catch {
                print("error while loading projects")
            }
        }
    }
}

extension ProjectListViewController {
    // MARK: -TableViewController

    public override func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        return projects.count
    }

    public override func tableView(_: UITableView, cellForRowAt index: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProjectViewCell") as! ProjectViewCell
        cell.setProject(project: projects[index.row])
        return cell
    }

    public override func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        // UITableView only moves in one direction, y axis
        let currentOffset = scrollView.contentOffset.y
        let maximumOffset = scrollView.contentSize.height - scrollView.frame.size.height

        print(currentOffset)
        // Change 10.0 to adjust the distance from bottom
        if maximumOffset - currentOffset <= 10.0 {
            self.loadProjects()
        }
    }

}


