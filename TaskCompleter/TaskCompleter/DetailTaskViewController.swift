//
//  DetailViewController.swift
//  TaskCompleter
//
//  Created by Justin Bengtson on 9/12/19.
//  Copyright © 2019 Justin Bengtson. All rights reserved.
//

import UIKit

class DetailTaskViewController: UIViewController {
    @IBOutlet var taskLabel: UILabel!
    @IBOutlet var taskDetails: UITextView!
    var currentTask = String()
    var taskStorage = TaskStorage.sharedTaskStorage
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDetailVIewUI()
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    private func setupDetailVIewUI() {
        taskLabel?.text = currentTask
        let saveButton = UIBarButtonItem.init(barButtonSystemItem: .save, target: self, action: #selector(saveTaskDetails))
        navigationItem.rightBarButtonItem = saveButton
        
    }
    
    private func filterString(with selectedTask: String) {
        let filteredString = taskStorage.taskDataSource.filter(selectedTask)
    }
    
    @objc private func saveTaskDetails() {
        var details = taskDetails.text
        var taskCompleterModelArray = [TaskCompleterModel]()
        
        taskStorage.saveTasks(taskDataSource: [taskStorage.taskDataSource[0]])
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    
    

}
