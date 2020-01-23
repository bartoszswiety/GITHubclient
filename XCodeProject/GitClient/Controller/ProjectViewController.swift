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
    @IBOutlet weak var tableView: UITableView!
}

extension ProjectViewController {
    func setProjectDetails() {
        if let project = self.project {
            projectNameLabel.text = project.name
            projectSizeLabel.text = project.size?.description
            projectForksLabel.text = project.forks?.description
            projectStargrazersLabel.text = project.stargazers_count?.description
        }
        loadProjectContributors()
    }

    func loadImages()
    {
        DispatchQueue.global().async {
            if var project = self.project {
                for var user in project.users
                {
                    do
                    {
                        let data = try Data(contentsOf: URL(string: user.avatar_url!)!)
                        DispatchQueue.main.async {
                            user.avatar = UIImage(data: data)
                        }
                    }
                    catch
                    {
                        print("error while loading avatar")
                    }
                }
            }
        }
    }

    func loadProjectContributors() {
        if var project = self.project {
            if let path = project.contributors_url?.components(separatedBy: "repos/")[1] {
                API.shared.request(target: .contributors(path: path)) { data, _, _ in
//                    print(String(data: data!, encoding: .utf8))
                    do {

                        let jsonDecoder = JSONDecoder()
                        let users = try jsonDecoder.decode(GitUserList.self, from: data!) as [GitUser]
                        project.users = users
                        print(project.users.count)
                        self.loadImages()
                    }
                    catch
                    {
                        print("error")
                    }
                }
            }
        }
    }
}


extension ProjectViewController: UITableViewDelegate, UITableViewDataSource
{
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        20
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }


}
