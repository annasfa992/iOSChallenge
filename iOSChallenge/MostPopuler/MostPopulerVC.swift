//
//  MostPopulerVC.swift
//  iOSChallenge
//
//  Created by anas elfaouri on 6/2/20.
//  Copyright © 2020 iOSChallenge. All rights reserved.
//

import UIKit

class MostPopulerVC: BaseController {
    var ArrData = [MostPopulerResultResponseModel]()
    
    @IBOutlet weak var tblView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tblView.isAccessibilityElement = true
        tblView.accessibilityIdentifier = "MostPopulerTableView"
        self.showSpinner(onView: self.view)
        
        
        
    }
    
    // Do any additional setup after loading the view.
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        getData()
    }
    
    
    func getData(){
        
        
        
        
        
        MostPopulerService.getAll(completion: { result in
            switch result {
            case Result.success(let response):
                
                
                print(response)
                // Handle successfull response
                self.ArrData = response
                DispatchQueue.main.async {
                    self.tblView.reloadData()
                    self.removeSpinner()
                }
                break
            case Result.failure(let _):
                DispatchQueue.main.async {
                    self.removeSpinner()
                    
                }
                
                // Handle error
                break
            }
        }
            
            
        )
        
    }
    
}



extension MostPopulerVC : UITableViewDelegate,UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        self.ArrData.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Bundle.main.loadNibNamed("MostPopulerCell", owner: self, options: nil)?.first as! MostPopulerCell
        
        let obj = ArrData[indexPath.row]
        
         cell.isAccessibilityElement = true
        
        cell.SetData(obj: obj)
        
     
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let obj = ArrData[indexPath.row]
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                  let newViewController = storyBoard.instantiateViewController(withIdentifier: "MostPopulerDetailsVC") as! MostPopulerDetailsVC
        
        newViewController.ObjData = obj
        
        self.navigationController?.pushViewController(newViewController, animated: true)
               
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}






