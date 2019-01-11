//
//  DetailProtocol.swift
//  VIPERSample
//
//  Created by Anderson Carvalho on 11/01/19.
//  Copyright © 2019 asfcarvalho. All rights reserved.
//

import UIKit

protocol DetailViewProtocol {
    var presenter: DetailPresenterProtocol? { get set }
    
    //Presenter -> View
    func showDetail(_ famous: Famous)
}

protocol DetailPresenterProtocol {
    var view: DetailViewProtocol? { get set }
    var famous: Famous? { get set }
    
    //View -> Presenter
    func viewDidLoad()
}

protocol DetailWireFrameProtocol: class {
    static func createDetailView(_ famous: Famous) -> UIViewController
}
