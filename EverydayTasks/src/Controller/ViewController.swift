//
//  ViewController.swift
//  EverydayTasks
//
//  Created by Shreedhar Prabhu on 02/10/21.
//

import Cocoa

class ViewController: NSViewController{

    @IBOutlet weak var mDatePicker: NSDatePicker!
    @IBOutlet weak var mTaskPicker: NSComboBox!
    @IBOutlet weak var mCategoryPicker: NSComboBox!
    @IBOutlet weak var mTaskTime: NSTextField!
    
    let myArray = ["Hello1", "Hello2", "Hello3", "Hello4"]
    let context = (NSApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var mTasks : [Task]?
    var mUniqueTaskNames : [String]? = []
    var mUniqueCategoryNames : [String]? = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        do {
            try mTasks = TaskHelper.getAllTasks()
        } catch {
            print("Error Fetching Data \(error)")
        }
        self.populateUniqueTaskNames()
        self.populateUniqueCategoryNames()
//        self.myList = TaskUtil(withContext: context)
        
//        self.mTaskPicker.usesDataSource = true
//        self.mTaskPicker.dataSource = self
    
        
//        let lDate1 = Date()
//        let lDate2 = Calendar.current.date(byAdding: .day, value: 1, to: lDate1)!
//        let lDate3 = Calendar.current.date(byAdding: .day, value: 2, to: lDate1)!
        
//        print(lDate2 == (lDate2+2))
        
//        let task1 = Task(name: "Task1",time: 0.5, context: context)
//        let task2 = Task(name: "Task2",time: 0.6, context: context)
//        let task3 = Task(name: "Task3",time: 0.5, context: context)
//        let task4 = Task(name: "Task4",time: 0.7, context: context)
//        let task5 = Task(name: "Task5",time: 0.4)
        
        
//        myList!.addTask(task: task1, forDate: lDate1);
//        myList!.addTask(task: task2, forDate: lDate1);
//
//        myList!.addTask(task: task3, forDate: lDate2);
//        myList!.addTask(task: task4, forDate: lDate2);
//        myList!.addTask(task: task1, forDate: lDate2);
//        myList!.addTask(task: task2, forDate: lDate2);
//
        
        

//        do {
//            try myList!.updateTask(oldTask: task4, oldDate: lDate1, newTask: task4, newDate: lDate1+1)
//        } catch {
//            print("Help \(error)")
//        }
        
//        myList.myPrint()
        // Do any additional setup after loading the view.
    }
    
    func populateUniqueTaskNames() -> Void {
        var lTaskNamesDictionaryArray: [Dictionary<String,Any>]
        do {
            try lTaskNamesDictionaryArray = TaskHelper.getUniqueEntries(ofColumns: [TaskAttributes.NameColumn])
            for lTaskNamesDictionary : Dictionary<String,Any> in lTaskNamesDictionaryArray {
                if let lTaskName = lTaskNamesDictionary[TaskAttributes.NameColumn] {
                    mUniqueTaskNames?.append(lTaskName as! String)
                }
            
            }
        } catch  {
            print("Populating Unique Task Names Failed as \(error)")
        }
    }
    
    func populateUniqueCategoryNames() -> Void {
        var lCategoryNamesDictionaryArray: [Dictionary<String,Any>]
        do {
            try lCategoryNamesDictionaryArray = TaskHelper.getUniqueEntries(ofColumns: [TaskAttributes.CategoryColumn])
            for lCategoryNamesDictionary : Dictionary<String,Any> in lCategoryNamesDictionaryArray {
                if let lCategoryName = lCategoryNamesDictionary[TaskAttributes.CategoryColumn] {
                    mUniqueCategoryNames?.append(lCategoryName as! String)
                }
            
            }
        } catch  {
            print("Populating Unique Category Names Failed as \(error)")
        }
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    

    

    @IBAction func submitButtonClicked(_ sender: Any) {
        print("submitButtonClicked")
        self.mTaskPicker.reloadData()
    }
    
}

extension ViewController : NSComboBoxDataSource {
    
    fileprivate enum ComboBoxIdentifiers {
        static let TaskPicker : NSUserInterfaceItemIdentifier = NSUserInterfaceItemIdentifier("idTaskPickerComboBox")
        static let CategoryPicker : NSUserInterfaceItemIdentifier = NSUserInterfaceItemIdentifier("idCategoryPickerComboBox")
    }
    
    func numberOfItems(in comboBox: NSComboBox) -> Int {
        var lComboBoxToUse: [String]?
        if comboBox.identifier == ComboBoxIdentifiers.TaskPicker {
            lComboBoxToUse = mUniqueTaskNames
        }
        else if comboBox.identifier == ComboBoxIdentifiers.CategoryPicker {
            lComboBoxToUse = mUniqueCategoryNames
        }
        return lComboBoxToUse?.count ?? 0
        
    }
    
    func comboBox(_ comboBox: NSComboBox, objectValueForItemAt index: Int) -> Any? {
        var lComboBoxToUse: [String]?
        if comboBox.identifier == ComboBoxIdentifiers.TaskPicker {
            lComboBoxToUse = mUniqueTaskNames
        }
        else if comboBox.identifier == ComboBoxIdentifiers.CategoryPicker {
            lComboBoxToUse = mUniqueCategoryNames
        }
        return lComboBoxToUse?[index]
    }
}
