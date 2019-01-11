//
//  ViewControllerInteractor.swift
//  FrameworkSample
//
//  Created by Anderson Carvalho on 11/01/19.
//  Copyright © 2019 asfcarvalho. All rights reserved.
//

import UIKit

class ViewControllerInteractor: ViewControllerInteractorInputProntocol {
    var dataManager: ViewControllerDataManagerInputProtocol?
    weak var presenter: ViewControllerInteractorOutputProtocol?
    
    
    func getNewValue() {
        dataManager?.getNewValue()
    }
}

extension ViewControllerInteractor: ViewControllerDataManagerOutputProtocol {
    func onError(_ error: String) {
        presenter?.onError(error)
    }
    
    func showValue(_ famous: [Famous]) {
        presenter?.showValue(famous)
    }
    
}
