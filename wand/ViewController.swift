//
//  ViewController.swift
//  wand
//
//  Created by Timothy Yang on 4/1/19.
//  Copyright © 2019 Timothy Yang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var spells = Spells()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        spells.getSpells {
            self.tableView.reloadData()
        }
        //print(spells.spellArray)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowSpellDetail" {
            let destination = segue.destination as! SpellDetailVC
            let selectedIndexPath = tableView.indexPathForSelectedRow!
            destination.spell = spells.spellArray[selectedIndexPath.row]
            
        } else {
            if let selectedPath = tableView.indexPathForSelectedRow {
                tableView.deselectRow(at: selectedPath, animated: true)
            }
        }
    }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return spells.spellArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = spells.spellArray[indexPath.row].name
        
        return cell
    }
}
