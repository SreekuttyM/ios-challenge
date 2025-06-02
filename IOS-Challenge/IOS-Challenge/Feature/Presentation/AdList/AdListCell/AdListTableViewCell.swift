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
    
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }
    
    func setUpCellWithAd(adModel : Ads) {
        property_type.text = adModel.propertyType
        property_price.text = adModel.priceInfo
        property_address.text = adModel.fullAddress
        property_province.text = adModel.province
        img_adThumbnail.sd_setImage(with: URL(string: adModel.thumbnail))
    }
}
