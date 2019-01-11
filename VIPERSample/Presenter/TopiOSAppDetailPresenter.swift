//
//  TopiOSAppDetailPresenter.swift
//  VIPERSample
//
//  Created by Anderson Carvalho on 10/01/19.
//  Copyright © 2019 asfcarvalho. All rights reserved.
//

import UIKit

class TopiOSAppDetailPresenter: TopiOSAppDetailPresenterProtocol {
    
    var topiOSApp: TopiOSApp?
    var view: TopiOSAppDetailViewProtocol?
    var wireFrame: TopiOSAppDetailWireFrameProtocol?
    
    func viewDidLoad() {
        view?.showDetail(for: topiOSApp!)
    }
}
