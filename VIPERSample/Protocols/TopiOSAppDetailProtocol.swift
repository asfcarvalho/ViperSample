//
//  TopiOSAppDetailProtocol.swift
//  VIPERSample
//
//  Created by Anderson Carvalho on 10/01/19.
//  Copyright © 2019 asfcarvalho. All rights reserved.
//

import UIKit

protocol TopiOSAppDetailViewProtocol: class {
    
    var presenter: TopiOSAppDetailPresenterProtocol? { get set }
    
    //Presenter -> View
    func showDetail(for topiOSApp: TopiOSApp)
}

protocol TopiOSAppDetailWireFrameProtocol: class {
    static func createTopiOSAppDetailView(for topiOSApp: TopiOSApp) -> UIViewController
}

protocol TopiOSAppDetailPresenterProtocol: class {
    
    var view: TopiOSAppDetailViewProtocol? { get set }
    var topiOSApp: TopiOSApp? { get set }
    var wireFrame: TopiOSAppDetailWireFrameProtocol? { get set }
    
    //View -> Presenter
    func viewDidLoad()
}
