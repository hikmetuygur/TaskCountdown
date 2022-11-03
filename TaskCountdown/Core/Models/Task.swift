//
//  Task.swift
//  TaskCountdown
//
//  Created by huygur on 3.11.2022.
//

import Foundation

struct TaskType {
    let symbolName: String
    let typeName: String
    
}

struct Task {
    var taskName: String
    var taskDescription: String
    var seconds: Int
    var taskType: TaskType
    
    var timeStamp: Double
}

enum CoundownState {
    case suspended
    case running
    case paused
}

