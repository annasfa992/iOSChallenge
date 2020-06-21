//
//  OfflineViewController.swift
//  iOSChallenge
//
//  Created by anas elfaouri on 6/2/20.
//  Copyright © 2020 iOSChallenge. All rights reserved.
//


import Foundation
import UIKit
class OfflineViewController: UIViewController {
    weak var delegate: SecondControllerDelegate?
    let reachability = try! Reachability()
 
         
    override func viewDidLoad() {
        super.viewDidLoad()

         

        
        reachability.whenReachable =  { _  in
          
                     DispatchQueue.main.async {
                                self.dismiss(animated: true, completion: nil)
                            }
                 }
                 
                 
                 
                 reachability.whenUnreachable =  { _  in
                 
                
               }
                 
                 
          startMonitoring()
        
        
    }
    
    
    
    func startMonitoring() {
        //   let reachability = Reachability()
           NotificationCenter.default.addObserver(self,
                                                  selector: #selector(self.reachabilityChanged),
                                                  name: Notification.Name.reachabilityChanged,
                                                  object: reachability)
           do{
               try reachability.startNotifier()
           
           } catch {
               print("Could not start reachability notifier")
           }
       }
       
       
       
     
       
       @objc func reachabilityChanged(note:Notification) {
         
           
           let reachability = note.object as! Reachability
           
           
           if reachability.connection != .unavailable{
               DispatchQueue.main.async {
                   
               
                   print(" connection ")
               }
           }
           else {
                  DispatchQueue.main.async {
                   print("no connection ")
                   
                   
                 
                   
                   
                   
               }
           }
           
       }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
          self.reachability.stopNotifier()
          delegate?.didBackButtonPressed()
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    private func showMainController() -> Void {
        DispatchQueue.main.async {
            self.dismiss(animated: true, completion: nil)
        }
    }
}
