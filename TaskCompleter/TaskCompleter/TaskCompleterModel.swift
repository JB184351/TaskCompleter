//
//  TaskCompleterModel.swift
//  TaskCompleter
//
//  Created by Justin Bengtson on 10/19/19.
//  Copyright © 2019 Justin Bengtson. All rights reserved.
//

import Foundation

struct TaskCompleterModel: Codable {
    var name: String
    let taskDetail: String?
    let taskCompleted: Bool?
}
