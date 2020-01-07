//
//  DailyForecastTableViewCell.swift
//  MiseMise_Toy
//
//  Copyright © 2020 studygroup. All rights reserved.
//

import UIKit

class DailyForecastTableViewCell: UITableViewCell {

    static let identifier = "DailyForecastTableViewCell"

    @IBOutlet var timeLabel: UILabel!
    @IBOutlet var statusButton: UIButton!
    @IBOutlet var statusLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
