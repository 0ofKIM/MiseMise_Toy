//
//  GlobalUtill.swift
//  MiseMise_Toy
//
//  Created by base soft on 14/12/2019.
//  Copyright © 2019 studygroup. All rights reserved.
//

import UIKit
import SystemConfiguration
// MARK: - 변수
// http 통신 관련 headers
let g_headers = [ "Content-Type" : "application/x-www-form-urlencoded" ]

// http 통신 관련 파라미터
var g_parameters = [String: String] ()

// MARK: - 함수
// 글자 길이 따른 너비 및 줄바꿈 조절하기 ( 업데이트 목록)
/** Toast 메세지
 message: 메세지 내용
 */
func Global_showToast(message : String) {
    
    //최상위 뷰를 찾기위함 그냥 self로 present 실행시 에러뜸
    var topMostViewController = UIApplication.shared.keyWindow?.rootViewController
    
    while let presentedViewController = topMostViewController?.presentedViewController {
        topMostViewController = presentedViewController
    }
    
    let toastLabel = UILabel(frame: CGRect(x: 0 , y: 0, width: 0, height: 0))
    
    toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
    toastLabel.numberOfLines = 0
    toastLabel.textColor = UIColor.white
    toastLabel.textAlignment = .center
    toastLabel.font = UIFont(name: "Montserrat-Light", size: 15.0)
    //    toastLabel.text = "    " + message + "    "
    toastLabel.text = message
    toastLabel.alpha = 1.0
    toastLabel.layer.cornerRadius = 20;
    toastLabel.layer.masksToBounds = true
    toastLabel.clipsToBounds  =  true
    toastLabel.lineBreakMode = .byWordWrapping
    let maxSizeTitle = CGSize(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
    // 디바이스 크기에 맞는 label 크기 요청
    let nToastSize = toastLabel.sizeThatFits(maxSizeTitle)
    topMostViewController!.view.addSubview(toastLabel)
    
    
    // auto layout 설정을 위해 false
    toastLabel.translatesAutoresizingMaskIntoConstraints = false
    // greaterThanOrEqualToConstant: 최소 크기
    toastLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 50).isActive = true
    toastLabel.widthAnchor.constraint(equalToConstant: nToastSize.width + 30).isActive = true
    toastLabel.centerXAnchor.constraint(equalTo: topMostViewController!.view.centerXAnchor).isActive = true
    toastLabel.centerYAnchor.constraint(equalTo: topMostViewController!.view.centerYAnchor).isActive = true
    // greaterThanOrEqualTo: 크거나 같다
    toastLabel.leadingAnchor.constraint(greaterThanOrEqualTo: topMostViewController!.view.leadingAnchor, constant: 10).isActive = true
    toastLabel.trailingAnchor.constraint(greaterThanOrEqualTo: topMostViewController!.view.leadingAnchor, constant: 10).isActive = true
    
    
    UIView.animate(withDuration: 3.3, delay: 0.1, options: .curveEaseOut, animations: {
        toastLabel.alpha = 0.0
    }, completion: {(isCompleted) in
        toastLabel.removeFromSuperview()
    })
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

/** http 통신시 필요한 parameters 설정 (POST)
 strKey: 명칭
 strValue: 값
 */
func Global_setbuffer(strKey: String, strValue: String) -> (){
    g_parameters.updateValue(strValue, forKey: strKey)
}
