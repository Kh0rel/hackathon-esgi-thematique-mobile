//
//  PerformanceViewController.swift
//  UrDailyStep
//
//  Created by guillaume chieb bouares on 06/10/2016.
//  Copyright © 2016 com.github.shemana. All rights reserved.
//

import UIKit

class PerformanceViewController: UIViewController {
    
    
    @IBOutlet weak var avatar: UIImageView!
    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var number_follower: UILabel!
    @IBOutlet weak var number_following: UILabel!
    @IBOutlet weak var label_1: UILabel!
    @IBOutlet weak var label_2: UILabel!
    @IBOutlet weak var button: UIButton!
    
    var hide:Bool = true

    override func viewDidLoad() {
        super.viewDidLoad()
        self.avatar.isHidden = hide
        self.username.isHidden = hide
        self.label_1.isHidden = hide
        self.label_2.isHidden = hide
        self.number_follower.isHidden = hide
        self.number_following.isHidden = hide
        self.button.isHidden = hide
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func follow_or_not(_ sender: AnyObject) {
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
