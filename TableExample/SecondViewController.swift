//
//  SecondViewController.swift
//  TableExample
//
//  Created by Pritesh Patel on 2017-05-08.
//  Copyright © 2017 Example. All rights reserved.
//

import UIKit
import Social

protocol MyProtocol {
    func getBack(controller:SecondViewController, str: String) ;
}

class SecondViewController: UIViewController {
    
    
    
    @IBOutlet weak var lblDummy: UILabel!
    var i:Int=0
    var screenWidth:CGFloat=0
    var screenHeight:CGFloat=0
    var delegate: MyProtocol? = nil;
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Changed")
        i = 100;
        NotificationCenter.default.addObserver(self, selector: #selector(SecondViewController.rotated), name: NSNotification.Name.UIDeviceOrientationDidChange, object: nil)
        // Do any additional setup after loading the view.
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        if UIDevice.current.orientation.isLandscape {
            print("Landscape %d",i)
            i = 200
            lblDummy.isHidden = true
        } else {
            print("Portrait %d",i)
            i = 300
            lblDummy.isHidden = false
        }
        getScreenSize()
    }
    
    override func didRotate(from fromInterfaceOrientation: UIInterfaceOrientation) {
        getScreenSize()
    }
    
    func getScreenSize(){
        screenWidth=UIScreen.main.bounds.width
        screenHeight=UIScreen.main.bounds.height
        print("SCREEN RESOLUTION: "+screenWidth.description+" x "+screenHeight.description)
    }
    
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    func rotated() {
        if UIDevice.current.orientation.isLandscape {
            print("Landscape")
        } else {
            print("Portrait")
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func close(_ sender: AnyObject) {
        delegate?.getBack(controller: self,str: "Pritesh Patel Click to close this view")
        self.dismiss(animated: false, completion: nil)
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
    @IBAction func shareFacebook(_ sender: AnyObject) {
        
        
        if(SLComposeViewController.isAvailable(forServiceType: SLServiceTypeFacebook)){
            let fbSheet = SLComposeViewController(forServiceType: SLServiceTypeFacebook)
            fbSheet?.setInitialText("initial text")
            //fbSheet?.add(image)
            fbSheet?.add(URL.init(string: "http://yourlink.com"))
            fbSheet?.completionHandler = {(result)  in
                switch(result) {
                //  This means the user cancelled without sending the Tweet
                case SLComposeViewControllerResult.cancelled:
                    break;
                //  This means the user hit 'Send'
                case SLComposeViewControllerResult.done:
                    
                    break;
                }
                
                
            }
            if (fbSheet != nil){
                present(fbSheet!, animated: true, completion: nil)
            }
            
        }else{
            let alert = UIAlertController(title: "Log in to Facebook", message: nil, preferredStyle: UIAlertControllerStyle.alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(okAction)
            present(alert, animated: true, completion: nil)
            
        }
        
    }
    
    
    @IBAction func shareTwitter(_ sender: AnyObject) {
        
        if(SLComposeViewController.isAvailable(forServiceType: SLServiceTypeTwitter)){
            let tweetSheet = SLComposeViewController(forServiceType: SLServiceTypeTwitter)
            tweetSheet?.setInitialText("initial text")
            //tweetSheet?.add(image)
            tweetSheet?.add(URL.init(string: "http://yourlink.com"))
            tweetSheet?.completionHandler = {(result)  in
                switch(result) {
                //  This means the user cancelled without sending the Tweet
                case SLComposeViewControllerResult.cancelled:
                    break;
                //  This means the user hit 'Send'
                case SLComposeViewControllerResult.done:
                    
                    break;
                }
                
                
            }
            if (tweetSheet != nil){
                present(tweetSheet!, animated: true, completion: nil)
            }
            
        }else{
            let alert = UIAlertController(title: "Log in to Twitter", message: nil, preferredStyle: UIAlertControllerStyle.alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(okAction)
            present(alert, animated: true, completion: nil)
            
        }
        
    }
    
    
}
