//
//  MenuViewController.swift
//  socks_test
//
//  Created by user162289 on 3/31/20.
//  Copyright © 2020 Tech. All rights reserved.
//

import UIKit
import Foundation
import WebKit
import SocketIO

class MenuViewController: UIViewController {
    var socketMan = SocketIOManager()
    var username = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonProceed.isEnabled = false
        buttonProceed.setTitleColor(UIColor(named: "red"), for: .normal)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    @IBOutlet weak var buttonProceed: UIButton!
    @IBOutlet weak var textUsername: UITextField!
    
    @IBAction func textChange(_ sender: UITextField) {
        if (textUsername.text == "") {
            buttonProceed.isEnabled = false
        buttonProceed.setTitleColor(UIColor(named: "red"), for: .normal)
        }
        else {
            buttonProceed.isEnabled = true
        buttonProceed.setTitleColor(UIColor(named: "green"), for: .normal)
        }
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboard = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= keyboard.height
            }
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        if ((notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue) != nil {
            if self.view.frame.origin.y != 0 {
                self.view.frame.origin.y = 0
            }
        }
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @IBAction func proceedButton(_ sender: UIButton) {
        self.username = textUsername.text!
        performSegue(withIdentifier: "proceed", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "proceed"{
            let vc = segue.destination as? ViewController
            vc?.username = self.username
        }
    }
}
