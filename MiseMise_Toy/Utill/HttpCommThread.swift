//
//  HttpCommThread.swift
//  MiseMise_Toy
//
//  Created by base soft on 14/12/2019.
//  Copyright © 2019 studygroup. All rights reserved.
//

import Foundation
import Alamofire

class HttpCommThread {
    
    static let shared = HttpCommThread()
    
    func requestHttp(strUrl: String, completion: @escaping (Bool) -> Void) {
        
        // 네트워크가 정상적으로 연결되어있는지 확인
        let bNetworkConnect = Global_getConnectedToNetwork()
        if(bNetworkConnect != true){
            Global_showToast(message: "Wi-Fi나 모바일데이터 연결상태를 확인해주세요.")
            return
        }
        
        Alamofire.request(strUrl, method: .post, parameters: g_parameters, encoding: JSONEncoding.default, headers: g_headers).validate().responseData(completionHandler: {
            (response) in
            
            var data = response.value
            
            if(data == nil || data!.count <= 0){
                print("데이터가 없습니다.")
                return
            }
            
            var strData: NSString!
            strData = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
            
            print(strData)
            
            completion(true)
        })
    }
}
