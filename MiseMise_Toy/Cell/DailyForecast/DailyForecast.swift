//
//  DailyForecast.swift
//  MiseMise_Toy
//
//  Copyright © 2020 studygroup. All rights reserved.
//

import UIKit

class DailyForecast: UITableViewCell {

    static let identifier = "DailyForecast"
    let nib = UINib(nibName: DailyForecastTableViewCell.identifier, bundle: nil)
    
    @IBOutlet var dailyForecastTableView: UITableView!

    override func awakeFromNib() {
        super.awakeFromNib()

        dailyForecastTableView.delegate = self
        dailyForecastTableView.dataSource = self

        dailyForecastTableView.register(nib, forCellReuseIdentifier: DailyForecastTableViewCell.identifier)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}

extension DailyForecast: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 14
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DailyForecastTableViewCell.identifier, for: indexPath) as! DailyForecastTableViewCell

        return cell
    }

}
