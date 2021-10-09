//
//  AppDelegate.swift
//  EverydayTasks
//
//  Created by Shreedhar Prabhu on 02/10/21.
//

import Cocoa

@main
class AppDelegate: NSObject, NSApplicationDelegate {

    


    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
//        let entity = NSEntityDescription.entity(forEntityName: "Task", in: self.persistentContainer.viewContext)
//        let newTask = NSManagedObject(entity: entity!, insertInto: self.persistentContainer.viewContext)
//
//        newTask.setValue("Task2", forKey: "mstrName")
//        newTask.setValue(0.25, forKey: "mdTimeTaken")
//        newTask.setValue(UUID(), forKey: "mIdentifier")
//        newTask.setValue("Category2", forKey: "mstrCategory")
//        newTask.setValue(Calendar.current.date(byAdding: .day, value: 2, to: Date())!, forKey: "mDate")
//
//        do {
//            try self.persistentContainer.viewContext.save()
//
//        } catch {
//
//            print("Failed saving")
//        }
//
//        newTask.setValue("Task2", forKey: "mstrName")
//        newTask.setValue(0.8, forKey: "mdTimeTaken")
//        newTask.setValue(UUID(), forKey: "mIdentifier")
//        newTask.setValue("Category2", forKey: "mstrCategory")
//        newTask.setValue(Calendar.current.date(byAdding: .day, value: 1, to: Date())!, forKey: "mDate")
//
//        do {
//            try self.persistentContainer.viewContext.save()
//
//        } catch {
//
//            print("Failed saving")
//        }

//        var tasks : [Task]?
//
//        do {
//            tasks = try  self.persistentContainer.viewContext.fetch(Task.fetchRequest())
//        } catch {
//            print("Core Data Help \(error)")
//        }
        
//        let deleteRequest = NSBatchDeleteRequest(fetchRequest: Task.fetchRequest())
//
//        do {
//            try self.persistentContainer.persistentStoreCoordinator.execute(deleteRequest, with: self.persistentContainer.viewContext)
//        } catch  {
//            print("Remove Error \(error)")
//        }
//        do {
//            let req = NSFetchRequest<NSFetchRequestResult>(entityName: "Task")
//            req.resultType = .dictionaryResultType
//            req.returnsDistinctResults = true
//            req.propertiesToFetch = ["mstrName"]
//            let newtasks = try  self.persistentContainer.viewContext.fetch(req)
//            print(newtasks)
//        } catch {
//            print("Core Data Help \(error)")
//        }
//        print(tasks!)
        
        
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
        */
        let container = NSPersistentContainer(name: "EverydayTasks")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                 
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

}

