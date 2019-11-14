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
    var taskCompleterModelIndex = 0
    
    
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
        taskStorage.loadTasks()
        taskDetails.text = taskStorage.taskDataSource[taskCompleterModelIndex].taskDetail
    }
    
    @objc private func saveTaskDetails() {
        taskStorage.taskDataSource[taskCompleterModelIndex].taskDetail = taskDetails.text
        taskStorage.saveTasks(taskDataSource: [taskStorage.taskDataSource[taskCompleterModelIndex]])
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    
    

}
