//
//  ManagerCanadaList.swift
//  DemoCanadaAPI
//
//  Created by Bharat Byan on 11/08/18.
//  Copyright © 2018 Bharat Byan. All rights reserved.
//

import Foundation
import SwiftyJSON

class ManagerCanadaList{
    
    static let sharedInstance = ManagerCanadaList()
    var delegateManager: ManagerCanadaListProtocol?
    
    func createRequest()
    {
        let myRequest:Model_Request = Model_Request()
        myRequest.str_BaseUrl = URLCommon
        myRequest.str_ActionUrl = ActionURLCanadaList
        myRequest.str_ActionName = ActionNameCanadaList
        
        let webObj: NetworkManager = NetworkManager()
        webObj.delegateNEIProtocol = self
        webObj.callWebService(model: myRequest)
    }
}

protocol ManagerCanadaListProtocol
{
    func sendData(arrayOfViewModel: Array<ViewModelCanada>)
}

extension ManagerCanadaList: ParsingProtocol
{
    func getData(data: JSON?, error: Error?) {

        var arrViewModel: [ViewModelCanada] = []
        
        for (index, _) in data!["rows"].enumerated(){
            let itemCanada = data!["rows"][index]
            let modelParsed = ModelCanada(obj: itemCanada)
            let viewModel = ViewModelCanada(modelParsed)
            arrViewModel.append(viewModel)
        }
        
        delegateManager?.sendData(arrayOfViewModel: arrViewModel)
    }
}
