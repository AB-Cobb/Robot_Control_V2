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
        username = textUsername.text ?? "user"
    }
    
}
