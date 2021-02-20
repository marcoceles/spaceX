//
//  RocketDetailViewModel.swift
//  spaceX
//
//  Created by Marco Celestino on 20/02/2021.
//

import Foundation
import SwiftUI

struct RocketDetailViewModel {
    let item: Rocket

    var imageUrl: URL?{
        guard let urlStr = item.flickrImages?.first else{
            return nil
        }
        return URL(string: urlStr)
    }

    var status: Text{
        if item.active ?? false{
            return Text("ACTIVE")
                .foregroundColor(.green)
        }else{
            return Text("INACTIVE")
                .foregroundColor(.red)
        }
    }

    var firtsLaunchDate: String{
        guard let string = item.firstFlight,
              let date = dateFormatter.date(from: string)
        else{
            return "-"
        }

        return mediumStyleDateFormatter.string(from: date)
    }

    var costPerLaunch: String{
        return usDollarFormatter.string(from: (item.costPerLaunch as NSNumber?) ?? 0) ?? "-"
    }

    var successRate: String{
        return String(format: "%d%", item.successRatePct ?? 0)
    }
    var successRateColor: UIColor{
        guard let rate = item.successRatePct else{
            return .secondarySystemFill
        }
        switch rate{
        case 0...29:
            return .red
        case 30...59:
            return .orange
        case 60...100:
            return .green
        default:
            return .secondarySystemFill
        }
    }

    func openWikipedia(){
        guard let str = item.wikipedia, let url = URL(string: str) else{
            return
        }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }

    init(item: Rocket) {
        self.item = item
    }
}
