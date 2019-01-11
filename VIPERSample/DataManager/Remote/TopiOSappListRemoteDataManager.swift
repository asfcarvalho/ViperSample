//
//  TopiOSappListRemoteDataManager.swift
//  VIPERSample
//
//  Created by Anderson Carvalho on 10/01/19.
//  Copyright © 2019 asfcarvalho. All rights reserved.
//

import UIKit

class TopiOSappListRemoteDataManager: TopiOSAppListRemoteDataManagerInputProtocol {
    var remoteHandler: TopiOSAppListDataManagerOutPutProtocol?
    
    func getTopiOSAppList() {
        var topiOSApp = [TopiOSApp]()
        for item in 0 ... 2 {
            topiOSApp.append(TopiOSApp(name: "Teste " + item.description))
        }
        remoteHandler?.handleSuccess(topiOSApp)
    }
}
