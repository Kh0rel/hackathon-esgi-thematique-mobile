//
//  NewsViewController.swift
//  UrDailyStep
//
//  Created by guillaume chieb bouares on 06/10/2016.
//  Copyright © 2016 com.github.shemana. All rights reserved.
//

import UIKit

class NewsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableActivity: UITableView!
    
    let array:[EventObject] = [
        EventObject.init(_identifiant: "toto", _location: 1, _position: 2, _level: 2),
        EventObject.init(_identifiant: "tata", _location: 3, _position: 1, _level: 1),
        EventObject.init(_identifiant: "titi", _location: 2, _position: 3, _level: 3),
        EventObject.init(_identifiant: "tutu", _location: 3, _position: 1, _level: 4),
        ]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
