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

    var status: String{
        if item.active ?? false{
            return "ACTIVE"
        }else{
            return "INACTIVE"
        }
    }

    var statusColor: UIColor{
        if item.active ?? false{
            return UIColor.green
        }else{
            return UIColor.red
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
        guard let cost =  item.costPerLaunch as NSNumber? else{
            return "-"
        }
        return usDollarFormatter.string(from: cost) ?? "-"
    }

    var successRate: String{
        return String(format: "%d%%", item.successRatePct ?? 0)
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
