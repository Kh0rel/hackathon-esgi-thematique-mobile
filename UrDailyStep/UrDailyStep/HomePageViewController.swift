//
//  HomePageViewController.swift
//  UrDailyStep
//
//  Created by guillaume chieb bouares on 06/10/2016.
//  Copyright © 2016 com.github.shemana. All rights reserved.
//

import UIKit

class HomePageViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableExercise: UITableView!

    
    var array:[ExerciseObject] = [
        ExerciseObject(iv:"F3Bp-Xt_CGo",r:4,n:"extensions",d:"voila une description"),
        ExerciseObject(iv:"F3Bp-Xt_CGo",r:3,n:"pompes",d:"voila une description"),
        ExerciseObject(iv:"F3Bp-Xt_CGo",r:2,n:"tractions",d:"voila une description"),
        ExerciseObject(iv:"F3Bp-Xt_CGo",r:5,n:"abdo",d:"voila une description")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        collectionExercise.delegate = self;
//        collectionExercise.dataSource = self;
//        collectionExercise.register(ExerciseItem.self, forCellWithReuseIdentifier: "Cell")

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
        let cell:ExerciseItem = tableExercise.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! ExerciseItem
        cell.index = indexPath
        let exo:ExerciseObject = array[indexPath.item]
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
                    print(response?.suggestedFilename ?? checkedUrl.lastPathComponent)
                    print("Download Finished")
                    img.image = UIImage(data: data)
                }
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "clickExercise" {
            let cell = sender as! ExerciseItem
            let exo:ExerciseObject = array[cell.index.item]
            let dest:ExercisePageViewController = segue.destination as! ExercisePageViewController
            dest.exo = exo
        }
    }
    
    
    

}
