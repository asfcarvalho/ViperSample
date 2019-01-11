//
//  TopiOSAppDetailView.swift
//  VIPERSample
//
//  Created by Anderson Carvalho on 10/01/19.
//  Copyright © 2019 asfcarvalho. All rights reserved.
//

import UIKit

class TopiOSAppDetailView: UIViewController {
    
    var presenter: TopiOSAppDetailPresenterProtocol?

    let nameText: UITextView = {
        let textView = UITextView()
        textView.isEditable = false
        return textView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(nameText)
        
        self.view.backgroundColor = UIColor.white
        
        self.presenter?.viewDidLoad()
        
        nameText.fillSuperview(padding: UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16))

    }

}

extension TopiOSAppDetailView: TopiOSAppDetailViewProtocol {
    
    func showDetail(for topiOSApp: TopiOSApp) {
        nameText.text = topiOSApp.name
    }
}
