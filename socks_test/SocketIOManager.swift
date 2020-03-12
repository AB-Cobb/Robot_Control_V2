//
//  SocketIOManager.swift
//  Robot Control
//
//  Created by Tech on 2020-03-05.
//  Copyright © 2020 Tech. All rights reserved.
//

import Foundation
import SocketIO

class SocketIOManager: NSObject {
    static let manager = SocketManager(socketURL: URL(string: "https://robotserve.herokuapp.com/")!)
    var socket = manager.defaultSocket

    override init() {
        super.init()

    }

    func connect() {
        socket.connect()
    }
    func sendCmd(cmd : String){
        let data_cmd = ["drive" : cmd]
        socket.emit("cmd", data_cmd)
        let data_log = ["txt" : cmd]
        socket.emit("ctrl_log", data_log)
    }

    func close() {
        socket.disconnect()
    }
}
