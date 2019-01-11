//
//  DetailPresenter.swift
//  VIPERSample
//
//  Created by Anderson Carvalho on 11/01/19.
//  Copyright © 2019 asfcarvalho. All rights reserved.
//

import UIKit

class DetailPresenter: DetailPresenterProtocol {
    var famous: Famous?
    var view: DetailViewProtocol?
    
    func viewDidLoad() {
        view?.showDetail(famous!)
    }
}
