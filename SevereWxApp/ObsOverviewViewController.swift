//
//  ObsOverviewViewController.swift
//  SevereWxApp
//
//  Created by michael on 30/12/2017.
//  Copyright © 2017 chase2be. All rights reserved.
//

import UIKit

class ObsOverviewViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let repo = ObservationRepo()
        repo.getAllObservations()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
