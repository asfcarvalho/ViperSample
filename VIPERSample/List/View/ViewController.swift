//
//  ViewController.swift
//  FrameworkSample
//
//  Created by Anderson Carvalho on 11/01/19.
//  Copyright © 2019 asfcarvalho. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var presenter: ViewControllerPresenterProtocol?
    var famous = [Famous]()
    
    let tableView: UITableView = {
       let table = UITableView()
        
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
        
        presenter?.viewDidLoad()
        
        view.addSubview(tableView)
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.fillSuperview()
        tableView.dataSource = self
        tableView.delegate = self
    }
}

extension ViewController: ViewControllerViewProtocol {
    func showError(_ error: String) {
        let alert = UIAlertController(title: "Atenção", message: error, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func showLoading() {
        Loading.showLoading(self.view)
    }
    
    func stopLoading() {
        Loading.stopLoading()
    }
    
    func showValue(_ famous: [Famous]) {
        DispatchQueue.main.async {
            self.famous = famous
            self.tableView.reloadData()
        }
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return famous.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") else { return UITableViewCell() }
        cell.textLabel?.text = famous[indexPath.row].author
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.showDetailScreen(famous[indexPath.row])
    }
}
