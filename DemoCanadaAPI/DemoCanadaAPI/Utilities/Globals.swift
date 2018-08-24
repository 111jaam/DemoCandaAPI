//
//  Globals.swift
//  DemoCanadaAPI
//
//  Created by Bharat Byan on 11/08/18.
//  Copyright © 2018 Bharat Byan. All rights reserved.
//

import Foundation

let isIntenetAvailable = Reachability()?.isReachable


#if DEBUGX
let SERVER_URL = "http://dev.server.com/api/"
let API_TOKEN = "DI2023409jf90ew"
#else
let SERVER_URL = "http://prod.server.com/api/"
let API_TOKEN = "71a629j0f090232"
#endif
