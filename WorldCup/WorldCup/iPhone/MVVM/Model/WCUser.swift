//
//  WCUser.swift
//  WorldCup
//
//  Created by Alexander Ynoñan H. on 20/01/23.
//

import Alamofire
import CLDUtilities
import UIKit

class WCUser: NSObject, NSSecureCoding {

    var session_token          : String?

    static var supportsSecureCoding: Bool = true
    
    static var shared    : WCUser?
    
    override init() {
        super.init()
    }

    init(json : CSJSON? = nil) {
        self.session_token  = json?.dictionary["token"]?.stringValue ?? ""
    }
  
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.session_token ,forKey: "token")
    }
    
    required init?(coder: NSCoder) {
        self.session_token       = coder.decodeObject(forKey: "token") as? String ?? ""
    }
    
    var getToken : HTTPHeaders {
        let dic = ["Authorization" : "Bearer \(self.session_token ?? "")"]
        return HTTPHeaders(dic)
    }

}
