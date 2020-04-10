//
//  ViewController.swift
//  socks_test
//
//  Created by Tech on 2020-03-05.
//  Copyright © 2020 Tech. All rights reserved.
//

import UIKit
import SocketIO

import WebKit

class ViewController: UIViewController,WKUIDelegate {
    var username = ""
    
    @IBOutlet weak var IBO_cam: WKWebView!
    var socketMan = SocketIOManager();
    
    override func viewDidLoad() {
        super.viewDidLoad();
        socketMan.connect();
        if let url = URL(string: "https://picamserver.herokuapp.com/") {
            let request = URLRequest(url: url)
            IBO_cam.load(request)
        }
        welcomeText.text = "Welcome, \(self.username)"
        textAction.text = "Online - Idle"
    }
    @IBOutlet weak var welcomeText: UILabel!
    
    @IBOutlet weak var textAction: UILabel!
    
    //forward
    @IBAction func btn_fwd(_ sender: Any) {
        socketMan.sendCmd(cmd: "fwd", username: self.username)
        textAction.text = "Foward"
    }

    //right
    @IBAction func btn_right(_ sender: Any) {
        socketMan.sendCmd(cmd: "rght", username: self.username)
        textAction.text = "Turn Right"
    }
    //back
    @IBAction func btn_bck(_ sender: Any) {
        socketMan.sendCmd(cmd: "bck", username: self.username)
        textAction.text = "Backward"
    }
    
    //left
    @IBAction func btn_lft(_ sender: Any) {
        socketMan.sendCmd(cmd: "lft", username: self.username)
        textAction.text = "Turn Left"
    }
    //stop
    @IBAction func btn_stop(_ sender: Any) {
        socketMan.sendCmd(cmd: "stop", username: self.username)
        textAction.text = "Idle"
    }
}

