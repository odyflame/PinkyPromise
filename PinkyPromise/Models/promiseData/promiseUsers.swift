//
//  promiseUsers.swift
//  PinkyPromise
//
//  Created by apple on 2020/01/19.
//  Copyright © 2020 hyejikim. All rights reserved.
//

import Foundation
import Firebase

class PromiseUser {
    private(set) var userName: String!
    private(set) var userFriends: Array<String>!
    init(userName: String, userFriends: Array<String>) {
        self.userName = userName
        self.userFriends = userFriends
    }
    
    class func parseData(snapShot: QuerySnapshot?) -> [PromiseUser] {
        var promiseuser = [PromiseUser]()
        
        guard let snap = snapShot else { return promiseuser }
        for document in snap.documents {
            let data = document.data()
            let datauser = data[USERNAME] as? String ?? "Anonymous"
            let datauserFriends = data[USERFRIENDS] as? Array<String> ?? []
            let newdatauser = PromiseUser(userName: datauser, userFriends: datauserFriends)
            promiseuser.append(newdatauser)
        }
        
        return promiseuser
    }
}