//
//  ViewController.swift
//  MiseMise_Toy
//
//  Copyright © 2019 studygroup. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var cellNibName: [String] = []
    @IBOutlet var mainTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        mainTableView.delegate = self
        mainTableView.dataSource = self
        
        // 데이터 수신 테스트
        testDataResponse()
    }

}

func testDataResponse() {
    let serviceKey = "xKlWL1rKISxO2G5Lc2QiKY4jeOsZBq8Ex00Vr%2B9BfBCHwTspVF2FzNd50POwJKFFKvkIXjNkmT01de3v%2FQXVGQ%3D%3D"
    let url = "http://openapi.airkorea.or.kr/"
        + "openapi/services/rest/ArpltnInforInqireSvc/getMsrstnAcctoRltmMesureDnsty"
    
    Global_setbuffer(strKey: "ServiceKey", strValue: serviceKey)
    Global_setbuffer(strKey: "numberOfRows", strValue: "10")
    Global_setbuffer(strKey: "pageNo", strValue: "1")
    Global_setbuffer(strKey: "dataTerm", strValue: "DAILY")
    Global_setbuffer(strKey: "ver", strValue: "1.0")
    Global_setbuffer(strKey: "_returnType", strValue: "json")
    
    HttpCommThread.shared.requestHttp(strUrl: url, completion: {
        (isSuccess) in
        guard isSuccess else {
            return
        }
    })
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellNibName.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: TestFirstTableViewCell.identifier, for: indexPath) as! TestFirstTableViewCell

            return cell
        } else if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: TestRedTableViewCell.identifier, for: indexPath) as! TestRedTableViewCell

            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: TestFirstTableViewCell.identifier, for: indexPath) as! TestFirstTableViewCell

            return cell
        }
    }

}
