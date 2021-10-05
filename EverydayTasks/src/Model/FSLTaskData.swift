//
//  FSLTaskData.swift
//  EverydayTasks
//
//  Created by Shreedhar Prabhu on 02/10/21.
//

import Cocoa

class Task : CustomStringConvertible{
    var name : String
    var time : Double
    
    init(name:String, time:Double) {
        self.name = name
        self.time = time
    }
    
    var description: String {
        return "<\(name) : \(time)>"
    }
}

class DateUtils {
    
    class func getCustomFormattedDateString(fromDate:Date) -> String {
        let myDateStyle = DateFormatter()
        myDateStyle.dateStyle = .medium
        myDateStyle.timeStyle = .none
        
        return myDateStyle.string(from: fromDate)
    }
}

class TaskUtil : NSObject{
    
    var TaskSchedule : [String: [Task]]
    var DistinctStrings : NSMutableOrderedSet
    
    override init() {
        
        self.TaskSchedule = [:]
        
        DistinctStrings = []
        
        super.init()
    }
    
    func myAdd(task:Task, forDate:Date) -> Void {
        let forDateString = DateUtils.getCustomFormattedDateString(fromDate: forDate)
        var value : Array<Task> = TaskSchedule[forDateString] ?? []
        value.append(task)
        TaskSchedule[forDateString] = value
        
        DistinctStrings.add(task.name)
    }
    
    func myPrint() -> Void {
        for key:String in TaskSchedule.keys {
            print(key, separator: "", terminator: " -> ")
            print(TaskSchedule[key] ?? "[]", separator: ", ", terminator: "")
            print()
        }
    }
    
}

