//
//  AdDetailViewController.swift
//  IOS-Challenge
//
//  Created by Sreekutty Maya on 02/06/2025.
//

import UIKit
import MapKit
import Combine

class AdDetailViewController : UIViewController {
    var viewModel: AdDetailViewModel!

    @IBOutlet weak var view_paged: UIView!
    @IBOutlet weak var lbl_description: UILabel!
    @IBOutlet weak var lbl_bedRoomCount: UILabel!
    @IBOutlet weak var lbl_bathRoomCount: UILabel!
    @IBOutlet weak var lbl_roomSize: UILabel!
    @IBOutlet weak var lbl_floor: UILabel!
    @IBOutlet weak var lbl_lift: UILabel!
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var emptyView: UIView!

    var cancellables = Set<AnyCancellable>()

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewBind()
    }
    
    private func viewBind() {

        viewModel.$state
            .sink {  state in
                switch(state) {
                    case .isLoading:
                        self.emptyView.isHidden = false
                        self.viewModel.getAds()
                    case .failed(error: _):
                        self.emptyView.isHidden = false
                    case .loaded(ads: let ads):
                        self.emptyView.isHidden = true
                        self.initializeView(ads: ads)
                }
            }
            .store(in: &cancellables)

    }
    
    func initializeView(ads: AdsDetail) {
        self.lbl_description.text = ads.description
        self.lbl_bedRoomCount.text = ads.bedRoomCount
        self.lbl_bathRoomCount.text = ads.bathRoomCount
        self.lbl_floor.text = ads.floor
        self.lbl_roomSize.text = ads.roomSize
        self.lbl_lift.text = ads.liftExists ? "Yes" : "No"

    }
}
