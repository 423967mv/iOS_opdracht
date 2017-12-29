//
//  WinterViewController.swift
//  SevereWxApp
//
//  Created by michael on 26/12/2017.
//  Copyright © 2017 chase2be. All rights reserved.
//

import UIKit

class WinterViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, ExpandableHeaderViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var sections = [
        Section(obsType: "Snowfall",
                obsTypeGradations: ["0-5cm", "5-15cm", "20cm+", "Thundersnow"],
                expanded: false),
        Section(obsType: "Ice",
                obsTypeGradations: ["Refreezing snow", "Ice Pellets"],
                expanded: false)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("winter")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // aantal secties
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    // aantal rijen
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].obsTypeGradations.count
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 45
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if (sections[indexPath.section].expanded){
            return 45
        }
            // indien niet uitgeklapt is de hoogte 0
        else {
            return 0
        }
    }
    
    // spacing tussen de secties
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 2
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header=ExpandableHeaderView()
        header.customInit(title: sections[section].obsType, section: section, delegate: self)
        
        return header
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell=tableView.dequeueReusableCell(withIdentifier: "labelCellWinter")!
        cell.textLabel?.text=sections[indexPath.section].obsTypeGradations[indexPath.row]
        
        return cell
    }
    
    func toggleSection(header: ExpandableHeaderView, section: Int) {
        sections[section].expanded = !sections[section].expanded
        
        tableView.beginUpdates()
        for i in 0 ..< sections[section].obsTypeGradations.count{
            tableView.reloadRows(at: [IndexPath(row: i, section: section)], with: .automatic)
        }
        tableView.endUpdates()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // TODO: actie bij het aanklikken van een rij
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
