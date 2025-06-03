//
//  AdsListViewController.swift
//  IOS-Challenge
//
//  Created by Sreekutty Maya on 01/06/2025.
//

import Foundation
import UIKit
import Combine
class AdsListViewController : UIViewController {
    @IBOutlet weak var lbl_errorMsg: UILabel!
    @IBOutlet weak var view_errorOrEmpty: UIView!
    @IBOutlet weak var tableView_ads: UITableView!
    let refreshControl = UIRefreshControl()
    
    var cancellables = Set<AnyCancellable>()
    var viewModel: AdsListViewModel!

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = Constants.adListTitle
        viewBind()
    }
    
    private func viewBind() {
        tableView_ads.register(UINib(nibName: AdListTableViewCell.cellIdentifier, bundle: nil), forCellReuseIdentifier: AdListTableViewCell.cellIdentifier)
        
        refreshControl.addTarget(self, action: #selector(handleRefresh), for: .valueChanged)
        tableView_ads.refreshControl = refreshControl
        
        viewModel.$state
            .sink {  state in
                switch(state) {
                    case .isLoading:
                        self.viewModel.getAds()
                        self.view_errorOrEmpty.isHidden = false
                    case .failed(error: let error):
                        self.lbl_errorMsg.text = "Some thing went wrong : \(error)"
                        self.view_errorOrEmpty.isHidden = false
                        self.hideRefreshControlView()
                    case .loaded(ads: let ads):
                        self.viewModel.ads = ads
                        self.view_errorOrEmpty.isHidden = true
                        self.hideRefreshControlView()
                        self.tableView_ads.reloadData()
                        
                }
            }
            .store(in: &cancellables)
    }
    
    @objc private func handleRefresh() {
        self.viewModel.getAds()
    }
    
    func hideRefreshControlView() {
        refreshControl.endRefreshing()
    }
}


extension AdsListViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.ads.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: AdListTableViewCell.cellIdentifier) as? AdListTableViewCell else {
            fatalError("Cell not exists in storyboard")
        }
        let item = viewModel.ads[indexPath.row]
        cell.setUpCellWithAd(adModel:item,favoriteItem: viewModel.favorites.filter{$0.itemId == item.propertyCode}.first)
        cell.onFavoriteTapped = {
            Task {
               try await self.viewModel.favoriteIconPressed(item: item)
               self.tableView_ads.reloadData()
            }
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       let vc =  AppCompositionRoot.composeAdsDetailModule(selectedAdId: viewModel.ads[indexPath.row].propertyCode)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    internal func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension;
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension;
    }
    
    
}
