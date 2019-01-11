//
//  TopiOSAppListInteractor.swift
//  VIPERSample
//
//  Created by Anderson Carvalho on 10/01/19.
//  Copyright © 2019 asfcarvalho. All rights reserved.
//

class TopiOSAppListInteractor: TopiOSAppListInteractorInputProtocol {
    
    var remoteDataManager: TopiOSAppListRemoteDataManagerInputProtocol?
    var dataManager: TopiOSAppListDataManagerInputProtocol?
    weak var presenter: TopiOSAppListInteractorOutPutProtocol?
    
    func getTopiOSAppList() {
        
        do {
            if let topiOSAppList = try dataManager?.getTopiOSAppListFetch() {
                let topiOSAppList = TopiOSApp.map(map: topiOSAppList)
                
                if topiOSAppList.isEmpty {
                    remoteDataManager?.getTopiOSAppList()
                }else {
                    presenter?.getTopiOSAppListSuccess(topiOSAppList)
                }
            }else {
                remoteDataManager?.getTopiOSAppList()
            }
        }catch {
            presenter?.getTopiOSAppListSuccess([])
        }
    }
}

extension TopiOSAppListInteractor: TopiOSAppListDataManagerOutPutProtocol {
    func handleSuccess(_ get: [TopiOSApp]) {
        presenter?.getTopiOSAppListSuccess(get)
        
        for item in get {
            do {
                try dataManager?.createTopiOSAppList(name: item.name)
            }catch {
                
            }
            
        }
        
    }
    
    
}
