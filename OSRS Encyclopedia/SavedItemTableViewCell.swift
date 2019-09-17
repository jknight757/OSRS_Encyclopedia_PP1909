//
//  SavedItemTableViewCell.swift
//  OSRS Encyclopedia
//
//  Created by jeffrey knight on 9/16/19.
//  Copyright © 2019 fullsailStudent. All rights reserved.
//

import UIKit
// custom cell class
class SavedItemTableViewCell: UITableViewCell {
    // cell outlets
    @IBOutlet weak var iconImage: UIImageView!
    @IBOutlet weak var iconLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
