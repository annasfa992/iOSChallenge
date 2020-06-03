//
//  MostPopulerCell.swift
//  iOSChallenge
//
//  Created by anas elfaouri on 6/2/20.
//  Copyright © 2020 iOSChallenge. All rights reserved.
//

import UIKit

class MostPopulerCell: UITableViewCell {
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var img: UIImageView!
    
    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var SubTitleLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    
    func SetData(obj:MostPopulerResultResponseModel){
        titleLbl.text = obj.title
        SubTitleLbl.text = obj.nytdsection
        dateLbl.text = obj.published_date
        
        img.layer.backgroundColor = UIColor.gray.cgColor
        img.layer.cornerRadius = img.frame.height/2.0
        img.layer.masksToBounds = true
        
  
     
       
}


}
