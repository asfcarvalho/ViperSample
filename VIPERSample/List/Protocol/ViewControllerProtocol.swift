//
//  ViewControllerProtocol.swift
//  FrameworkSample
//
//  Created by Anderson Carvalho on 11/01/19.
//  Copyright © 2019 asfcarvalho. All rights reserved.
//

import UIKit

protocol ViewControllerViewProtocol {
    
    var presenter: ViewControllerPresenterProtocol? { get set}
    
    //Presenter -> View
    func showValue(_ famous: [Famous])
    func showError(_ error: String)
    func showLoading()
    func stopLoading()
}

protocol ViewControllerPresenterProtocol {
    var view: ViewControllerViewProtocol? { get set }
    var interactor: ViewControllerInteractorInputProntocol? { get set }
    var wireFrame: ViewControllerWireFrameProtocol? { get set }
    
    //View -> Presenter
    func viewDidLoad()
    func showDetailScreen(_ famous: Famous)
}

protocol ViewControllerWireFrameProtocol: class {
    static func createViewController() -> UIViewController
    
    //Presenter -> WireFrame
    func presenterDetailScreen(from view: ViewControllerViewProtocol, forFamous famous: Famous)
}

protocol ViewControllerInteractorOutputProtocol: class {
    
    //Interactor -> Presenter
    func showValue(_ famous: [Famous])
    
    func onError(_ error: String)
}

protocol ViewControllerInteractorInputProntocol {
    var presenter: ViewControllerInteractorOutputProtocol? { get set}
    var dataManager: ViewControllerDataManagerInputProtocol? { get set }
    
    //Presetner -> Interactor
    func getNewValue()
}

protocol ViewControllerDataManagerOutputProtocol {
    
    //DataManager -> Interactor
    func showValue(_ famous: [Famous])
    
    func onError(_ error: String)
}

protocol ViewControllerDataManagerInputProtocol {
    
    var dataHandler: ViewControllerDataManagerOutputProtocol? { get set }
    
    //Interactor -> DataManager
    func getNewValue()
}
