//
//  BaseViewController.swift
//  GenBit
//
//  Created by Proaire on 01/07/19.
//  Copyright © 2019 Treepart. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController, UITextFieldDelegate {
    
    var textFieldRealYPosition: CGFloat = 0.0
    var scrollView = UIScrollView(frame: CGRect.zero)
    var safeView = UIView(frame: CGRect.zero)
    static var activeField: UITextField?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)

        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        var tagField = 0
        
        for scrollView in self.view.subviews where scrollView is UIScrollView {
            safeView = scrollView.subviews.first ?? UIView()
            for subView in scrollView.subviews {
                for textField in subView.subviews where textField is UITextFiewCustom {
                    if let textField = textField as? UITextField {
                        textField.tag = tagField
                        tagField += 1
                        textField.delegate = self
                    }
                }
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        setupNavigationController()
        super.viewWillAppear(animated)
        
        self.navigationController?.isNavigationBarHidden = false
        
    }
    
    fileprivate func setupNavigationController() {
        
        self.navigationController?.navigationBar.tintColor = UIColor.black
        self.navigationController?.navigationBar.topItem?.title = ""
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(keyboardHide))
        self.view.addGestureRecognizer(tap)
        self.view.isUserInteractionEnabled = true
    }
    
    @objc fileprivate func keyboardHide() {
        self.view.endEditing(true)
    }

    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            
            if let activeField = BaseViewController.activeField {
                var aRect = scrollView.frame
                aRect.size.height -= (keyboardSize.height + 10)
                
                let y = abs((scrollView.frame.height - activeField.frame.origin.y - activeField.frame.height) - keyboardSize.height)
//                if !aRect.contains(activeField.frame.origin) {
                if (activeField.frame.origin.y + activeField.frame.height) > (scrollView.frame.height - keyboardSize.height) {
                    scrollView.setContentOffset(CGPoint(x: 0.0, y: y + 5), animated: true)
                }
            }
        }//(activeField.frame.origin.y + activeField.frame.height) > (scrollView.frame.height - keyboardSize.height)
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        scrollView.setContentOffset(CGPoint(x: 0.0, y: 0.0), animated: true)
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        BaseViewController.activeField = textField
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        BaseViewController.activeField = nil
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let nextTag = textField.tag + 1
        // Try to find next responder
        let nextResponder = textField.superview?.viewWithTag(nextTag) as UIResponder?
        
        textField.resignFirstResponder()
        if nextResponder != nil {
            // Found next responder, so set
            nextResponder?.becomeFirstResponder()
        }
        
        return false
    }
}
