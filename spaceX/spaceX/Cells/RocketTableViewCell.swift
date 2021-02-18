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
    var rocket: Rocket?{
        didSet{
            setupUI()
            updateUI()
            guard let imageUrlString = rocket?.flickrImages?.first,
                  let imageUrl = URL(string: imageUrlString) else {return}
            self.rocketImageView.loadImageAsync(for: imageUrl)
        }
    }

    //MARK: - UI
    private func setupUI(){
        self.rocketImageView.layer.cornerRadius = 10.0
        self.successRateContainerView.layer.cornerRadius = self.successRateLabel.frame.height / 2
    }

    private func updateUI(){
        self.nameLabel.text = rocket?.name
        if let successRate = rocket?.successRatePct{
            self.successRateLabel.text = "\(successRate)%"
        }else{
            self.successRateLabel.text = "ND%"
        }

        self.successRateContainerView.backgroundColor = self.getColor(for: rocket?.successRatePct)
        
        if let firstLaunch = rocket?.firstFlight,
           let date = dateFormatter.date(from: firstLaunch){
            self.firstLaunchDateLabel.text = mediumStyleDateFormatter.string(from: date)
        }
    }

    private func getColor(for successRate: Int?) -> UIColor{
        guard let rate = successRate else{
            return .systemGray4
        }
        switch rate{
        case 0...29:
            return .systemRed
        case 30...59:
            return .systemOrange
        case 60...100:
            return .systemGreen
        default:
            return .systemGray4
        }
    }
}
