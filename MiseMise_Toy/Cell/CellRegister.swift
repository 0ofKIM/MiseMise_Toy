//
//  CellRegister.swift
//  MiseMise_Toy
//
//  Created by Lotte on 2019/12/08.
//  Copyright © 2019 studygroup. All rights reserved.
//

import UIKit

//CellRegister 클래스
extension ViewController {
//경빈님테스트
    override func viewWillLayoutSubviews() {
        //NibName담아두는 String 배열에 cell identifier 등록
        cellNibName.append(TestFirstTableViewCell.identifier)
        cellNibName.append(TestRedTableViewCell.identifier)

        //메인테이블뷰에 등록
        for i in 0...cellNibName.count-1 {
            mainTableView.register(UINib(nibName: cellNibName[i], bundle: nil), forCellReuseIdentifier: cellNibName[i])
        }
    }
    
}
