//
//  HttpCommThread.swift
//  MiseMise_Toy
//
//  Created by base soft on 08/12/2019.
//  Copyright © 2019 studygroup. All rights reserved.
//

import Foundation
import Alamofire


// 통신모듈

class HttpCommThread {
    static let shared = HttpCommThread()
    
    /**
        strUrl: 요청 url
        completion: Alamofire는 비동기이기 때문에 데이터를 확실히 다받고나서 처리해주기 위해
     */
    func requestHttp(strUrl: String, completion: @escaping (Bool) -> Void) {
        
        // 네트워크가 정상적으로 연결되어있는지 확인
        let bNetworkConnect = Global_getConnectedToNetwork()
        if(bNetworkConnect != true){
            Global_showToast(message: "Wi-Fi나 모바일데이터 연결상태를 확인해주세요.")
            return
        }
        
        Alamofire.request(strUrl).responseJSON(completionHandler: {
            (response) in
            
            switch response.result {
            case .success(let data):
                // 통신성공
                print(data)
            case .failure(let e):
                // 통신실패
                print(e.localizedDescription)
            }
        })
        
        completion(true)
    }
}
