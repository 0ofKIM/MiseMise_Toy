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
