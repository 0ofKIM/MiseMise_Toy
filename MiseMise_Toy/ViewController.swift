//
//  ViewController.swift
//  MiseMise_Toy
//
//  Copyright © 2019 studygroup. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var mainTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        mainTableView.delegate = self
        mainTableView.dataSource = self

        let nibName = UINib(nibName: "TestFirstTableViewCell", bundle: nil)

        mainTableView.register(nibName, forCellReuseIdentifier: "TestFirstTableViewCell")
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TestFirstTableViewCell", for: indexPath) as! TestFirstTableViewCell

        return cell
    }


}
