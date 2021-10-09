//
//  Task+CoreDataClass.swift
//  EverydayTasks
//
//  Created by Shreedhar Prabhu on 09/10/21.
//
//

import Foundation
import CoreData

@objc(Task)
public class Task: NSManagedObject {

    func populateMembers(taskName pstrName:String, taskTimeTaken pdTimeTaken:Double, taskCategory pstrCategory:String, taskDate pDate:Date) {
        mstrName = pstrName
        mdTimeTaken = pdTimeTaken
        mstrCategory = pstrCategory
        mDate = pDate
        mIdentifier = UUID()
    }
}
