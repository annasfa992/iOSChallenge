//
//  BaseController.swift
//  iOSChallenge
//
//  Created by anas elfaouri on 6/2/20.
//  Copyright © 2020 iOSChallenge. All rights reserved.
//

import UIKit

class BaseController: UIViewController {
 let reachability = try! Reachability()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        reachability.whenReachable =  { _  in
                   self.startMonitoring()
                   print("online")
                   
               }
               
               
               
               reachability.whenUnreachable =  { _  in
                   
                   print("offline")
                   self.reachability.stopNotifier()
                   
                   let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                   
                   if let presentedViewController = storyBoard.instantiateViewController(withIdentifier: "OfflineViewController") as? OfflineViewController {
                       presentedViewController.providesPresentationContextTransitionStyle = true
                       presentedViewController.definesPresentationContext = true
                       presentedViewController.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext;
                       //   presentedViewController.view.backgroundColor = UIColor.init(white: 0.4, alpha: 0.8)
                       
                       presentedViewController.delegate = self
                       self.present(presentedViewController, animated: true, completion: nil)
                       
                   }
               }
               
               
               startMonitoring()
               
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    func startMonitoring() {
         
         NotificationCenter.default.addObserver(self,
                                                selector: #selector(self.reachabilityChanged),
                                                name: Notification.Name.reachabilityChanged,
                                                object: reachability)
         do{
             try reachability.startNotifier()
             print("dfdffdeffeffefef")
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
}

var vSpinner : UIView?

extension UIViewController {
    func showSpinner(onView : UIView) {
        let spinnerView = UIView.init(frame: onView.bounds)
        spinnerView.backgroundColor = UIColor.init(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5)
        let ai = UIActivityIndicatorView.init(style: UIActivityIndicatorView.Style.large)
        ai.startAnimating()
        ai.center = spinnerView.center
        
        DispatchQueue.main.async {
            spinnerView.addSubview(ai)
            onView.addSubview(spinnerView)
        }
        
        vSpinner = spinnerView
    }
    
    func removeSpinner() {
        DispatchQueue.main.async {
            vSpinner?.removeFromSuperview()
            vSpinner = nil
        }
    }
}


extension BaseController: UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController,
                              animationControllerFor operation: UINavigationController.Operation,
                              from fromVC: UIViewController,
                              to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        //INFO: use UINavigationControllerOperation.push or UINavigationControllerOperation.pop to detect the 'direction' of the navigation
        
        class FadeAnimation: NSObject, UIViewControllerAnimatedTransitioning {
            func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
                return 0.5
            }
            
            func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
                let toViewController = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to)
                if let vc = toViewController {
                    transitionContext.finalFrame(for: vc)
                    transitionContext.containerView.addSubview(vc.view)
                    vc.view.alpha = 0.0
                    UIView.animate(withDuration: self.transitionDuration(using: transitionContext),
                                   animations: {
                                    vc.view.alpha = 1.0
                    },
                                   completion: { finished in
                                    transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
                    })
                } else {
                    NSLog("Oops! Something went wrong! 'ToView' controller is nill")
                }
            }
        }
        
        return FadeAnimation()
    }
    
    
    
}
extension BaseController: SecondControllerDelegate {
    func didBackButtonPressed() {
        self.startMonitoring()
    }
    
    
    
}
protocol SecondControllerDelegate : NSObjectProtocol {
    func didBackButtonPressed()
}
