//
//  TopiOSAppListPresenter.swift
//  VIPERSample
//
//  Created by Anderson Carvalho on 10/01/19.
//  Copyright © 2019 asfcarvalho. All rights reserved.
//

import UIKit

class TopiOSAppListPresenter: TopiOSAppListPresenterProtocol {
    
    weak var view: TopiOSAppListViewProtocol?
    var wireFrame: TopiOSAppListWireFrameProtocol?
    var interactor: TopiOSAppListInteractorInputProtocol?
    
    func viewDidLoad() {
        
        interactor?.getTopiOSAppList()
    }
    
    func showTopiOSAppDetailView(for topiOSApp: TopiOSApp) {
        wireFrame?.presenterTopiOSAppDetailScreen(from: view!, for: topiOSApp)
    }
}

extension TopiOSAppListPresenter: TopiOSAppListInteractorOutPutProtocol {
    func getTopiOSAppListSuccess(_ get: [TopiOSApp]) {
        view?.showTopiOSApp(with: get)
    }
}
