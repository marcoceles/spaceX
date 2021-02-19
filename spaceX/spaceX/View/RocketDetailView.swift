//
//  RocketDetailView.swift
//  spaceX
//
//  Created by Marco Celestino on 19/02/2021.
//

import SwiftUI

struct RocketDetailView: View {

    private let rocket : Rocket

    init(rocket: Rocket) {
        self.rocket = rocket
    }

    var body: some View {
        
        VStack {

            RemoteImage(url: rocket.flickrImages?.first)
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .padding(10)

            HStack (alignment: .top){
                VStack(alignment: .leading){
                    VStack(alignment: .leading, spacing: 8) {
                        VStack(alignment: .leading) {
                            if rocket.active ?? false{
                                Text("ACTIVE")
                                    .foregroundColor(.green)
                            }else{
                                Text("INACTIVE")
                                    .foregroundColor(.red)
                            }
                        }

                        VStack(alignment: .leading) {
                            Text("📍 Country:")
                                .foregroundColor(.secondary)
                            Text(rocket.country ?? "-")
                        }

                        VStack(alignment: .leading) {
                            Text("🚀 First flight:")
                                .foregroundColor(.secondary)
                            Text(getFormatteDateString(from: rocket.firstFlight) ?? "-")
                        }

                        VStack(alignment: .leading) {
                            Text("💰 Cost per launch:")
                                .foregroundColor(.secondary)
                            Text(usDollarFormatter.string(from: (rocket.costPerLaunch as NSNumber?) ?? 0) ?? "-")
                        }
                    }
                }

                Spacer()

                VStack{
                    Text("SUCCESS RATE")
                        .fontWeight(.regular)
                        .font(.callout)
                    ZStack{
                        getColor(for: rocket.successRatePct)
                        Text("\(rocket.successRatePct ?? 0)%")
                            .foregroundColor(.white)
                            .fontWeight(.medium)
                    }
                    .frame(width: 60, height: 28, alignment: .center)
                    .clipShape(RoundedRectangle(cornerRadius: 14))
                }
            }
            .padding(10)

            if let desc = rocket.rocketDescription{
                Text(desc)
                    .padding(10)
            }
            Spacer()
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("Wikipedia") {
                    openWikipedia(rocket.wikipedia)
                }
            }
        }
        .navigationBarTitle(self.rocket.name ?? "Rocket", displayMode: .large)
    }

    private func getFormatteDateString(from string: String?) -> String?{
        guard let string = string,
              let date = dateFormatter.date(from: string)
        else{
            return nil
        }

        return mediumStyleDateFormatter.string(from: date)
    }
    private func getColor(for successRate: Int?) -> Color{
        guard let rate = successRate else{
            return .secondary
        }
        switch rate{
        case 0...29:
            return .red
        case 30...59:
            return .orange
        case 60...100:
            return .green
        default:
            return .secondary
        }
    }
    private func openWikipedia(_ urlString: String?){
        guard let str = urlString, let url = URL(string: str) else{
            return
        }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
}

struct RocketDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RocketDetailView(rocket: Rocket(height: nil, diameter: nil, mass: nil, firstStage: nil, secondStage: nil, engines: nil, landingLegs: nil, payloadWeights: nil, flickrImages: nil, name: nil, type: nil, active: nil, stages: nil, boosters: nil, costPerLaunch: nil, successRatePct: nil, firstFlight: nil, country: nil, company: nil, wikipedia: nil, rocketDescription: nil, id: "1"))
    }
}

extension Image{
    
}
