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
            let cell = tableView.dequeueReusableCell(withIdentifier: HourlyForecastTableViewCell.identifier, for: indexPath) as! HourlyForecastTableViewCell

            return cell
        }

        // cellNibName 배열 개수대로 나와서 추가는 안될거지만 함수 리턴값을 위해 임의로 넣어둠
        let cell = tableView.dequeueReusableCell(withIdentifier: TestFirstTableViewCell.identifier, for: indexPath) as! TestFirstTableViewCell

        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        //시간별 예보 행
        if indexPath.row == 2 {
            return CGFloat(100)
        }

        return CGFloat(44)
    }

}
