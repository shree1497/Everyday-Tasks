//
//  ViewController.swift
//  EverydayTasks
//
//  Created by Shreedhar Prabhu on 02/10/21.
//

import Cocoa

class ViewController: NSViewController, NSComboBoxDataSource{

    @IBOutlet weak var mDatePicker: NSDatePicker!
    @IBOutlet weak var mTaskPicker: NSComboBox!
    @IBOutlet weak var mTaskTime: NSTextField!
    @IBOutlet weak var mShowTasks: NSTextField!
    
    let myArray = ["Hello1", "Hello2", "Hello3", "Hello4"]
    let myList = TaskUtil()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        self.mTaskPicker.usesDataSource = true
        self.mTaskPicker.dataSource = self
        self.mShowTasks.isHidden = true
        
        let lDate1 = Date()
        let lDate2 = Calendar.current.date(byAdding: .day, value: 1, to: lDate1)!
        
        let task1 = Task(name: "Task1",time: 0.5)
        let task2 = Task(name: "Task2",time: 0.6)
        let task3 = Task(name: "Task3",time: 0.5)
        let task4 = Task(name: "Task4",time: 0.7)
        
        
        myList.myAdd(task: task1, forDate: lDate1);
        myList.myAdd(task: task2, forDate: lDate1);
        
        myList.myAdd(task: task3, forDate: lDate2);
        myList.myAdd(task: task4, forDate: lDate2);
        myList.myAdd(task: task1, forDate: lDate2);
        myList.myAdd(task: task2, forDate: lDate2);
        
//        myList.myPrint()
        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    
    func numberOfItems(in comboBox: NSComboBox) -> Int {
        return myList.DistinctStrings.count
        
    }

    func comboBox(_ comboBox: NSComboBox, objectValueForItemAt index: Int) -> Any? {
        return myList.DistinctStrings[index]
    }

    @IBAction func submitButtonClicked(_ sender: Any) {
        print("submitButtonClicked")
        myList.myAdd(task: Task(name: mTaskPicker.stringValue, time: mTaskTime.doubleValue), forDate: mDatePicker.dateValue)
        myList.myPrint()
        self.mTaskPicker.reloadData()
    }
    
    @IBAction func showTasksButtonClicked(_ sender: Any) {
        print("showTasksButtonClicked")
        guard let myShowTask = myList.TaskSchedule[DateUtils.getCustomFormattedDateString(fromDate: self.mDatePicker.dateValue)] else {
            self.mShowTasks.isHidden = true
            return
        }
        self.mShowTasks.isHidden = false
        self.mShowTasks.stringValue = myShowTask.description
    }
}

