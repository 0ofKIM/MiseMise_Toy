//
//  GlobalHttpComm.swift
//  MiseMise_Toy
//
//  Created by base soft on 30/01/2020.
//  Copyright © 2020 studygroup. All rights reserved.
//

import Foundation
import SystemConfiguration

// http 통신 관련 headers
let g_headers = [ "Content-Type" : "application/x-www-form-urlencoded" ]

// http 통신 관련 파라미터
var g_parameters = [String: String] ()

/** http 통신시 필요한 parameters 설정 (POST)
 strKey: 명칭
 strValue: 값
 */
func Global_setbuffer(strKey: String, strValue: String) -> (){
    g_parameters.updateValue(strValue, forKey: strKey)
}

/** 네트워크 상태 여부 판단 (true: 연결o, false: 연결x)
 */
    func Global_getConnectedToNetwork() -> Bool {
    
    var zeroAddress = sockaddr_in()
    zeroAddress.sin_len = UInt8(MemoryLayout.size(ofValue: zeroAddress))
    zeroAddress.sin_family = sa_family_t(AF_INET)
    
    let defaultRouteReachability = withUnsafePointer(to: &zeroAddress) {
        $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {zeroSockAddress in
            SCNetworkReachabilityCreateWithAddress(nil, zeroSockAddress)
        }
    }
    
    var flags: SCNetworkReachabilityFlags = SCNetworkReachabilityFlags(rawValue: 0)
    if SCNetworkReachabilityGetFlags(defaultRouteReachability!, &flags) == false {
        return false
    }
    
    let isReachable = (flags.rawValue & UInt32(kSCNetworkFlagsReachable)) != 0
    let needsConnection = (flags.rawValue & UInt32(kSCNetworkFlagsConnectionRequired)) != 0
    let ret = (isReachable && !needsConnection)
    
    return ret
}
