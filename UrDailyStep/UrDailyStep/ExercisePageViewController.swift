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
    override func viewDidLoad() {
        super.viewDidLoad()
        youtubePlayer.load(withPlaylistId:"CO93s3CmMiY")
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
