//
//  ActualityItem.swift
//  UrDailyStep
//
//  Created by Flavian Mary on 06/10/2016.
//  Copyright © 2016 com.github.shemana. All rights reserved.
//

import UIKit
import Social

class ActualityItem: UITableViewCell {
    
    
    @IBOutlet weak var avatar: UIImageView!
    
    @IBOutlet weak var identifiant: UILabel!
    @IBOutlet weak var location: UIImageView!
    @IBOutlet weak var position: UIImageView!
    @IBOutlet weak var button_facebook: UIImageView!
    @IBOutlet weak var button_twitter: UIImageView!
    @IBOutlet weak var level: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
//        let tapGestureRecognizerFacebook = UITapGestureRecognizer(target:self, action:Selector(("facebookTapped:")))
//        button_facebook.isUserInteractionEnabled = true
//        button_facebook.addGestureRecognizer(tapGestureRecognizerFacebook)
//        
//        let tapGestureRecognizerTwitter = UITapGestureRecognizer(target:self, action:Selector(("twitterTapped:")))
//        button_twitter.isUserInteractionEnabled = true
//        button_twitter.addGestureRecognizer(tapGestureRecognizerTwitter)

    }
    
    func facebookTapped(img: AnyObject)
    {
        if SLComposeViewController.isAvailable(forServiceType: SLServiceTypeFacebook){
            let facebookSheet:SLComposeViewController = SLComposeViewController(forServiceType: SLServiceTypeFacebook)
            facebookSheet.setInitialText("Share on Facebook")
//            self.present(facebookSheet, animated: true, completion: nil)
        } else {
            let alert = UIAlertController(title: "Accounts", message: "Please login to a Facebook account to share.", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
//            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func twitterTapped(img: AnyObject)
    {
        if SLComposeViewController.isAvailable(forServiceType: SLServiceTypeTwitter){
            let twitterSheet:SLComposeViewController = SLComposeViewController(forServiceType: SLServiceTypeTwitter)
            twitterSheet.setInitialText("Share on Twitter")
//            self.present(twitterSheet, animated: true, completion: nil)
        } else {
            let alert = UIAlertController(title: "Accounts", message: "Please login to a Twitter account to share.", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
//            self.present(alert, animated: true, completion: nil)
        }
    }
    
}
