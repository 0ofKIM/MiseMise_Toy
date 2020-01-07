//
//  HourlyForecast.swift
//  MiseMise_Toy
//
//  Copyright © 2019 studygroup. All rights reserved.
//

import UIKit

class HourlyForecast: UITableViewCell {

    static let identifier = "HourlyForecast"
    let nib = UINib(nibName: HourlyForecastCollectionViewCell.identifier, bundle: nil)
    
    @IBOutlet var hourlyForecastCollectionView: UICollectionView!

    override func awakeFromNib() {
        super.awakeFromNib()

        hourlyForecastCollectionView.delegate = self
        hourlyForecastCollectionView.dataSource = self

        hourlyForecastCollectionView.register(nib, forCellWithReuseIdentifier: HourlyForecastCollectionViewCell.identifier)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}

extension HourlyForecast: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 12
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HourlyForecastCollectionViewCell.identifier, for: indexPath) as! HourlyForecastCollectionViewCell

        cell.timeLabel.text = "오전\(indexPath.row)시"
        
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 90, height: 123)
    }

}
