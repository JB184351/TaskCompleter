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
    var currentTask = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDetailVIewUI()
    }
    
    private func setupDetailVIewUI() {
        taskLabel?.text = currentTask
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(editTask))
    }
    
    @objc func editTask(_ task: String) {
        print("Edit")
    }
    
    
    

}
