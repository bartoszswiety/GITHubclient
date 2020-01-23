//
//  ProjectViewCell.swift
//  GitClient
//
//  Created by Bartosz Swiety on 23/01/2020.
//  Copyright © 2020 Bartosz Swiety. All rights reserved.
//  http://github.com/bartoszswiety/GITHubclient
//

import Foundation
import UIKit

public class ProjectViewCell: UITableViewCell {
    // MARK: -Preporties

    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var detailLabel: UILabel!

    func setProject(project: GitProject) {
        titleLabel.text = project.name
        detailLabel.text = project.full_name
    }
}
