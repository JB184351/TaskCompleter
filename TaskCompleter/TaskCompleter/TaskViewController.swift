//
//  ViewController.swift
//  TaskCompleter
//
//  Created by Justin Bengtson on 9/11/19.
//  Copyright © 2019 Justin Bengtson. All rights reserved.
//

import UIKit

class TaskViewController: UITableViewController {
    
    var tasksDataSource = TaskStorage.sharedTaskStorage.taskDataSource
    
    override func viewDidLoad() {
        super.viewDidLoad()
        TaskStorage.sharedTaskStorage.loadTasks()
        setupUI()
        tableView.reloadData()
    }
    
    private func setupUI() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTask))
    }
    
    @objc func addTask() {
        let ac = UIAlertController(title: "Enter Task", message: nil, preferredStyle: .alert)
        ac.addTextField()
        
        let submitTask = UIAlertAction(title: "Submit", style: .default) { [weak self, weak ac] action in
            guard let task = ac?.textFields?[0].text else { return }
            self?.submitTask(task)
        }
        
        ac.addAction(submitTask)
        present(ac, animated: true)
    }
    
    func submitTask(_ task: String) {
        tableView.performBatchUpdates({
            tasksDataSource.insert(TaskCompleterModel(name: task, taskDetail: nil, taskCompleted: nil), at: 0)
            let indexPath = IndexPath(row: 0, section: 0)
            TaskStorage.sharedTaskStorage.saveTasks(taskDataSource: tasksDataSource)
            tableView.insertRows(at: [indexPath], with: .automatic)
        }, completion: nil)
    }
}

