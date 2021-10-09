//
//  TaskHelper.swift
//  EverydayTasks
//
//  Created by Shreedhar Prabhu on 09/10/21.
//

import Cocoa

enum TaskHelperError : Error {
    case NO_CORE_DATA_CONTEXT
    case UNKNOWN
}

enum TaskAttributes {
    static let NameColumn : String = "mstrName"
    static let TimeTakenColumn : String = "mdTimeTaken"
    static let CategoryColumn : String = "mstrCategory"
    static let DateColumn : String = "mDate"
    static let IdentifierColumn : String = "mIdentifier"
}

class TaskHelper {
    class func getAllTasks() throws -> [Task] {
        guard let lCoreDataContext = (NSApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext else {
            throw TaskHelperError.NO_CORE_DATA_CONTEXT
        }
        return try lCoreDataContext.fetch(Task.fetchRequest())
    }
    
    class func getUniqueEntries(ofColumns pColumns:[String]) throws -> [Dictionary<String,Any>] {
        guard let lCoreDataContext = (NSApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext else {
            throw TaskHelperError.NO_CORE_DATA_CONTEXT
        }
        let lRequest = NSFetchRequest<NSFetchRequestResult>(entityName:Task.className())
        lRequest.resultType = .dictionaryResultType
        lRequest.returnsDistinctResults = true
        lRequest.propertiesToFetch = pColumns
        
        return try lCoreDataContext.fetch(lRequest) as? [Dictionary<String,Any>] ?? [["":""]]
    }
}
