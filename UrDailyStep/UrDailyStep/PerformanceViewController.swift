//
//  PerformanceViewController.swift
//  UrDailyStep
//
//  Created by guillaume chieb bouares on 06/10/2016.
//  Copyright © 2016 com.github.shemana. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class PerformanceViewController: UIViewController, UISearchBarDelegate {
    
    
    @IBOutlet weak var avatar: UIImageView!
    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var number_follower: UILabel!
    @IBOutlet weak var number_following: UILabel!
    @IBOutlet weak var label_1: UILabel!
    @IBOutlet weak var label_2: UILabel!
    @IBOutlet weak var button: UIButton!
    
    @IBOutlet weak var search: UISearchBar!
    
    var hide:Bool = true
    var isFollow = false;
    var otherId = 0;

    override func viewDidLoad() {
        super.viewDidLoad()
        self.updateDisplay()
        
        search.delegate = self
        // Do any additional setup after loading the view.
    }
    
    func updateDisplay(){
        self.avatar.isHidden = hide
        self.username.isHidden = hide
        self.label_1.isHidden = hide
        self.label_2.isHidden = hide
        self.number_follower.isHidden = hide
        self.number_following.isHidden = hide
        self.button.isHidden = hide
    }
    
    var url:String = "https://hackathon-esgi.herokuapp.com/api_esgi_hackathon/user-detail/"
    
    func getDonne(pseudo:String) {
        var urlCourant = url
        urlCourant.append(pseudo)
        urlCourant.append("/1")
        
        Alamofire.request(urlCourant).validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                self.insertValue(data: json)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func insertValue(data:JSON){
//        print("JSON: \(data)")
        view.endEditing(true)
        hide = false
        self.updateDisplay()
        username.text = data["Result"]["user_surname"].stringValue
        number_follower.text = data["Result"]["followers"].stringValue
        number_following.text = data["Result"]["following"].stringValue
        
        isFollow = data["Result"]["isFollow"].boolValue
        otherId = data["Result"]["user_id"].intValue
        
        if isFollow {
            button.setTitle("Unfollow", for: .normal)
        }else{
            button.setTitle("Follow", for: .normal)
        }
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        getDonne(pseudo: searchBar.text!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func follow_or_not(_ sender: AnyObject) {
        var url = "https://hackathon-esgi.herokuapp.com/api_esgi_hackathon/"
        if isFollow {
            url.append("/unfollow/1/")
            url.append("\(otherId)")
            Alamofire.request(url, method: .delete).validate().responseJSON { response in
                switch response.result {
                case .success(let value):
                    let json = JSON(value)
                    print("\(json)")
                    self.insertValue(data: json)
                case .failure(let error):
                    print(error)
                }
            }
            
        }else{
            url.append("/follow/1/")
            url.append("\(otherId)")
            Alamofire.request(url, method: .post).validate().responseJSON { response in
                switch response.result {
                case .success(let value):
                    let json = JSON(value)
                    print("\(json)")
                    self.insertValue(data: json)
                case .failure(let error):
                    print(error)
                }
            }
        }
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
