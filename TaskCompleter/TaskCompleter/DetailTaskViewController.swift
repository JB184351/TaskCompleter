//
//  DetailViewController.swift
//  TaskCompleter
//
//  Created by Justin Bengtson on 9/12/19.
//  Copyright © 2019 Justin Bengtson. All rights reserved.
//

import UIKit

protocol DetailTaskDelegate: class {
    func didUpdate(task: TaskCompleterModel?)
}

class DetailTaskViewController: UIViewController {
    
    @IBOutlet var taskLabel: UILabel!
    @IBOutlet var taskDetails: UITextView!
    @IBOutlet var isTaskDoneLabel: UILabel!
    @IBOutlet var isTaskDoneSwitch: UISwitch!
    var selectedTask: TaskCompleterModel?
    weak var delegate: DetailTaskDelegate?
    let userdefaults = UserDefaults.standard
    
    @objc func isTaskCompletead() {
        if isTaskDoneSwitch.isOn {
            selectedTask?.taskCompleted = true
            isTaskDoneSwitch.setOn(isTaskDoneSwitch.isOn, animated: true)
        } else {
            selectedTask?.taskCompleted = false
            isTaskDoneSwitch.setOn(isTaskDoneSwitch.isOn, animated: true)
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDetailVIewUI()
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        isTaskDoneSwitch.addTarget(self, action: #selector(isTaskCompletead), for: .valueChanged)
        view.addGestureRecognizer(tap)
    }
    
    private func setupDetailVIewUI() {
        taskLabel.text = selectedTask?.name
        taskDetails.text = selectedTask?.taskDetail
        isTaskDoneLabel?.textColor = .black
        taskLabel.textColor = .black
        taskDetails.textColor = .black
        taskDetails.backgroundColor = .white
        let saveButton = UIBarButtonItem.init(barButtonSystemItem: .save, target: self, action: #selector(saveTaskDetails))
        navigationItem.rightBarButtonItem = saveButton
    }
    
    @objc private func saveTaskDetails() {
        unwrapSelectedTask()
        delegate?.didUpdate(task: selectedTask)
    }
    
    func unwrapSelectedTask() {
        selectedTask?.taskDetail = taskDetails.text
        
        if let taskDetails = selectedTask?.taskDetail {
            selectedTask?.taskDetail = taskDetails
        } else {
            print("Selected Task Details are nil")
        }
        
        if let taskCompleted = selectedTask?.taskCompleted {
            selectedTask?.taskCompleted = taskCompleted
        } else {
            print("Selected Task completion state is nil")
        }
        
        print(selectedTask)
        
    }
    
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
