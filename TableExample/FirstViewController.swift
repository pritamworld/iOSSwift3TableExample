//
//  FirstViewController.swift
//  TableExample
//
//  Created by Pritesh Patel on 2017-05-08.
//  Copyright © 2017 Example. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, MyProtocol {

    @IBOutlet weak var lblMessage: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "showSecond")
        {
            let vc = segue.destination as! SecondViewController
            vc.delegate = self
            self.present(vc, animated: true, completion: nil)
        }
    }
    
    func getBack(controller:SecondViewController, str: String)
    {
        lblMessage.text = str;
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
