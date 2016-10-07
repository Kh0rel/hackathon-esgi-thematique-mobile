//
//  ExercisePageViewController.swift
//  UrDailyStep
//
//  Created by Flavian Mary on 06/10/2016.
//  Copyright © 2016 com.github.shemana. All rights reserved.
//

import UIKit

class ExercisePageViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var youtubePlayer: YTPlayerView!
    
    @IBOutlet weak var label_name: UILabel!
    
    @IBOutlet weak var label_rate: UILabel!
    
    @IBOutlet weak var text_description: UITextView!
    
    @IBOutlet weak var tableLevel: UITableView!
    var exo:ExerciseObject = ExerciseObject.init()
    
    var array:[(Int,String)] = [(1,"5 répétitions"),(2,"10 répétitions"),(3,"15 répétitions")]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        youtubePlayer.load(withPlaylistId:exo.idVideo)
        label_name.text = exo.name
        label_rate.text = "\(exo.rate)"
        text_description.text = exo.desc
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
        let cell:NiveauItem = tableLevel.dequeueReusableCell(withIdentifier: "CellLevel", for: indexPath) as! NiveauItem
        cell.index = indexPath
        let (d1,d2) = array[indexPath.item]
        cell.label_level.text = "\(d1)"
        cell.label_repetition.text = d2
        return cell
    }
}
