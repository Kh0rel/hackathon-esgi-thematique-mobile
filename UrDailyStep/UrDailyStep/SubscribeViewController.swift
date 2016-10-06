//
//  SubscribeViewController.swift
//  UrDailyStep
//
//  Created by guillaume chieb bouares on 06/10/2016.
//  Copyright © 2016 com.github.shemana. All rights reserved.
//

import UIKit

class SubscribeViewController: UIViewController {

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
