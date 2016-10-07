//
//  SubscribeViewController.swift
//  UrDailyStep
//
//  Created by guillaume chieb bouares on 06/10/2016.
//  Copyright © 2016 com.github.shemana. All rights reserved.
//

import UIKit
import BEMCheckBox
class SubscribeViewController: UIViewController {

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var firstnameField: UITextField!
    @IBOutlet weak var ageField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var matinCheckBox: BEMCheckBox!
    @IBOutlet weak var midiCheckBox: BEMCheckBox!
    @IBOutlet weak var afternoonCheckBox: BEMCheckBox!
    @IBOutlet weak var soirCheckbox: BEMCheckBox!
    @IBOutlet weak var actuSwift: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onSubscribe(_ sender: AnyObject) {
        let alertController = UIAlertController(title: "", message: "Je souhaite recevoir des notifications de rappel quotidiens?", preferredStyle: .alert)
        
        let yesAction = UIAlertAction(title: "Oui", style: .default, handler: nil)
        let noAction = UIAlertAction(title:"Non",style: .cancel, handler: nil)
        alertController.addAction(yesAction)
        alertController.addAction(noAction)
        
        present(alertController, animated: true, completion: nil)
        TagManager.sendEventWithCategory(category: .ButtonClick, action: .Button, label: .newSubscribe, value: nil)
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
