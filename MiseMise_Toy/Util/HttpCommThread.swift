//
//  HttpCommThread.swift
//  MiseMise_Toy
//
//  Created by base soft on 30/01/2020.
//  Copyright © 2020 studygroup. All rights reserved.
//

import Foundation
import Alamofire

class HttpCommThread {
    
    static let shared = HttpCommThread()
    var strData: NSString!
    
    func requestHttp(view: UIViewController, strUrl: String, completion: @escaping (Bool) -> Void) -> () {
        // 네트워크가 정상적으로 연결되어있는지 확인
        let bNetworkConnect = Global_getConnectedToNetwork()
        guard (bNetworkConnect == true) else{
            Global_showToast(message: "Wi-Fi나 모바일데이터 연결상태를 확인해주세요.")
            return
        }

        Alamofire.request(strUrl, method: .post, parameters: g_parameters ,headers: g_headers).validate().responseData{ response in
            
            let bResult = response.result.isSuccess
            let data = response.value
            
            print("통신결과: \(bResult)")
            print("받은 데이터: \(data)")
            
            self.strData = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
            
            print("데이터: \(self.strData!)")
            completion(true)
        }
    }
    
}
