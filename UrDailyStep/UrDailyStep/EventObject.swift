//
//  EventObject.swift
//  UrDailyStep
//
//  Created by Flavian Mary on 06/10/2016.
//  Copyright © 2016 com.github.shemana. All rights reserved.
//

class EventObject: NSObject {
    
    var id:Int
    var avatar:UIImage?
    var identifiant:String
    var location:Int
    var position:Int
    var level:Int
    
    override init() {
        id = 0
        avatar = nil
        identifiant = ""
        location = 1
        position = 2
        level = 1
    }
    
    init(_identifiant:String,_location:Int,_position:Int,_level:Int) {
        id = 0
        avatar = nil
        identifiant = _identifiant
        location = _location
        position = _position
        level = _level
    }
    
    init(_avatar:Data,_identifiant:String,_location:Int,_position:Int,_level:Int) {
        id = 0
        avatar = UIImage(data: _avatar)!
        identifiant = _identifiant
        location = _location
        position = _position
        level = _level
    }
    
    func toString() ->String {
        return "\(self.identifiant)"
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
