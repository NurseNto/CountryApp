//
//  CountryCollectionViewCell.swift
//  NurseCountryApp
//
//  Created by Nurse Ntombi Masango on 2022/12/19.
//

import UIKit

protocol isDone {
    func toggleFavorite(for cell: UICollectionViewCell)
}

class CountryCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imgLabel: UILabel!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var flagImageView: UIImageView!
    @IBOutlet weak var favoriteButton: UIButton!
    @IBOutlet weak var countryNameLabel: UILabel!
    
    var isDoneDelegate: isDone?
    var favButtonPressed : (() -> ()) = {}
    
    override func awakeFromNib() {
        super.awakeFromNib()
        containerView.layer.cornerRadius = containerView.layer.bounds.size.width / 10
        containerView.clipsToBounds = true
    }

    func setCell(country: String, isChecked: Bool) {
        if isChecked {
            favoriteButton.setImage(UIImage(systemName: "suit.heart.fill"), for: .normal)
        } else {
            favoriteButton.setImage(UIImage(systemName: "suit.heart"), for: .normal)
        }
    }

    @IBAction func favoriteTapped(_ sender: Any) {
        isDoneDelegate?.toggleFavorite(for: self)
        favButtonPressed()
    }
}
