//
//  TaskCompleterProperties.swift
//  TaskCompleter
//
//  Created by Justin Bengtson on 10/19/19.
//  Copyright © 2019 Justin Bengtson. All rights reserved.
//

import Foundation

struct TaskCompleter: Codable {
    var title: [String]
    let taskDetail: String?
    let taskCompleted: Bool?
}
