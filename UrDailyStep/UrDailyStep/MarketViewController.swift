//
//  MarketViewController.swift
//  UrDailyStep
//
//  Created by guillaume chieb bouares on 06/10/2016.
//  Copyright © 2016 com.github.shemana. All rights reserved.
//

import UIKit

class MarketViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    var products:[Product] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        products = Product.mockedProduct()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MarketTableViewCell", for: indexPath) as! MarketTableViewCell
        
        cell.position = indexPath.row
        cell.nameLabel.text = products[indexPath.row].name!
        cell.priceLabel.text = "\(products[indexPath.row].price!) euros"
    
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showProduct" {
            let marketDetail = segue.destination as! MarketDetailViewController
            if let cell = sender as? MarketTableViewCell {
                marketDetail.product = products[cell.position]
            }
        }
    }
 

}
