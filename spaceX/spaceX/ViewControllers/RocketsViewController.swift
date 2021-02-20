//
//  RocketsViewController.swift
//  spaceX
//
//  Created by Marco Celestino on 17/02/2021.
//

import UIKit
import SwiftUI
import Combine

class RocketsViewController: UIViewController {

    //MARK: - IBOutlets
    @IBOutlet weak var tableView: UITableView!

    //MARK: - Properties
    var viewModel = RocketViewModel()

    private var rocketsSubscriber : AnyCancellable?

    private var rockets = [Rocket]()

    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        subscribe()
    }

    private func subscribe(){
        rocketsSubscriber = viewModel.dataSource
            .sink(receiveValue: { [weak self] (rockets) in
                self?.rockets = rockets
                self?.tableView.reloadData()
            })
    }
}

//MARK: - TableViewDataSource
extension RocketsViewController: UITableViewDataSource{

    func numberOfSections(in tableView: UITableView) -> Int {
        return rockets.count > 0 ? 1 : 0
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rockets.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "rocketCell") as! RocketTableViewCell
        cell.rocket = rockets[indexPath.row]
        return cell
    }
}

//MARK: - TableViewDelegate
extension RocketsViewController: UITableViewDelegate{

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let rocket = rockets[indexPath.row]
        let detailView = RocketDetailView(rocket: rocket)
        let hostingCtrl = UIHostingController(rootView: detailView)
        self.navigationController?.pushViewController(hostingCtrl, animated: true)
    }
}
