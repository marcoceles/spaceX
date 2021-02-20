//
//  RocketDetailView.swift
//  spaceX
//
//  Created by Marco Celestino on 19/02/2021.
//

import SwiftUI

struct RocketDetailView: View {

    private let viewModel : RocketDetailViewModel

    init(viewModel: RocketDetailViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        
        VStack {

            RemoteImage(url: viewModel.imageUrl)
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .padding(10)

            HStack (alignment: .top){
                VStack(alignment: .leading){
                    VStack(alignment: .leading, spacing: 8) {
                        VStack(alignment: .leading) {
                            Text(viewModel.status)
                                .foregroundColor(Color(viewModel.statusColor))
                        }

                        VStack(alignment: .leading) {
                            Text("📍 Country:")
                                .foregroundColor(.secondary)
                            Text(viewModel.item.country ?? "-")
                        }

                        VStack(alignment: .leading) {
                            Text("🚀 First flight:")
                                .foregroundColor(.secondary)
                            Text(viewModel.firtsLaunchDate)
                        }

                        VStack(alignment: .leading) {
                            Text("💰 Cost per launch:")
                                .foregroundColor(.secondary)
                            Text(viewModel.costPerLaunch)
                        }
                    }
                }

                Spacer()

                VStack{
                    Text("SUCCESS RATE")
                        .fontWeight(.regular)
                        .font(.callout)
                    ZStack{
                        Color(viewModel.successRateColor)
                        Text("\(viewModel.item.successRatePct ?? 0)%")
                            .foregroundColor(.white)
                            .fontWeight(.medium)
                    }
                    .frame(width: 60, height: 28, alignment: .center)
                    .clipShape(RoundedRectangle(cornerRadius: 14))
                }
            }
            .padding(10)

            if let desc = viewModel.item.rocketDescription{
                Text(desc)
                    .padding(10)
            }
            Spacer()
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("Wikipedia") {
                    viewModel.openWikipedia()
                }
            }
        }
        .navigationBarTitle(self.viewModel.item.name ?? "Rocket", displayMode: .large)
    }
}
