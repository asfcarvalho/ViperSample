//
//  TopiOSAppListProtocol.swift
//  VIPERSample
//
//  Created by Anderson Carvalho on 10/01/19.
//  Copyright © 2019 asfcarvalho. All rights reserved.
//

import UIKit

protocol TopiOSAppListWireFrameProtocol {
    static func createTopiOSAppListView() -> UIViewController
    func presenterTopiOSAppDetailScreen(from view: TopiOSAppListViewProtocol, for topiOSApp: TopiOSApp)
}

protocol TopiOSAppListInteractorInputProtocol {
    var presenter: TopiOSAppListInteractorOutPutProtocol? {get set}
    var dataManager: TopiOSAppListDataManagerInputProtocol? { get set }
    var remoteDataManager: TopiOSAppListRemoteDataManagerInputProtocol? { get set }
    //Presenter -> Interactor
    func getTopiOSAppList()
}

protocol TopiOSAppListInteractorOutPutProtocol: class {
    //Interactor -> Presenter
    func getTopiOSAppListSuccess(_ get: [TopiOSApp])
    
}

protocol TopiOSAppListDataManagerInputProtocol {
    //Interactor -> RemoteDataManager
    func getTopiOSAppListFetch() throws -> [TopiOSAppCoreData]
    func createTopiOSAppList(name: String) throws
}

protocol TopiOSAppListRemoteDataManagerInputProtocol {
    var remoteHandler: TopiOSAppListDataManagerOutPutProtocol? { get set }
    
    //Interactor -> RemoteDataManager
    func getTopiOSAppList()
}

protocol TopiOSAppListDataManagerOutPutProtocol: class {
    //RemoteDataManager -> Interactor
    func handleSuccess(_ get: [TopiOSApp])
}

protocol TopiOSAppListViewProtocol: class {
    
    var presenter: TopiOSAppListPresenterProtocol? { get set }
    
    //Presenter -> View
    func showTopiOSApp(with get: [TopiOSApp])
}

protocol TopiOSAppListPresenterProtocol {
    var view: TopiOSAppListViewProtocol? { get set }
    var interactor: TopiOSAppListInteractorInputProtocol? { get set }
    var wireFrame: TopiOSAppListWireFrameProtocol? { get set }
    
    //View -> Presenter
    func viewDidLoad()
    func showTopiOSAppDetailView(for topiOSApp: TopiOSApp)
}
