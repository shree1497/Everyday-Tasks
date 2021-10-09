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
    
    var mUniqueTaskNames : NSMutableOrderedSet?
    var mUniqueCategoryNames : NSMutableOrderedSet?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        populateUniqueTaskNames()
        populateUniqueCategoryNames()

    }
    
    func populateUniqueTaskNames() -> Void {
        mUniqueTaskNames = NSMutableOrderedSet()
        var lTaskNamesDictionaryArray: [Dictionary<String,Any>]
        do {
            try lTaskNamesDictionaryArray = TaskHelper.getUniqueEntries(ofColumns: [TaskAttributes.NameColumn])
            for lTaskNamesDictionary : Dictionary<String,Any> in lTaskNamesDictionaryArray {
                if let lTaskName = lTaskNamesDictionary[TaskAttributes.NameColumn] {
                    mUniqueTaskNames?.add(lTaskName as! String)
                }
            }
            DispatchQueue.main.async {
                self.mTaskPicker.reloadData()
            }
        } catch  {
            print("Populating Unique Task Names Failed as \(error)")
        }
    }
    
    func populateUniqueCategoryNames() -> Void {
        mUniqueCategoryNames = NSMutableOrderedSet()
        var lCategoryNamesDictionaryArray: [Dictionary<String,Any>]
        do {
            try lCategoryNamesDictionaryArray = TaskHelper.getUniqueEntries(ofColumns: [TaskAttributes.CategoryColumn])
            for lCategoryNamesDictionary : Dictionary<String,Any> in lCategoryNamesDictionaryArray {
                if let lCategoryName = lCategoryNamesDictionary[TaskAttributes.CategoryColumn] {
                    mUniqueCategoryNames?.add(lCategoryName as! String)
                }
            }
            DispatchQueue.main.async {
                self.mCategoryPicker.reloadData()
            }
        } catch  {
            print("Populating Unique Category Names Failed as \(error)")
        }
    }
    
    func reloadAllDynamicData() -> Void {
        populateUniqueCategoryNames()
        populateUniqueTaskNames()
    }
    
    override var representedObject: Any? {
        didSet {
            // Update the view, if already loaded.
        }
    }
    
    @IBAction func submitButtonClicked(_ sender: Any) {
        let lTaskName : String = mTaskPicker.stringValue
        let lTaskTimeTaken : Double = mTaskTime.doubleValue
        let lTaskCategory : String = mCategoryPicker.stringValue
        let lTaskDate : Date = mDatePicker.dateValue
        
        do {
            try TaskHelper.addTask(withName: lTaskName, timeTaken: lTaskTimeTaken, category: lTaskCategory, date: lTaskDate)
            reloadAllDynamicData()
        } catch {
            print("Adding Task Failed as \(error)")
        }
    }
    
    
}

extension ViewController : NSComboBoxDataSource {
    
    fileprivate enum ComboBoxIdentifiers {
        static let TaskPicker : NSUserInterfaceItemIdentifier = NSUserInterfaceItemIdentifier("idTaskPickerComboBox")
        static let CategoryPicker : NSUserInterfaceItemIdentifier = NSUserInterfaceItemIdentifier("idCategoryPickerComboBox")
    }
    
    func numberOfItems(in comboBox: NSComboBox) -> Int {
        var lComboBoxToUse: NSMutableOrderedSet?
        if comboBox.identifier == ComboBoxIdentifiers.TaskPicker {
            lComboBoxToUse = mUniqueTaskNames
        }
        else if comboBox.identifier == ComboBoxIdentifiers.CategoryPicker {
            lComboBoxToUse = mUniqueCategoryNames
        }
        return lComboBoxToUse?.count ?? 0
        
    }
    
    func comboBox(_ comboBox: NSComboBox, objectValueForItemAt index: Int) -> Any? {
        var lComboBoxToUse: NSMutableOrderedSet?
        if comboBox.identifier == ComboBoxIdentifiers.TaskPicker {
            lComboBoxToUse = mUniqueTaskNames
        }
        else if comboBox.identifier == ComboBoxIdentifiers.CategoryPicker {
            lComboBoxToUse = mUniqueCategoryNames
        }
        return lComboBoxToUse?[index]
    }
}
