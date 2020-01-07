//
//  HourlyForecastCollectionViewCell.swift
//  MiseMise_Toy
//
//  Copyright © 2019 studygroup. All rights reserved.
//

import UIKit

class HourlyForecastCollectionViewCell: UICollectionViewCell {

    static let identifier = "HourlyForecastCollectionViewCell"

    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var statusEmoticonButton: UIButton!
    @IBOutlet weak var statusLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
