//
//  TopiOSAppListView.swift
//  VIPERSample
//
//  Created by Anderson Carvalho on 10/01/19.
//  Copyright © 2019 asfcarvalho. All rights reserved.
//

import UIKit

class TopiOSAppListView: UIViewController {
    
    var presenter: TopiOSAppListPresenterProtocol?
    var topiOSAppList = [TopiOSApp]()
    
    let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        presenter?.viewDidLoad()
        
        self.view.backgroundColor = UIColor.gray
        self.view.addSubview(tableView)
        tableView.fillSuperview()
    }
    
}

extension TopiOSAppListView: TopiOSAppListViewProtocol {
    func showTopiOSApp(with get: [TopiOSApp]) {
        
        topiOSAppList  = get
        
        tableView.reloadData()
        
    }
}

extension TopiOSAppListView: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return topiOSAppList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell")  else {
            return UITableViewCell()
        }
        
        cell.textLabel?.text = topiOSAppList[indexPath.row].name
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.showTopiOSAppDetailView(for: topiOSAppList[indexPath.row])
    }
}
