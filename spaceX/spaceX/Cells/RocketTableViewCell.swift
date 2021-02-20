//
//  RocketTableViewCell.swift
//  spaceX
//
//  Created by Marco Celestino on 18/02/2021.
//

import UIKit

class RocketTableViewCell: UITableViewCell {

    //MARK: - IBOutlets
    @IBOutlet weak var rocketImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var firstLaunchDateLabel: UILabel!
    @IBOutlet weak var successRateTitleLabel: UILabel!
    @IBOutlet weak var successRateLabel: UILabel!
    @IBOutlet weak var successRateContainerView: UIView!

    //MARK: - Properties
    var viewModel: RocketDetailViewModel!{
        didSet{
            setupUI()
            updateUI()
            guard let imageUrl = viewModel.imageUrl else {return}
            self.rocketImageView.loadImageAsync(for: imageUrl)
        }
    }

    //MARK: - UI
    private func setupUI(){
        self.rocketImageView.layer.cornerRadius = 10.0
        self.successRateContainerView.layer.cornerRadius = self.successRateLabel.frame.height / 2
    }

    private func updateUI(){
        self.nameLabel.text = viewModel.item.name
        self.successRateLabel.text = viewModel.successRate
        self.successRateContainerView.backgroundColor = viewModel.successRateColor
        self.firstLaunchDateLabel.text = viewModel.firtsLaunchDate

    }
}
