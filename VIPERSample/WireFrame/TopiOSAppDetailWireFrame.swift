//
//  TopiOSAppDetailWireFrame.swift
//  VIPERSample
//
//  Created by Anderson Carvalho on 10/01/19.
//  Copyright © 2019 asfcarvalho. All rights reserved.
//

import UIKit

class TopiOSAppDetailWireFrame: TopiOSAppDetailWireFrameProtocol {

    class func createTopiOSAppDetailView(for topiOSApp: TopiOSApp) -> UIViewController {
    
        let presenter: TopiOSAppDetailPresenterProtocol = TopiOSAppDetailPresenter()
        let wireFrame: TopiOSAppDetailWireFrameProtocol = TopiOSAppDetailWireFrame()
        
        let viewController = TopiOSAppDetailView.init(nibName: nil, bundle: nil)
        
        viewController.presenter = presenter
        presenter.view = viewController
        presenter.topiOSApp = topiOSApp
        presenter.wireFrame = wireFrame
        
        return viewController
        
    }
}
