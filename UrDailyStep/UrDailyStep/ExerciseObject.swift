//
//  File.swift
//  UrDailyStep
//
//  Created by Flavian Mary on 06/10/2016.
//  Copyright © 2016 com.github.shemana. All rights reserved.
//

class ExerciseObject: NSObject {
    
    var id:Int
    var idVideo:String
    var rate:Int
    var name:String
    var desc:String
    
    override init() {
        id = 0
        idVideo = ""
        rate = 4
        name = ""
        desc = ""
    }
    init(iv:String,r:Int,n:String,d:String) {
        id = 0
        idVideo = iv
        rate = r
        name = n
        desc = d
    }
    
    func toString() ->String {
        return "\(self.name)"
    }
    
//    class func parseJson(json:NSDictionary) -> User{
//        let user:User = User.init()
//        
//        user.id = json["id"] as! Int
//        user.login = json["email"] as! String
//        user.password = json["password"] as! String
//        user.firstName = json["first_name"] as! String
//        user.familyName = json["family_name"] as! String
//        
//        return user
//    }
    
}
