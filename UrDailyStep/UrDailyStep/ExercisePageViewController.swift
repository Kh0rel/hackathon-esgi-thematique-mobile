//
//  ExercisePageViewController.swift
//  UrDailyStep
//
//  Created by Flavian Mary on 06/10/2016.
//  Copyright © 2016 com.github.shemana. All rights reserved.
//

import UIKit

class ExercisePageViewController: UIViewController {
    
    @IBOutlet weak var youtubePlayer: YTPlayerView!
    
    @IBOutlet weak var label_name: UILabel!
    
    @IBOutlet weak var label_rate: UILabel!
    
    @IBOutlet weak var text_description: UITextView!
    
    var exo:ExerciseObject = ExerciseObject.init()
    
    
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
    
}
