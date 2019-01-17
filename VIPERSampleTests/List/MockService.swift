//
//  MockService.swift
//  VIPERSampleTests
//
//  Created by Anderson Carvalho on 16/01/19.
//  Copyright © 2019 asfcarvalho. All rights reserved.
//

import UIKit
@testable import VIPERSample

class MockService: ViewControllerDataManagerInputProtocol {
    var dataHandler: ViewControllerDataManagerOutputProtocol?
    
    func getNewValue() {
        dataHandler?.showValue([Famous]())
        dataHandler?.onError("error")
    }
}
