//
//  RocketViewModel.swift
//  spaceX
//
//  Created by Marco Celestino on 19/02/2021.
//

import Foundation
import Combine

class RocketViewModel: ObservableObject{

    var dataSource = PassthroughSubject<[Rocket], Never>()

    private var disposables = Set<AnyCancellable>()

    init() {
        getRockets()
    }

    private func getRockets(){
        APIClient.shared.getRockets()
            .receive(on: DispatchQueue.main)
            .sink(
                receiveCompletion: { [weak self] value in
                    guard let self = self else { return }
                    switch value {
                    case .failure:
                        self.dataSource.send([])
                    case .finished:
                        break
                    }
                },
                receiveValue: { [weak self] rockets in
                    guard let self = self else { return }
                    self.dataSource.send(rockets)
                })

            .store(in: &disposables)
    }
}
