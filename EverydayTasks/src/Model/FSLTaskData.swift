
//  FSLTaskData.swift
//  EverydayTasks
//
//  Created by Shreedhar Prabhu on 02/10/21.
//

import Cocoa

enum TaskUtilError : Error {
    case saidTaskDoesNotExist
    case noTasksExist
    case updateTaskFailed
    case invalidUpdateParameters
}

//class Task : CustomStringConvertible, Equatable{
//    var mstrName : String
//    var mdTimeTaken : Double
//    var mIdentifier : UUID
//    
//    init(name:String?, time:Double?, identifier:UUID?) {
//        mstrName = name ?? ""
//        mdTimeTaken = time ?? 0
//        mIdentifier = identifier ?? UUID()
//    }
//    
//    convenience init(name:String, time:Double) {
//        self.init(name:name, time:time, identifier:nil)
//    }
//    
//    convenience init(identifier:UUID) {
//        self.init(name:nil, time:nil, identifier:identifier)
//    }
//    
//    var description: String {
//        return "<\(mstrName) : \(mdTimeTaken)>"
//    }
//    
//    public static func == (lhs: Task, rhs: Task) -> Bool {
//        return (lhs.mIdentifier == rhs.mIdentifier) ||
//            (lhs.mstrName == rhs.mstrName && lhs.mdTimeTaken == rhs.mdTimeTaken)
//    }
//}

class DateUtils {
    
    class func getCustomFormattedDateString(fromDate:Date) -> String {
        let myDateStyle = DateFormatter()
        myDateStyle.dateStyle = .medium
        myDateStyle.timeStyle = .none
        
        return myDateStyle.string(from: fromDate)
    }
}

extension Date {
    public static func == (lhs: Date, rhs: Date) -> Bool {
        return DateUtils.getCustomFormattedDateString(fromDate:lhs) == DateUtils.getCustomFormattedDateString(fromDate:rhs)
    }
}

//extension Dictionary where Key == String, Value == [Task] {
//    subscript(date: Date) -> [Task]? {
//        get {
//            let dateString = DateUtils.getCustomFormattedDateString(fromDate: date)
//            return self[dateString]
//        }
//        set {
//            let dateString = DateUtils.getCustomFormattedDateString(fromDate: date)
//            self[dateString] = newValue
//        }
//    }
//}
//
//class TaskUtil : NSObject{
//
//    var TaskSchedule : [String: [Task]]
//    var DistinctStrings : NSMutableOrderedSet
//    var ManagedContext : NSManagedObjectContext
//
//    init(withContext context: NSManagedObjectContext) {
//
//        TaskSchedule = [:]
//
//        DistinctStrings = []
//
//        ManagedContext = context
//        super.init()
//    }
//
//    func addTask(task:Task, forDate:Date) -> Void {
//        var tasks : Array<Task> = TaskSchedule[forDate] ?? []
//        tasks.append(task)
//        TaskSchedule[forDate] = tasks
//
//        DistinctStrings.add(task.mstrName!)
//    }
//
//    func addTask(name:String, timeTaken:Double, forDate:Date) -> Void {
//        let task:Task = Task(name: name, time: timeTaken, context: ManagedContext)
//        addTask(task: task, forDate: forDate)
//    }
    
//    func myPrint() -> Void {
//        for key:String in TaskSchedule.keys {
//            print(key, separator: "", terminator: " -> ")
//            print(TaskSchedule[key] ?? "[]", separator: ", ", terminator: "")
//            print()
//        }
//    }
    
//    func removeTask(taskToRemove:Task, forDate:Date) throws -> Void {
//        if var tasks : Array<Task> = TaskSchedule[forDate] {
//            if tasks.contains(taskToRemove) {
//                tasks.removeAll(where:{ $0 == taskToRemove })
//                TaskSchedule[forDate] = tasks
//            }
//            else {
//                throw TaskUtilError.saidTaskDoesNotExist
//            }
//        }
//        else {
//            throw TaskUtilError.noTasksExist
//        }
//    }
//
//    func removeTask(name:String, time:Double, forDate:Date) throws -> Void  {
//        let taskToRemove = Task(name: name, time: time, context: ManagedContext)
//        try removeTask(taskToRemove: taskToRemove, forDate: forDate)
//    }
//
//    func removeTask(uuid:UUID, forDate:Date) throws -> Void {
//        let taskToRemove = Task(identifier: uuid, context: ManagedContext)
//        try removeTask(taskToRemove: taskToRemove, forDate: forDate)
//    }
//
//    func updateTask(oldTask:Task, oldDate:Date, newTask:Task, newDate:Date) throws -> Void {
//        if (oldTask == newTask) && (oldDate == newDate) {
//            throw TaskUtilError.invalidUpdateParameters
//        }
//        do {
//            addTask(task: newTask, forDate: newDate)
//            try removeTask(taskToRemove: oldTask, forDate: oldDate)
//        } catch is TaskUtilError {
//            try! removeTask(taskToRemove: newTask, forDate: newDate)
//            throw TaskUtilError.updateTaskFailed
//        }
//    }
//
//    func updateTask(oldTaskName: String, oldTaskTime:Double, oldTaskDate: Date,
//                    newTaskName: String, newTaskTime:Double, newTaskDate:Date) throws -> Void {
//        let oldTask :Task = Task(name: oldTaskName, time: oldTaskTime, context: ManagedContext)
//        let newTask :Task = Task(name: newTaskName, time: newTaskTime, context: ManagedContext)
//        try updateTask(oldTask: oldTask, oldDate: oldTaskDate,
//                       newTask: newTask, newDate: newTaskDate)
//
//    }
//
//    func updateTask(oldTaskUUID:UUID, oldTaskDate:Date,
//                    newTaskUUID:UUID, newTaskDate:Date) throws -> Void {
//        let oldTask :Task = Task(identifier: oldTaskUUID, context: ManagedContext)
//        let newTask :Task = Task(identifier: newTaskUUID, context: ManagedContext)
//        try updateTask(oldTask: oldTask, oldDate: oldTaskDate,
//                       newTask: newTask, newDate: newTaskDate)
//    }
//
//}

