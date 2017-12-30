//
//  ObsOverviewViewController.swift
//  SevereWxApp
//
//  Created by michael on 30/12/2017.
//  Copyright © 2017 chase2be. All rights reserved.
//

import UIKit
import RealmSwift

class ObsOverviewViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var observations: Results<Observation>!
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let repo = ObservationRepo()
        observations = repo.getAllObservations()
    
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return observations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
        cell.textLabel?.text =  observations[indexPath.row].siteName + ": " + observations[indexPath.row].obsType + ": " + observations[indexPath.row].gradation
        
        return cell
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
