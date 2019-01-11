//
//  TopiOSApp.swift
//  VIPERSample
//
//  Created by Anderson Carvalho on 10/01/19.
//  Copyright © 2019 asfcarvalho. All rights reserved.
//

import UIKit

struct TopiOSApp {
    let name: String
}

extension TopiOSApp {
    static func map(map: [TopiOSAppCoreData]) -> [TopiOSApp] {
        var topiOSAppList = [TopiOSApp]()
        
        for item in map {
            topiOSAppList.append(TopiOSApp(name: item.name ?? ""))
        }
        
        return topiOSAppList
    }
}
