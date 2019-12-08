//
//  ViewController.swift
//  MiseMise_Toy
//
//  Created by Lotte on 2019/11/27.
//  Copyright © 2019 studygroup. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        let serviceKey = "xKlWL1rKISxO2G5Lc2QiKY4jeOsZBq8Ex00Vr%2B9BfBCHwTspVF2FzNd50POwJKFFKvkIXjNkmT01de3v%2FQXVGQ%3D%3D"
        let url = "http://openapi.airkorea.or.kr/"
            + "openapi/services/rest/ArpltnInforInqireSvc/getMsrstnAcctoRltmMesureDnsty"
            + "?stationName=수내동&dataTerm=month&pageNo=1&numOfRows=10&ServiceKey=" + serviceKey + "&ver=1.3"
        
        HttpCommThread.shared.requestHttp(strUrl: url, completion: {
            (isSuccess) in
            guard isSuccess else {
                return
            }
        })
        
    }


}

