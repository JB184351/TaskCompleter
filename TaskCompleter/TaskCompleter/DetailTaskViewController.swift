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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDetailVIewUI()
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    private func setupDetailVIewUI() {
        taskLabel?.text = currentTask
    }
    
    private func saveTaskDetails(with taskDetails: String) {
        let defaults = UserDefaults.standard
        defaults.set(TaskCompleterModel(name: currentTask, taskDetail: taskDetails, taskCompleted: nil), forKey: "taskDetails")
    }
    
    private func loadTaskDetails() {
        
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    
    

}
