//
//  NewsViewController.swift
//  UrDailyStep
//
//  Created by guillaume chieb bouares on 06/10/2016.
//  Copyright © 2016 com.github.shemana. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class NewsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableActivity: UITableView!
    
    var array:[EventObject] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let urlCourant = "https://hackathon-esgi.herokuapp.com/api_esgi_hackathon/following/1"
        Alamofire.request(urlCourant).validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                self.getNews(data: json)
            case .failure(let error):
                print(error)
            }
        }
        // Do any additional setup after loading the view.
    }
    
    func getNews(data:JSON){
        print("\(data)")
        var urlCourant = "https://hackathon-esgi.herokuapp.com/api_esgi_hackathon/news-feed/1"
        for index in 0...(data["Result"].count-1) {
            urlCourant.append(",")
            urlCourant.append(data["Result"][index]["following"].stringValue)
        }
        print("\(urlCourant)")
        
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
        print("\(data)")
        
        let json = data["Result"]
        
        for index in 0...(json.count-1){
            array.append(
                EventObject.init(
                    _identifiant: json[index]["a_idUser"].stringValue,
                    _location: json[index]["a_idUser"].intValue,
                    _position: json[index]["a_idUser"].intValue,
                    _level: json[index]["a_idUser"].intValue))
        }
        DispatchQueue.main.async{
            self.tableActivity.reloadData()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:ActualityItem = tableActivity.dequeueReusableCell(withIdentifier: "CellActuality", for: indexPath) as! ActualityItem
        let event = array[indexPath.item]
        cell.avatar.image = event.avatar == nil ? UIImage(named: "no_avatar") : event.avatar
        cell.identifiant.text = event.identifiant
        cell.level.text = "\(event.level)"
        cell.location.image =
            event.location == 1 ? UIImage(named: "mini_location_1") :
            event.location == 2 ? UIImage(named: "mini_location_2") : UIImage(named: "mini_location_3")
        cell.position.image =
            event.position == 1 ? UIImage(named: "mini_position_1") :
            event.position == 2 ? UIImage(named: "mini_position_2") : UIImage(named: "mini_position_3")

        return cell
    }

}
