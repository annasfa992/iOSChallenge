//
//  HeaderCell.swift
//  iOSChallenge
//
//  Created by anas elfaouri on 6/3/20.
//  Copyright © 2020 iOSChallenge. All rights reserved.
//

import UIKit

class HeaderCell: UITableViewCell {
    @IBOutlet weak var titleLbl: UILabel!
 
     
     @IBOutlet weak var dateLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    
}
