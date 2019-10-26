//
//  ViewController.swift
//  TaskCompleter
//
//  Created by Justin Bengtson on 9/11/19.
//  Copyright © 2019 Justin Bengtson. All rights reserved.
//

import UIKit

class TaskViewController: UITableViewController {
    
    var tasks: [String] = []
    var taskcompleter: [TaskCompleter] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadTasks()
        setupUI()
        tableView.reloadData()
        print(tasks)
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
        tableView.performBatchUpdates(
        {tasks.insert(task, at: 0)
        let indexPath = IndexPath(row: 0, section: 0)
        saveTasks(task: tasks)
        tableView.insertRows(at: [indexPath], with: .automatic)
        }, completion: nil)
    }
    
    private func saveTasks(task: [String]) {
        let defaults = UserDefaults.standard
        let transformedTaskCompleter = task.map { TaskCompleter(from: $0) }
        if let data = try? JSONEncoder().encode(transformedTaskCompleter) {
            defaults.set(data, forKey: "task")
        }
        
    }
    
    private func loadTasks() {
        if let savedTasks = UserDefaults.standard.object(forKey: "task") as? Data {
            let decoder = JSONDecoder()
            if let loadedTask = try? decoder.decode(TaskCompleter.self, from: savedTasks) {
                print(loadedTask.title)
            }
        }
    }
  
}

