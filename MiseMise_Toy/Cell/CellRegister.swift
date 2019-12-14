//
//  CellRegister.swift
//  MiseMise_Toy
//
//  Copyright © 2019 studygroup. All rights reserved.
//

import UIKit

//CellRegister 클래스
extension ViewController {

    override func viewWillLayoutSubviews() {
        //NibName담아두는 String 배열에 cell identifier 등록
        cellNibName.append(TestFirstTableViewCell.identifier)
        cellNibName.append(TestRedTableViewCell.identifier)
        cellNibName.append(HourlyForecastTableViewCell.identifier)

        //메인테이블뷰에 등록
        for i in 0...cellNibName.count-1 {
            let nib = UINib(nibName: cellNibName[i], bundle: nil)

            mainTableView.register(nib, forCellReuseIdentifier: cellNibName[i])
        }
    }
    
}
