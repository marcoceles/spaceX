//
//  RocketsListView.swift
//  spaceX
//
//  Created by Marco Celestino on 20/02/2021.
//

import SwiftUI

struct RocketsListView: View {

    @ObservedObject var viewModel: RocketViewModel

    init(viewModel: RocketViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        NavigationView {
            List {
                if viewModel.dataSource.isEmpty {
                    emptySection
                } else {
                    cityHourlyWeatherSection
                    forecastSection
                }
            }
            .listStyle(GroupedListStyle())
            .navigationBarTitle("Weather ⛅️")
        }
    }
}

struct WeeklyWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}

private extension RocketsListView {

    var rocketsSection: some View {
        Section {
            NavigationLink(destination: viewModel.rocketDetailView) {
                VStack(alignment: .leading) {
                    Text(viewModel.city)
                    Text("Weather today")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
            }
        }
    }


    var emptySection: some View {
        Section {
            Text("No results")
                .foregroundColor(.gray)
        }
    }
}
