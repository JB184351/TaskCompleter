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
    var currentTaskDetails = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDetailVIewUI()
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    private func setupDetailVIewUI() {
        taskLabel?.text = currentTask
        currentTaskDetails = taskDetails.text
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(editTask))
        taskDetails.text = "Placeholder"
        taskDetails.textColor = .lightGray
        
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == .lightGray {
            textView.textColor = .black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "Placeholder"
            textView.textColor = .lightGray
        }
    }
    
    @objc func editTask(_ task: String) {
        print("Edit")
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    private func saveTasks(tasks: [String]) {
        let defaults = UserDefaults.standard
        defaults.set(currentTaskDetails, forKey: "taskDetails")
    }
    
    private func loadTasks() {
        currentTaskDetails = UserDefaults.standard.string(forKey: "taskDetails") ?? ""
        print(currentTaskDetails)
    }
    
    
    

}
