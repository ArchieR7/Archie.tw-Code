//
//  CocoaAsyncSocketDemo.swift
//  Archie.tw
//
//  Created by 家齊 on 2017/7/21.
//  Copyright © 2017年 張家齊. All rights reserved.
//

import Foundation
import CocoaAsyncSocket

class CocoaAsyncSocketDemo: NSObject {
    
    func createSocket() {
        let socket = GCDAsyncSocket(delegate: self, delegateQueue: DispatchQueue.global())
        do {
            try socket.connect(toHost: "Host", onPort: 8080)
        } catch {
            print(error)
        }
    }
    
    // GCDAsyncSocketDelegate
    func socket(_ sock: GCDAsyncSocket, didConnectToHost host: String, port: UInt16) {
        // 連接上後，需要執行 readData 等候 Server 執行 writeData 的動作
        sock.readData(withTimeout: -1, tag: 0)
    }
    
    func socket(_ sock: GCDAsyncSocket, didRead data: Data, withTag tag: Int) {
        // 讀完資料後，還是需要再執行一次 readData，來等候下一次的資料傳輸過來
        sock.readData(withTimeout: -1, tag: 0)
    }
    
    func socketDidDisconnect(_ sock: GCDAsyncSocket, withError err: Error?) {
        
    }
    
    func socket(_ sock: GCDAsyncSocket, didWriteDataWithTag tag: Int) {
        
    }
}

extension CocoaAsyncSocketDemo: GCDAsyncSocketDelegate {
    
}
