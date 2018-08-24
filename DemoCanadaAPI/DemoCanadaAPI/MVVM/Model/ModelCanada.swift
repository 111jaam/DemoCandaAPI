//
//  ModelCanada.swift
//  DemoCanadaAPI
//
//  Created by Bharat Byan on 10/08/18.
//  Copyright © 2018 Bharat Byan. All rights reserved.
//

import Foundation
import SwiftyJSON

class ModelCanada {
    var url_thumbnail : URL?
    var title : String?    
    var description : String?
    init(obj:JSON?) {
        self.title = obj!["title"].string
        self.description = obj!["description"].string
        self.url_thumbnail = obj!["imageHref"].url
    }
}
