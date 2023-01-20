//
//  WCHome.swift
//  WorldCup
//
//  Created by Alexander Ynoñan H. on 20/01/23.
//

import CLDUtilities
import SwiftyJSON

struct WCHome {

    var image: String
    var title: String
    
    init(_ json: CSJSON? = nil) {
        self.image = json?.dictionary["flag"]?.stringValue ?? ""
        self.title = json?.dictionary["name_en"]?.stringValue ?? ""
    }
}
