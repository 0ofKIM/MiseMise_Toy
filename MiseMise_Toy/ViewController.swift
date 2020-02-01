//
//  ViewController.swift
//  MiseMise_Toy
//
//  Copyright © 2019 studygroup. All rights reserved.
//

import UIKit

extension String {
    
    func decodeUrl() -> String?{ return self.removingPercentEncoding }
    func encodeUrl() -> String?{ return self.addingPercentEncoding( withAllowedCharacters: NSCharacterSet.urlQueryAllowed) }
    
}

class ViewController: UIViewController {

    var cellNibName: [String] = []
    @IBOutlet var mainTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        mainTableView.delegate = self
        mainTableView.dataSource = self
        
        connect()
    }

}

extension ViewController {
    
    func connect() {
        let url = "http://openapi.airkorea.or.kr/openapi/services/rest/ArpltnInforInqireSvc/getMsrstnAcctoRltmMesureDnsty"
        let serviceKey = "bIg%2FjdOl5P%2BejhryhZbzlWFRN71XpkomTaww%2BOfiTMsPpvb6AmhktU%2Fqihvx9tISrZnL5mfyoVWuVCiJik979g%3D%3D".decodeUrl()
        //var strUrl = url.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
        
        
        Global_setbuffer(strKey: "ServiceKey", strValue: serviceKey!)
        Global_setbuffer(strKey: "numOfRows", strValue: "10")
        Global_setbuffer(strKey: "pageNo", strValue: "1")
        Global_setbuffer(strKey: "stationName", strValue: "종로구")
        Global_setbuffer(strKey: "dataTerm", strValue: "DAILY")
        Global_setbuffer(strKey: "ver", strValue: "1.0")
        Global_setbuffer(strKey: "_returnType", strValue: "json")
        
        HttpCommThread.shared.requestHttp(view: self, strUrl: url, completion: {
            isSuccess in
            guard isSuccess else {
                return
            }
            Global_showToast(message: "데이터 통신 성공")
        })
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {

    //메인 테이블뷰의 셀 개수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellNibName.count
    }

    //각 셀 구성
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: TestFirstTableViewCell.identifier, for: indexPath) as! TestFirstTableViewCell

            return cell
        } else if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: TestRedTableViewCell.identifier, for: indexPath) as! TestRedTableViewCell

            return cell
        } else if indexPath.row == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: HourlyForecast.identifier, for: indexPath) as! HourlyForecast

            return cell
        } else if indexPath.row == 3 {
            let cell = tableView.dequeueReusableCell(withIdentifier: DailyForecast.identifier, for: indexPath) as! DailyForecast

            return cell
        }

        // cellNibName 배열 개수대로 나와서 추가는 안될거지만 함수 리턴값을 위해 임의로 넣어둠
        let cell = tableView.dequeueReusableCell(withIdentifier: TestFirstTableViewCell.identifier, for: indexPath) as! TestFirstTableViewCell

        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        //시간별 예보 행
        if indexPath.row == 2 {
            return CGFloat(123)
        } else if indexPath.row == 3 { //일별 예보 행
            return CGFloat(500)
        }

        return CGFloat(44)
    }

}
