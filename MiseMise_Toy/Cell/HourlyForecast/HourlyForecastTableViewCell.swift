//
//  HourlyForecastTableViewCell.swift
//  MiseMise_Toy
//
//  Copyright © 2019 studygroup. All rights reserved.
//

import UIKit

class HourlyForecastTableViewCell: UITableViewCell {

    static var identifier = "HourlyForecastTableViewCell"
    @IBOutlet var hourlyForecastCollectionView: UICollectionView!

    override func awakeFromNib() {
        super.awakeFromNib()

        hourlyForecastCollectionView.delegate = self
        hourlyForecastCollectionView.dataSource = self

        let nib = UINib(nibName: HourlyForecastCollectionViewCell.identifier, bundle: nil)

        hourlyForecastCollectionView.register(nib, forCellWithReuseIdentifier: HourlyForecastCollectionViewCell.identifier)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}

extension HourlyForecastTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

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
