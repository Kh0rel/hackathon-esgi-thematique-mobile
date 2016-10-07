//
//  ViewController.swift
//  UrDailyStep
//
//  Created by guillaume chieb bouares on 05/10/2016.
//  Copyright © 2016 com.github.shemana. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var usernameField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func login(_ sender: AnyObject) {
        TagManager.sendEventWithCategory(category: .ButtonClick, action: .login, label: .connection, value: nil)
    }
    
    @IBAction func subscribe(_ sender: AnyObject) {
        TagManager.sendEventWithCategory(category: .ButtonClick, action: .subscribe, label: .connection, value: nil)
    }
}

