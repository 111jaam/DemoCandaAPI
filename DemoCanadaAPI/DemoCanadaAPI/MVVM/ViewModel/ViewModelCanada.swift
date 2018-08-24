//
//  ViewModelCanada.swift
//  DemoCanadaAPI
//
//  Created by Bharat Byan on 10/08/18.
//  Copyright © 2018 Bharat Byan. All rights reserved.
//

import Foundation


class ViewModelCanada{
    var thumbnail: URL?
    var title: String?
    var description: String?
    
    init(_ model: ModelCanada){
        
        title = model.title
        thumbnail = model.url_thumbnail
        description = model.description
    }
}
