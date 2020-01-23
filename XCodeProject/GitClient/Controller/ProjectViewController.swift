//
//  ProjectViewController.swift
//  GitClient
//
//  Created by Bartosz Swiety on 23/01/2020.
//  Copyright © 2020 Bartosz Swiety. All rights reserved.
//

import Foundation
import UIKit

public class ProjectViewController: UIViewController {
    @IBOutlet var projectNameLabel: UILabel!

    @IBOutlet var projectSizeLabel: UILabel!
    @IBOutlet var projectForksLabel: UILabel!

    @IBOutlet var projectStargrazersLabel: UILabel!

    var project: GitProject?

    public override func viewDidLoad() {
        setProjectDetails()
        tableView.delegate = self
        tableView.dataSource = self
    }

    @IBOutlet var tableView: UITableView!
}

extension ProjectViewController {
    func setProjectDetails() {
        if let project = self.project {
            projectNameLabel.text = project.name
            projectSizeLabel.text = project.size.description
            projectForksLabel.text = project.forks.description
            projectStargrazersLabel.text = project.stargazers_count.description
        }
        loadProjectContributors()
    }

    func loadProjectContributors() {
        if let path = self.project?.contributors_url.components(separatedBy: "repos/")[1] {
            API.shared.request(target: .contributors(path: path)) { data, _, _ in
//                    print(String(data: data!, encoding: .utf8))
                do {
                    let jsonDecoder = JSONDecoder()
                    let users = try jsonDecoder.decode(GitUserList.self, from: data!) as [GitUser]
                    self.project?.contriubutors = users
//                    print(self.project?.contriubutors.count)
                    DispatchQueue.main.async {
                        self.tableView.reloadData(with: .fade)
                    }
                } catch {
                    print("error")
                }
            }
        }
    }
}

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
        if let url = URL(string: project.contriubutors[indexPath.row].html_url) {
            UIApplication.shared.openURL(url)
        }
    }
}
