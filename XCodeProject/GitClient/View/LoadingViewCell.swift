//
//  LoadingViewCell.swift
//  GitClient
//
//  Created by Bartosz Swiety on 23/01/2020.
//  Copyright © 2020 Bartosz Swiety. All rights reserved.
//

import Foundation
import UIKit

public class LoadingViewCell: UITableViewCell {
    @IBOutlet var loadingIndicator: UIActivityIndicatorView!
    public func startLoading() {
        loadingIndicator.startAnimating()
    }
}
