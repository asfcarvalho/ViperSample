//
//  DetailView.swift
//  VIPERSample
//
//  Created by Anderson Carvalho on 11/01/19.
//  Copyright © 2019 asfcarvalho. All rights reserved.
//

import UIKit

class DetailView: UIViewController {
    
    var presenter: DetailPresenterProtocol?

    var quoteLabel: UITextView = {
        let textView = UITextView()
        textView.font = UIFont.boldSystemFont(ofSize: 16)
        textView.isEditable = false
        textView.isScrollEnabled = false
        return textView
    }()
    
    var authorLabel: UITextView = {
        let textView = UITextView()
        textView.font = UIFont.boldSystemFont(ofSize: 16)
        textView.isEditable = false
        textView.isScrollEnabled = false
       return textView
    }()
    
    var categotyLabel: UITextView = {
        let textView = UITextView()
        textView.font = UIFont.boldSystemFont(ofSize: 16)
        textView.isEditable = false
        textView.isScrollEnabled = false
        return textView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        
        presenter?.viewDidLoad()
        
        self.view.addSubview(authorLabel)
        self.view.addSubview(quoteLabel)
        self.view.addSubview(categotyLabel)
        setupText()
    }
    
    fileprivate func setupText() {
        
        let size = CGSize(width: view.frame.width, height: .infinity)
        let authorLabelHeith = authorLabel.sizeThatFits(size)
        
        authorLabel.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: UIEdgeInsets.init(top: 16, left: 16, bottom: 0, right: 16), size: CGSize(width: view.frame.width, height: authorLabelHeith.height))

        let quoteLabelHeith = quoteLabel.sizeThatFits(size)
        quoteLabel.anchor(top: authorLabel.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: UIEdgeInsets.init(top: 16, left: 16, bottom: 0, right: 16), size: CGSize(width: view.frame.width, height: quoteLabelHeith.height))

        
        let categotyLabelHeith = categotyLabel.sizeThatFits(size)
        categotyLabel.anchor(top: quoteLabel.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: UIEdgeInsets.init(top: 16, left: 16, bottom: 0, right: 16), size: CGSize(width: view.frame.width, height: categotyLabelHeith.height))
        
    }
}

extension DetailView: DetailViewProtocol {
    
    func showDetail(_ famous: Famous) {
        
        quoteLabel.text = famous.quote
        authorLabel.text = famous.author
        categotyLabel.text = famous.category
    }
    
}
