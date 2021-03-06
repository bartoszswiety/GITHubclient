//
//  ViewController.swift
//  GitClient
//
//  Created by Bartosz Swiety on 23/01/2020.
//  Copyright © 2020 Bartosz Swiety. All rights reserved.
//  http://github.com/bartoszswiety/GITHubclient
//

import UIKit

/// Lists of Projects
class ProjectListViewController: UITableViewController {
    // MARK: -Preporites

    var projects: [GitProject] = []
    var actualPage = 1
    var loading = false

    // MARK: -Inializer

    override func viewDidLoad() {
        super.viewDidLoad()
        loadProjects()
    }

    // MARK: -Load projects from git

    func loadProjects(page _: Int = 0) {
        loading = true
        API.shared.request(target: .list(page: actualPage)) { data, _, _ in
            do {
                let jsonDecoder = JSONDecoder()
                let response = try jsonDecoder.decode(GitProjectsResponse.self, from: data!)

                self.projects.insert(contentsOf: response.items, at: self.projects.count)

                DispatchQueue.main.async {
                    self.tableView.reloadData(with: .fade)
                    self.loading = false
                    self.actualPage += 1
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
        if !loading {
            return projects.count
        } else {
            return projects.count + 1
        }
    }

    public override func tableView(_: UITableView, cellForRowAt index: IndexPath) -> UITableViewCell {
        if index.row < projects.count {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProjectViewCell") as! ProjectViewCell
            cell.setProject(project: projects[index.row])
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "LoadingViewCell") as! LoadingViewCell
            cell.startLoading()
            return cell
        }
    }

    public override func tableView(_: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(identifier: "ProjectViewController") as! ProjectViewController

        guard indexPath.row < projects.count
        else {
            return
        }

        navigationController?.pushViewController(vc, animated: true)
        vc.project = projects[indexPath.row]
    }

    // Autoload
    public override func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate _: Bool) {
        let currentOffset = scrollView.contentOffset.y
        let maximumOffset = scrollView.contentSize.height - scrollView.frame.size.height

        if !loading {
            if maximumOffset - currentOffset <= 70.0 {
                loadProjects()
            }
        }
    }
}
