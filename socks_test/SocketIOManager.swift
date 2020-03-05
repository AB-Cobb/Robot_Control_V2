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
    static let manager = SocketManager(socketURL: URL(string: "localhost:3000")!)
    var socket = manager.defaultSocket

    override init() {
        super.init()

    }

    func connect() {
        socket.connect()
    }
    func sendCmd(cmd : String){
        socket.emit("cmd", cmd)
    }

    func close() {
        socket.disconnect()
    }
}
