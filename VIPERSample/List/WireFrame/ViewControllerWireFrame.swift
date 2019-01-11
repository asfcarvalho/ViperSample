//
//  ViewControllerWireFrame.swift
//  FrameworkSample
//
//  Created by Anderson Carvalho on 11/01/19.
//  Copyright © 2019 asfcarvalho. All rights reserved.
//

import UIKit

class ViewControllerWireFrame: ViewControllerWireFrameProtocol {
    
    class func createViewController() -> UIViewController {
    
        var presenter: ViewControllerPresenterProtocol & ViewControllerInteractorOutputProtocol = ViewControllerPresenter()
        var interactor: ViewControllerInteractorInputProntocol & ViewControllerDataManagerOutputProtocol = ViewControllerInteractor()
        var dataManager: ViewControllerDataManagerInputProtocol = ViewControllerDataManager()
        let wireFrame: ViewControllerWireFrameProtocol = ViewControllerWireFrame()
        
        let viewController = ViewController.init(nibName: nil, bundle: nil)
        viewController.presenter = presenter
        presenter.view = viewController
        presenter.interactor = interactor
        presenter.wireFrame = wireFrame
        interactor.presenter = presenter
        interactor.dataManager = dataManager
        dataManager.dataHandler = interactor
                
        return viewController
        
    }
    
    func presenterDetailScreen(from view: ViewControllerViewProtocol, forFamous famous: Famous) {
        
        
        let wierFrame = DetailWireFrame.createDetailView(famous)
        
        if let sourceView = view as? UIViewController {
            sourceView.navigationController?.pushViewController(wierFrame, animated: true)
        }
    }
}
