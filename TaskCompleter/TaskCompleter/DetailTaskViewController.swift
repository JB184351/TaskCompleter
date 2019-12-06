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
    var selectedTask: TaskCompleterModel?
    weak var delegate: DetailTaskDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDetailVIewUI()
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    private func setupDetailVIewUI() {
        taskLabel.text = selectedTask?.name
        taskDetails.text = selectedTask?.taskDetail
        taskLabel.textColor = .black
        taskDetails.textColor = .black
        taskDetails.backgroundColor = .white
        let saveButton = UIBarButtonItem.init(barButtonSystemItem: .save, target: self, action: #selector(saveTaskDetails))
        navigationItem.rightBarButtonItem = saveButton
    }
    
    @objc private func saveTaskDetails() {
        selectedTask?.taskDetail = taskDetails.text
        delegate?.didUpdate(task: selectedTask)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    
    

}
