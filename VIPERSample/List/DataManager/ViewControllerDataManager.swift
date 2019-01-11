//
//  ViewControllerDataManager.swift
//  FrameworkSample
//
//  Created by Anderson Carvalho on 11/01/19.
//  Copyright © 2019 asfcarvalho. All rights reserved.
//

import UIKit


class ViewControllerDataManager: ViewControllerDataManagerInputProtocol {
    var dataHandler: ViewControllerDataManagerOutputProtocol?
    
    func getNewValue() {
        
        
        
        var request = URLRequest(url: URL(string: "https://andruxnet-random-famous-quotes.p.mashape.com/?cat=famous&count=3")!)
        request.allHTTPHeaderFields = ["X-Mashape-Key":"ZDeVZQatV0mshV17jAymbmIZ7UZZp1N114yjsnxzxd8gwErBu5",
                                       "Accept":"application/json"]
        URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) in
            
            if error != nil {
                self.dataHandler?.onError(error?.localizedDescription ?? "")
            }else {
                
                do {
                    
                    let jsonDecoder = JSONDecoder()
                    let famous = try jsonDecoder.decode([Famous].self, from: data!)
                    
                    self.dataHandler?.showValue(famous)
                }catch let jsonError {
                    self.dataHandler?.onError(jsonError.localizedDescription)
                }
            }
            
        }).resume()
        
    }
}
