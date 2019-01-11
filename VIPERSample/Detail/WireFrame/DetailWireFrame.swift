//
//  DetailWireFrame.swift
//  VIPERSample
//
//  Created by Anderson Carvalho on 11/01/19.
//  Copyright © 2019 asfcarvalho. All rights reserved.
//

import UIKit

class DetailWireFrame: DetailWireFrameProtocol {
   
    
    class func createDetailView(_ famous: Famous) -> UIViewController {
        
        var presenter: DetailPresenterProtocol = DetailPresenter()
        
        let viewController = DetailView.init(nibName: nil, bundle: nil)
        viewController.presenter = presenter
        presenter.view = viewController
        presenter.famous = famous
        
        return viewController
    }
}
