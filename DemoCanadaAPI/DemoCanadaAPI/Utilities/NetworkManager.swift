//
//  NetworkManager.swift
//  DemoCanadaAPI
//
//  Created by Bharat Byan on 11/08/18.
//  Copyright © 2018 Bharat Byan. All rights reserved.
//

import Foundation
import SwiftyJSON

class Model_Request
{
    var str_BaseUrl: String?
    var str_ActionUrl: String?
    var str_ActionName: String?
    var str_PostData: String?
    var dict_Json: Dictionary< String, Any>?
}

protocol ParsingProtocol
{
    func getData(data:JSON?,error:Error?)
}

class NetworkManager: NSObject, URLSessionDataDelegate, URLSessionTaskDelegate
{
    var delegateNEIProtocol: ParsingProtocol?
    
    //Fetching a files content only
    func callWebService(model: Model_Request){
        let strURL = "https://dl.dropboxusercontent.com/s/2iodh4vg0eortkl/facts.json"
        var data: Data? = nil
        if let strUrl = URL(string: strURL) {
            do {
                data = try Data(contentsOf: strUrl)
                let strResponseInISOLatin = String(data: data!, encoding: String.Encoding.isoLatin1)
                if let dataFromString = strResponseInISOLatin!.data(using: .utf8, allowLossyConversion: false) {
                    let json = try JSON(data: dataFromString)
                    delegateNEIProtocol!.getData(data: json, error: nil)
                }
            } catch {
                print(error)
                // or display a dialog
            }
        }
    }
}
