//
//  AdListTableViewCell.swift
//  IOS-Challenge
//
//  Created by Sreekutty Maya on 02/06/2025.
//

import Foundation
import UIKit
import SDWebImage

class AdListTableViewCell :  UITableViewCell {
    static let cellIdentifier = "AdListTableViewCell"
    @IBOutlet weak var property_type: UILabel!
    @IBOutlet weak var img_adThumbnail: UIImageView!
    @IBOutlet weak var property_address: UILabel!
    @IBOutlet weak var property_province: UILabel!
    @IBOutlet weak var property_price: UILabel!
    @IBOutlet weak var btn_favorite: UIButton!
    @IBOutlet weak var lbl_favoriteDate: UILabel!

    var onFavoriteTapped: (() -> Void)?
    var onDetailTapped: (() -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setUpCellWithAd(adModel : Ads,favoriteItem :FavoriteItem? = nil) {
        btn_favorite.isUserInteractionEnabled = true
        property_type.text = adModel.propertyType
        property_price.text = adModel.priceInfo
        property_address.text = adModel.fullAddress
        property_province.text = adModel.province
        img_adThumbnail.sd_setImage(with: URL(string: adModel.thumbnail))
        btn_favorite.setImage(
            UIImage(systemName: favoriteItem != nil ? "heart.fill" : "heart"),
            for: .normal
        )
        if let date = favoriteItem?.date {
            lbl_favoriteDate.text = DateFormatter.convertDateToString(date: date)
        } else {
            lbl_favoriteDate.text = ""
        }
    }
    
    @IBAction func btnAction_favorite(_ sender: Any)  {
        onFavoriteTapped?()
        btn_favorite.isUserInteractionEnabled = false
        btn_favorite.setImage( UIImage(systemName:"heart.fill"),for: .normal
        )
    }
}


extension DateFormatter {
    static func convertDateToString(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium   // e.g., Jan 2, 2025
        formatter.timeStyle = .short    // e.g., 3:45 PM
        return formatter.string(from: date)
    }
}
