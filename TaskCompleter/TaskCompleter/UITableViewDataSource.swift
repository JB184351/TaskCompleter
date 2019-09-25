//
//  UITableViewDataSource.swift
//  TaskCompleter
//
//  Created by Justin Bengtson on 9/14/19.
//  Copyright © 2019 Justin Bengtson. All rights reserved.
//

import Foundation
import UIKit

extension TaskViewController {
  
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return tasks.count
  }
  
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "Task", for: indexPath)
    cell.textLabel?.text = tasks[indexPath.row]
    return cell
  }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailTaskViewController {
            task = tasks[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}
