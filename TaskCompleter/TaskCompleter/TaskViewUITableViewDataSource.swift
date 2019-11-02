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
        return taskCompleterDataSource.count
  }
  
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Task", for: indexPath)
        cell.textLabel?.text = taskCompleterDataSource[indexPath.row].title
        return cell
  }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "DetailTask") as? DetailTaskViewController {
            vc.currentTask = tasksDataSource[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    func stringToTaskCompleter() {
        let stringToTaskCompleter = tasksDataSource.map { TaskCompleterModel(title: $0, taskDetail: nil, taskCompleted: nil)}
        print(stringToTaskCompleter[0].title)
    }
}
