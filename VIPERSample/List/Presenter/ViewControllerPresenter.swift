//
//  ViewControllerPresenter.swift
//  FrameworkSample
//
//  Created by Anderson Carvalho on 11/01/19.
//  Copyright © 2019 asfcarvalho. All rights reserved.
//

import UIKit

class ViewControllerPresenter: ViewControllerPresenterProtocol {
    
    var view: ViewControllerViewProtocol?
    var interactor: ViewControllerInteractorInputProntocol?
    var wireFrame: ViewControllerWireFrameProtocol?
    
    func viewDidLoad() {
        view?.showLoading()
        interactor?.getNewValue()
    }
    
    
    func showDetailScreen(_ famous: Famous) {
        wireFrame?.presenterDetailScreen(from: view!, forFamous: famous)
    }
}

extension ViewControllerPresenter: ViewControllerInteractorOutputProtocol {
    
    func onError(_ error: String) {
        view?.stopLoading()
        view?.showError(error)
    }
    
    func showValue(_ famous: [Famous]) {
        view?.stopLoading()
        view?.showValue(famous)
    }
    

}
