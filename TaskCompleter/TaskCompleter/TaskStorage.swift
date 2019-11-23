//
//  TaskCompleterSaveAndLoad.swift
//  TaskCompleter
//
//  Created by Justin Bengtson on 11/6/19.
//  Copyright © 2019 Justin Bengtson. All rights reserved.
//

import Foundation

final class TaskStorage {

    static let shared = TaskStorage()
    
    func saveTasks(taskDataSource: [TaskCompleterModel]) {
        let defaults = UserDefaults.standard
        if let data = try? JSONEncoder().encode(taskDataSource) {
            defaults.set(data, forKey: "task")
        }
    }
    
    func loadTasks() -> [TaskCompleterModel]? {
        if let savedTasks = UserDefaults.standard.object(forKey: "task") as? Data {
            let decoder = JSONDecoder()
            if let loadedTasks = try? decoder.decode([TaskCompleterModel].self, from: savedTasks) {
                print(loadedTasks)
                return loadedTasks
            }
        }
        return nil
    }
}
