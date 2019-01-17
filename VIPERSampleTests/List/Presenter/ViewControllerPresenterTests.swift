//
//  ViewControllerPresenterTests.swift
//  VIPERSampleTests
//
//  Created by Anderson Carvalho on 16/01/19.
//  Copyright © 2019 asfcarvalho. All rights reserved.
//

import XCTest
@testable import VIPERSample

class ViewControllerPresenterTests: XCTestCase {
    
    var presenter: ViewControllerPresenter!
    var interactor: MockInteractor!
    var view: MockView!
    
    override func setUp() {
        
        presenter = ViewControllerPresenter()
        view = MockView()
        interactor = MockInteractor()
        presenter.interactor = interactor
        interactor.presenter = view
    }
    
    class MockInteractor: ViewControllerInteractorInputProntocol {
        var presenter: ViewControllerInteractorOutputProtocol?
        
        var dataManager: ViewControllerDataManagerInputProtocol?
        
        func getNewValue() {
            presenter?.showValue([Famous]())
            presenter?.onError("error")
        }
        
        
    }
    
    class MockView: ViewControllerInteractorOutputProtocol {
        
        var famous: [Famous]?
        var error: String?
        
        func showValue(_ famous: [Famous]) {
            self.famous = famous
        }
        
        func onError(_ error: String) {
            self.error = error
        }
    }
    
    func testeShowValue() {
        presenter.viewDidLoad()
        XCTAssertTrue(view.famous != nil)
        XCTAssertFalse(view.error != "error")
    }
}


