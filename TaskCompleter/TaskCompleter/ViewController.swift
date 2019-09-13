//
//  ViewController.swift
//  TaskCompleter
//
//  Created by Justin Bengtson on 9/11/19.
//  Copyright © 2019 Justin Bengtson. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    var tasks: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTask))
        loadTasks()
        tableView.reloadData()
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
        
        tableView.reloadData()
    }
    
    func submitTask(_ task: String) {
        tasks.insert(task, at: 0)
        let indexPath = IndexPath(row: 0, section: 0)
        saveTasks(tasks: tasks)
        tableView.insertRows(at: [indexPath], with: .automatic)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Task", for: indexPath)
        cell.textLabel?.text = tasks[indexPath.row]
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            title = tasks[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    func saveTasks(tasks: [String]) {
        let defaults = UserDefaults.standard
        defaults.set(tasks, forKey: "tasks")
    }
    
    func loadTasks() {
        tasks = UserDefaults.standard.array(forKey: "tasks") as? [String] ?? []
        print(tasks)
    }
    
    


}

