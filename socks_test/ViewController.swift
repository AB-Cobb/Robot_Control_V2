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

class ViewController: UIViewController {
    
    @IBOutlet weak var IBO_cam: WKWebView!
    var socketMan = SocketIOManager();
    override func viewDidLoad() {
        super.viewDidLoad();
        socketMan.connect();
        if let cam_url = URL(string: "site.domain.com"){
            let req = URLRequest(url: cam_url)
            IBO_cam.load(req)
        }// */
    }
    //forward
    @IBAction func btn_fwd(_ sender: Any) {
        socketMan.sendCmd(cmd: "fwd")
    }

    //right
    @IBAction func btn_right(_ sender: Any) {
        socketMan.sendCmd(cmd: "rght")
    }
    //back
    @IBAction func btn_bck(_ sender: Any) {
        socketMan.sendCmd(cmd: "bck")
    }
    //left
    @IBAction func btn_lft(_ sender: Any) {
        socketMan.sendCmd(cmd: "lft")
    }
    //stop
    @IBAction func btn_stop(_ sender: Any) {
        socketMan.sendCmd(cmd: "stop")
    }
    
}

