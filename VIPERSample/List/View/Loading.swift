//
//  Loading.swift
//  FrameworkSample
//
//  Created by Anderson Carvalho on 11/01/19.
//  Copyright © 2019 asfcarvalho. All rights reserved.
//

import UIKit

class Loading {
    
    fileprivate static var viewLoading: UIView?
    
    static func showLoading(_ view: UIView) {
        
        viewLoading = UIView(frame: view.bounds)
        viewLoading?.backgroundColor = UIColor.gray.withAlphaComponent(0.9)
        
        let indicator = UIActivityIndicatorView(style: .whiteLarge)
        indicator.center = view.center
        indicator.startAnimating()
        indicator.hidesWhenStopped = true
        
        DispatchQueue.main.async {
            viewLoading?.addSubview(indicator)
            guard let value = viewLoading else { return }
            view.addSubview(value)
        }
        
    }
    
    static func stopLoading() {
        DispatchQueue.main.async {
            viewLoading?.removeFromSuperview()
        }
    }
}
