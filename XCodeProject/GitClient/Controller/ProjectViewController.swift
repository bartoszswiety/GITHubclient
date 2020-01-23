//
//  ProjectViewController.swift
//  GitClient
//
//  Created by Bartosz Swiety on 23/01/2020.
//  Copyright © 2020 Bartosz Swiety. All rights reserved.
//  http://github.com/bartoszswiety/GITHubclient
//

import Foundation
import UIKit

public class ProjectViewController: UIViewController {
    // MARK: -Preporites

    @IBOutlet var projectNameLabel: UILabel!
    @IBOutlet var projectSizeLabel: UILabel!
    @IBOutlet var projectForksLabel: UILabel!
    @IBOutlet var projectStargrazersLabel: UILabel!

    @IBOutlet var tableView: UITableView!

    // GitProject displayed in overview
    var project: GitProject?

    // MARK: -Initalizer

    public override func viewDidLoad() {
        setProjectDetails()
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension ProjectViewController {
    /// Displays attrubities on view
    func setProjectDetails() {
        if let project = self.project {
            projectNameLabel.text = project.name
            projectSizeLabel.text = project.size.description
            projectForksLabel.text = project.forks.description
            projectStargrazersLabel.text = project.stargazers_count.description
        }
        loadProjectContributors()
    }

    /// Tries to load contributors
    func loadProjectContributors() {
        if let path = self.project?.url.components(separatedBy: "repos/")[1] {
            API.shared.request(target: .contributors(path: path)) { data, _, _ in
                do {
                    let jsonDecoder = JSONDecoder()
                    let users = try jsonDecoder.decode(GitUserList.self, from: data!) as [GitUser]
                    self.project?.contriubutors = users
                    DispatchQueue.main.async {
                        self.tableView.reloadData(with: .fade)
                        self.loadProjectStats(path: path)
                    }
                } catch {
                    print("error")
                }
            }
        }
    }

    func loadProjectStats(path: String) {
        API.shared.request(target: .stats(path: path)) { data, _, error in
            do {
                let jsonDecoder = JSONDecoder()
                let stats = try jsonDecoder.decode(GitStatsArray.self, from: data!) as [GitStats]
                DispatchQueue.main.async {
                    for user in self.project!.contriubutors {
                        let stat = stats.first { (stats) -> Bool in
                            stats.author?.id == user.id
                        }

                        if let weeks = stat?.weeks {
                            for week in weeks {
                                user.commitsCount += week.c ?? 0
                                user.additionsCount += week.a ?? 0
                                user.deletionsCount += week.d ?? 0
                            }
                        }
                    }
                    self.tableView.reloadData(with: .fade)
                }
            } catch {
                print(error)
            }
        }
    }
}

// MARK: -TableView

extension ProjectViewController: UITableViewDelegate, UITableViewDataSource {
    public func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        return project?.contriubutors.count ?? 0
    }

    public func tableView(_: UITableView, heightForRowAt _: IndexPath) -> CGFloat {
        return 100
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserViewCell") as! UserViewCell
        cell.setUser(user: project!.contriubutors[indexPath.row])
        return cell
    }

    public func tableView(_: UITableView, didSelectRowAt indexPath: IndexPath) {
        // feat - open url
        if let url = URL(string: project!.contriubutors[indexPath.row].html_url) {
            UIApplication.shared.openURL(url)
        }
    }
}
