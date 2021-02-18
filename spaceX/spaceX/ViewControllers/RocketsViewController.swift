//
//  RocketsViewController.swift
//  spaceX
//
//  Created by Marco Celestino on 17/02/2021.
//

import UIKit

class RocketsViewController: UIViewController {

    //MARK: - IBOutlets
    @IBOutlet weak var tableView: UITableView!

    //MARK: - Properties
    var rockets: [Rocket]?{
        didSet{
            tableView.reloadData()
        }
    }

    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        loadRockets()
    }

    //MARK: - API
    private func loadRockets(){
        APIClient.shared.getRockets { (result) in
            switch result{
            case.success(let rockets):
                self.rockets = rockets
            case .failure(let error):
                print(error)
            }
        }
    }
}

//MARK: - TableViewDataSource
extension RocketsViewController: UITableViewDataSource{

    func numberOfSections(in tableView: UITableView) -> Int {
        return rockets?.count ?? 0 > 0 ? 1 : 0
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rockets?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "rocketCell") as! RocketTableViewCell
        cell.rocket = self.rockets?[indexPath.row]
        return cell
    }
}
