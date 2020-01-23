//
//  ProjectViewCell.swift
//  GitClient
//
//  Created by Bartosz Swiety on 23/01/2020.
//  Copyright © 2020 Bartosz Swiety. All rights reserved.
//

import Foundation
import UIKit

public class ProjectViewCell: UITableViewCell {
    @IBOutlet var titleLabel: UILabel!

    @IBOutlet var detailLabel: UILabel!

    func setProject(project: GitProject) {
        if let name: String = project.name {
            titleLabel.text = name
        }

        if let detail: String = project.full_name {
            detailLabel.text = detail
        }
    }
}
