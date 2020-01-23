//
//  UserViewCell.swift
//  GitClient
//
//  Created by Bartosz Swiety on 23/01/2020.
//  Copyright © 2020 Bartosz Swiety. All rights reserved.
//

import Foundation
import UIKit

class UserViewCell: UITableViewCell {
    @IBOutlet var photoImageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!

    func loadImage(user: GitUser) {
        let url = URL(string: user.avatar_url)

        DispatchQueue.global().async {
            let data = try? Data(contentsOf: url!) // make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch
            DispatchQueue.main.async {
                let image = UIImage(data: data!)
                user.avatar = image
                self.photoImageView.image = image
            }
        }
    }

    public func setUser(user: GitUser) {
        nameLabel.text = "@" + user.login
        photoImageView.image = nil
        if user.avatar != nil {
            photoImageView.image = user.avatar
        } else {
            loadImage(user: user)
        }
    }
}
