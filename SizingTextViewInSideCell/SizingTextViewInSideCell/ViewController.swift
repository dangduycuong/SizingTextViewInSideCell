//
//  ViewController.swift
//  SizingTextViewInSideCell
//
//  Created by Đặng Duy Cường on 6/15/20.
//  Copyright © 2020 Ngô Bảo Châu. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.register(MasterTableViewCell.nib(), forCellReuseIdentifier: MasterTableViewCell.identifier())
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MasterTableViewCell.identifier(), for: indexPath) as! MasterTableViewCell
//        cell.textChanged {[weak tableView] (_) in
//            // Possible solution: 1
//            // Nope, cell changes once and then loses focus
//            tableView?.reloadData()
//        }
        
//        cell.textChanged {[weak tableView] (_) in
//            // Possible solution: 2
//            // Nope, cell is reloaded, text doesn't even change
//            tableView?.reloadRows(at: [indexPath], with: .none)
//        }
        
        cell.textChanged {[weak tableView] (_) in
            // Possible solution: 3
            // Seems to work
            tableView?.beginUpdates()
            tableView?.endUpdates()
        }
        
        return cell
    }
}

