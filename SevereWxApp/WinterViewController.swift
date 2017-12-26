//
//  WinterViewController.swift
//  SevereWxApp
//
//  Created by michael on 26/12/2017.
//  Copyright © 2017 chase2be. All rights reserved.
//

import UIKit

class WinterViewController: UIViewController, UITableViewDataSource {
    
    // aantal secties
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // aantal rijen
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    // Tabel opvullen
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        
        cell.textLabel?.text = "winter"
        
        return cell
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        print("winter")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
