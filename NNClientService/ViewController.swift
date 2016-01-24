//
//  ViewController.swift
//  NNClientService
//
//  Created by Nguyen Hoang Nam on 24/1/16.
//  Copyright © 2016 Nguyen Hoang Nam. All rights reserved.
//

import UIKit
import SpringIndicator

class ViewController: UIViewController {

    @IBOutlet weak var loadingIndicator: SpringIndicator!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func didTouchReload(sender: AnyObject) {
        
        self.loadingIndicator.startAnimation()
        let user:User = User()
        user.updateInfo(wait:true) { (done: Bool) -> () in
            self.loadingIndicator.stopAnimation(true)
        }
    }


}

