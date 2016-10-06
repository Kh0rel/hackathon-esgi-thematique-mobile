//
//  MarketDetailViewController.swift
//  UrDailyStep
//
//  Created by guillaume chieb bouares on 06/10/2016.
//  Copyright © 2016 com.github.shemana. All rights reserved.
//

import UIKit
import iCarousel

class MarketDetailViewController: UIViewController,iCarouselDataSource, iCarouselDelegate {
    
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productDescribeArea: UITextView!

    @IBOutlet weak var productQuantityLeftLabel: UILabel!
    @IBOutlet weak var productQuantityWish: UITextField!
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    @IBOutlet weak var carousel: iCarousel!
    var product:Product?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        carousel.type = .rotary
        productNameLabel.text = product?.name
        productDescribeArea.text = product?.describe
        if let quantityLeft = product?.quantityLeft {
            productQuantityLeftLabel.text = "\(quantityLeft)"
        }
        
        
        
        
        
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        carousel.reloadData()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
     * Carousel handler
     */
    override func awakeFromNib()
    {
        super.awakeFromNib()
    }
    
    func numberOfItems(in carousel: iCarousel) -> Int
    {
        return (product?.image.count)!
    }
    
    func carousel(_ carousel: iCarousel, viewForItemAt index: Int, reusing view: UIView?) -> UIView
    {
        var itemView: UIImageView
        
        //create new view if no view is available for recycling
        if (view == nil)
        {
            //don't do anything specific to the index within
            //this `if (view == nil) {...}` statement because the view will be
            //recycled and used with other index values later
            itemView = UIImageView(frame:CGRect(x:0, y:0, width:200, height:150))
            itemView.image = UIImage(named: (product?.image[index])!)
        }
        else
        {
            //get a reference to the label in the recycled view
            itemView = view as! UIImageView;
        }
        
        //set item label
        //remember to always set any properties of your carousel item
        //views outside of the `if (view == nil) {...}` check otherwise
        //you'll get weird issues with carousel item content appearing
        //in the wrong place in the carousel
        
        return itemView
    }
    
    func carousel(_ carousel: iCarousel, valueFor option: iCarouselOption, withDefault value: CGFloat) -> CGFloat
    {
        if (option == .spacing)
        {
            return value * 1.2
        }
        return value
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
