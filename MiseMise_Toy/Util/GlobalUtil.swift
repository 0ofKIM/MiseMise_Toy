//
//  GlobalUtil.swift
//  MiseMise_Toy
//
//  Created by base soft on 30/01/2020.
//  Copyright © 2020 studygroup. All rights reserved.
//

import Foundation
import UIKit

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
