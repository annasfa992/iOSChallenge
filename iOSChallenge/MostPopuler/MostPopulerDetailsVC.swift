//
//  MostPopulerDetailsVC.swift
//  iOSChallenge
//
//  Created by anas elfaouri on 6/2/20.
//  Copyright © 2020 iOSChallenge. All rights reserved.
//
import UIKit
import Foundation
class MostPopulerDetailsVC: BaseController {
    var ObjData = MostPopulerResultResponseModel()
    
    @IBOutlet weak var tblView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
      
     
        
    }
    
    // Do any additional setup after loading the view.
    
    
    
    override func viewWillAppear(_ animated: Bool) {
      
    }
    
    
   
    
}



extension MostPopulerDetailsVC : UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 3
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Bundle.main.loadNibNamed("HeaderCell", owner: self, options: nil)?.first as! HeaderCell
        
        let cellImage = Bundle.main.loadNibNamed("ImageCell", owner: self, options: nil)?.first as! ImageCell
               
        
      
 
            
            
        
        switch indexPath.row {
            
        case 0 :
          
           
            return cellImage
        
                
            case 1 :
              
                cell.titleLbl.text = ObjData.title
                 cell.dateLbl.isHidden = true
                return cell
        case 2:
            cell.dateLbl.text = ObjData.published_date
            cell.titleLbl.font = UIFont.systemFont(ofSize: 17.0)
             cell.titleLbl.text = ObjData.abstract
             cell.dateLbl.isHidden = false
            return cell
            
        default :    break;
        }
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        switch indexPath.row {
            
        case 0 :
            return 150
        default :
        return UITableView.automaticDimension
    }
    
    }
    
}





