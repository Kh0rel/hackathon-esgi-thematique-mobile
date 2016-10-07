//
//  HomePageViewController.swift
//  UrDailyStep
//
//  Created by guillaume chieb bouares on 06/10/2016.
//  Copyright © 2016 com.github.shemana. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class HomePageViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableExercise: UITableView!
    @IBOutlet weak var indoor1: UIImageView!
    @IBOutlet weak var outdoor1: UIImageView!
    @IBOutlet weak var transport1: UIImageView!
    @IBOutlet weak var sit1: UIImageView!
    @IBOutlet weak var up1: UIImageView!
    @IBOutlet weak var down1: UIImageView!

    @IBOutlet weak var indoor2: UILabel!
    @IBOutlet weak var outdoor2: UILabel!
    @IBOutlet weak var transport2: UILabel!
    @IBOutlet weak var sit2: UILabel!
    @IBOutlet weak var up2: UILabel!
    @IBOutlet weak var down2: UILabel!
    
    var idLocation:Int = 0
    var idPosition:Int = 0
    var tappedOk:Bool = true
    
    var array:[String:(ExerciseObject,[Int],[String])] = [:]
//        ExerciseObject(iv:"F3Bp-Xt_CGo",r:4,n:"extensions",d:"voila une description"),
//        ExerciseObject(iv:"F3Bp-Xt_CGo",r:3,n:"pompes",d:"voila une description"),
//        ExerciseObject(iv:"F3Bp-Xt_CGo",r:2,n:"tractions",d:"voila une description"),
//        ExerciseObject(iv:"F3Bp-Xt_CGo",r:5,n:"abdo",d:"voila une description")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapGestureRecognizer = UITapGestureRecognizer(target:self, action:Selector("indoorTapped:"))
        indoor1.isUserInteractionEnabled = true
        indoor2.isUserInteractionEnabled = true
        indoor1.addGestureRecognizer(tapGestureRecognizer)
        indoor2.addGestureRecognizer(tapGestureRecognizer)
        
        let outdoortapGestureRecognizer = UITapGestureRecognizer(target:self, action:Selector("outdoorTapped:"))
        outdoor1.isUserInteractionEnabled = true
        outdoor2.isUserInteractionEnabled = true
        outdoor1.addGestureRecognizer(outdoortapGestureRecognizer)
        outdoor2.addGestureRecognizer(outdoortapGestureRecognizer)
        
        let transporttapGestureRecognizer = UITapGestureRecognizer(target:self, action:Selector("transportTapped:"))
        transport1.isUserInteractionEnabled = true
        transport2.isUserInteractionEnabled = true
        transport1.addGestureRecognizer(transporttapGestureRecognizer)
        transport2.addGestureRecognizer(transporttapGestureRecognizer)
        
        let sittapGestureRecognizer = UITapGestureRecognizer(target:self, action:Selector("sitTapped:"))
        sit1.isUserInteractionEnabled = true
        sit2.isUserInteractionEnabled = true
        sit1.addGestureRecognizer(sittapGestureRecognizer)
        sit2.addGestureRecognizer(sittapGestureRecognizer)
        
        let uptapGestureRecognizer = UITapGestureRecognizer(target:self, action:Selector("upTapped:"))
        up1.isUserInteractionEnabled = true
        up2.isUserInteractionEnabled = true
        up1.addGestureRecognizer(uptapGestureRecognizer)
        up2.addGestureRecognizer(uptapGestureRecognizer)
        
        let downtapGestureRecognizer = UITapGestureRecognizer(target:self, action:Selector("downTapped:"))
        down1.isUserInteractionEnabled = true
        down2.isUserInteractionEnabled = true
        down1.addGestureRecognizer(downtapGestureRecognizer)
        down2.addGestureRecognizer(downtapGestureRecognizer)
        
        self.getResult()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:ExerciseItem = tableExercise.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! ExerciseItem
        cell.index = indexPath
        let componentArray = Array(array.keys)
        
        var full:(ExerciseObject,[Int],[String]) = array[componentArray[indexPath.item]]!
        let exo:ExerciseObject = full.0
        cell.label.text = exo.name
        cell.picture.contentMode = .scaleAspectFit
        downloadImage(id: exo.idVideo,img: cell.picture)
        
        return cell
    }
    
    func getDataFromUrl(url: URL, completion: @escaping (_ data: Data?, _  response: URLResponse?, _ error: Error?) -> Void) {
        URLSession.shared.dataTask(with: url) {
            (data, response, error) in
            completion(data, response, error)
            }.resume()
    }
    
    func downloadImage(id: String,img: UIImageView) {
        var url_string = "https://i.ytimg.com/vi/"
        let url_end = "/maxresdefault.jpg"
        url_string.append(id)
        url_string.append(url_end)
        if let checkedUrl = URL(string:url_string){
            getDataFromUrl(url: checkedUrl) { (data, response, error)  in
                DispatchQueue.main.sync() { () -> Void in
                    guard let data = data, error == nil else { return }
                    img.image = UIImage(data: data)
                }
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "clickExercise" {
            let cell = sender as! ExerciseItem
            
            let componentArray = Array(array.keys)
            
            var full:(ExerciseObject,[Int],[String]) = array[componentArray[cell.index.item]]!
            let exo:ExerciseObject = full.0
            let dest:ExercisePageViewController = segue.destination as! ExercisePageViewController
            dest.exo = exo
        }
    }
    
    
    
    func indoorTapped(_ img: AnyObject)
    {
        if tappedOk {
        tappedOk = false;
        idLocation = idLocation == 1 ? 0 : 1
        getResult()
        }
    }
    func outdoorTapped(_ img: AnyObject)
    {
        if tappedOk {
        tappedOk = false;
        idLocation = idLocation == 2 ? 0 : 2
        getResult()
        }
    }
    func transportTapped(_ img: AnyObject)
    {
        if tappedOk {
        tappedOk = false;
        idLocation = idLocation == 3 ? 0 : 3
        getResult()
        }
    }
    func sitTapped(_ img: AnyObject)
    {
        if tappedOk {
        tappedOk = false;
        idPosition = idPosition == 1 ? 0 : 1
        getResult()
        }
    }
    func upTapped(_ img: AnyObject)
    {
        if tappedOk {
        tappedOk = false;
        idPosition = idPosition == 2 ? 0 : 2
        getResult()
        }
    }
    func downTapped(_ img: AnyObject)
    {
        if tappedOk {
            tappedOk = false;
            idPosition = idPosition == 3 ? 0 : 3
            getResult()
        }
    }
    
    
    func getResult(){
        var urlCourant:String = "https://hackathon-esgi.herokuapp.com/api_esgi_hackathon/exercices"
        
        if idPosition == 0 && idLocation == 0{
            urlCourant.append("/")
        }else if idPosition == 0 && idLocation != 0{
            urlCourant.append("l/")
            urlCourant.append("\(idLocation)")
        }else if idLocation == 0 && idPosition != 0{
            urlCourant.append("p/")
            urlCourant.append("\(idPosition)")
        }else{
            urlCourant.append("lp/")
            urlCourant.append("\(idLocation)")
            urlCourant.append("/")
            urlCourant.append("\(idPosition)")
        }
        
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
    
    
    
    func insertValue(data:JSON) {
        print("\(data)")
        let json = data["Result"]
        array = [:]
        for index in 0...(json.count-1){
            if array[json[index]["exer_name"].stringValue] == nil {
                array[json[index]["exer_name"].stringValue] =
                (ExerciseObject.init(
                    iv: (json[index]["exer_link"] == nil ? "" : json[index]["exer_link"].stringValue),
                    r: json[index]["exer_rate"].intValue,
                    n: json[index]["exer_name"].stringValue,
                    d: json[index]["exer_description"].stringValue),
                [json[index]["exer_level"].intValue],
                [json[index]["exer_repetition"].stringValue])
            }else{
                var full:(ExerciseObject,[Int],[String]) = array[json[index]["exer_name"].stringValue]!
                full.1 += [json[index]["exer_level"].intValue]
                full.2 += [json[index]["exer_repetition"].stringValue]
                array[json[index]["exer_name"].stringValue] = (full.0,full.1,full.2)
            }
        }
        DispatchQueue.main.async{
            self.tableExercise.reloadData()
        }
        tappedOk = true;
    }
    
    
    
    

}
