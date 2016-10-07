//
//  ProfilObject.swift
//  UrDailyStep
//
//  Created by Flavian Mary on 06/10/2016.
//  Copyright © 2016 com.github.shemana. All rights reserved.
//

class ProfilObject: NSObject {
    
    var id:Int
    var avatar:UIImage?
    var identifiant:String
    var follower:Int
    var following:Int
    var isFollow:Bool
    
    override init() {
        id = 0
        avatar = nil
        identifiant = ""
        follower = 0
        following = 0
        isFollow = false
    }
    
    init(_identifiant:String,_follower:Int,_following:Int,_isFollow:Bool) {
        id = 0
        avatar = nil
        identifiant = _identifiant
        follower = _follower
        following = _following
        isFollow = _isFollow
    }
    
    init(_avatar:Data,_identifiant:String,_follower:Int,_following:Int,_isFollow:Bool) {
        id = 0
        avatar = UIImage(data: _avatar)
        identifiant = _identifiant
        follower = _follower
        following = _following
        isFollow = _isFollow
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
