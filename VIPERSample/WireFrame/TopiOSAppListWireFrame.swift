//
//  TopiOSAppListWireFrame.swift
//  VIPERSample
//
//  Created by Anderson Carvalho on 10/01/19.
//  Copyright © 2019 asfcarvalho. All rights reserved.
//

import UIKit

class TopiOSAppListWireFrame: TopiOSAppListWireFrameProtocol {
    
    

    class func createTopiOSAppListView() -> UIViewController {
        
        var presenter: TopiOSAppListPresenterProtocol & TopiOSAppListInteractorOutPutProtocol = TopiOSAppListPresenter()
        var interactor: TopiOSAppListInteractorInputProtocol & TopiOSAppListDataManagerOutPutProtocol = TopiOSAppListInteractor()
        let dataManager: TopiOSAppListDataManagerInputProtocol = TopiOSappListDataManager()
        var remoteDataManager: TopiOSAppListRemoteDataManagerInputProtocol = TopiOSappListRemoteDataManager()
        let wireFrame: TopiOSAppListWireFrameProtocol = TopiOSAppListWireFrame()
        
        let viewController = TopiOSAppListView.init(nibName: nil, bundle: nil)
        viewController.presenter = presenter
        presenter.view = viewController
        presenter.interactor = interactor
        presenter.wireFrame = wireFrame
        interactor.presenter = presenter
        interactor.dataManager = dataManager
        interactor.remoteDataManager = remoteDataManager
        remoteDataManager.remoteHandler = interactor
        
        return viewController
    }
    
    func presenterTopiOSAppDetailScreen(from view: TopiOSAppListViewProtocol, for topiOSApp: TopiOSApp) {
        
        let topiOSAppDetailView = TopiOSAppDetailWireFrame.createTopiOSAppDetailView(for: topiOSApp)
        
        if let sourceView = view as? UIViewController {
            sourceView.navigationController?.pushViewController(topiOSAppDetailView, animated: true)
        }
    }
}
