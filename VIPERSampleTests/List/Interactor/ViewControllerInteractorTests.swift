//
//  ViewControllerInteractorTests.swift
//  VIPERSampleTests
//
//  Created by Anderson Carvalho on 16/01/19.
//  Copyright © 2019 asfcarvalho. All rights reserved.
//

import XCTest
@testable import VIPERSample

class ViewControllerInteractorTests: XCTestCase {
    var dataManager: ViewControllerDataManagerInputProtocol!
    var presenter: MockPresenter!
    
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        dataManager = MockService()
        presenter = MockPresenter()
        dataManager.dataHandler = presenter
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    class MockPresenter: ViewControllerDataManagerOutputProtocol {
        var famous: [Famous]?
        var error: String?
        
        func showValue(_ famous: [Famous]) {
            self.famous = famous
        }
        
        func onError(_ error: String) {
            self.error = error
        }
    }
    
    func testNewValue() {
        dataManager.getNewValue()
        XCTAssertTrue(presenter.famous != nil)
        XCTAssertFalse(presenter.error != "error")
    }
    
    func testeNewValueError() {
        dataManager.getNewValue()
        XCTAssertFalse(presenter.famous == nil)
        XCTAssertTrue(presenter.error == "error")
    }
    
}
