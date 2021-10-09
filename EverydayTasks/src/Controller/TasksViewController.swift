//
//  TasksViewController.swift
//  EverydayTasks
//
//  Created by Shreedhar Prabhu on 08/10/21.
//

import Cocoa

class TasksViewController: NSViewController{
    
    let arr = ["Hello1", "World1","Hello2", "World2"]
    var mTasks : [Task]?
    @IBOutlet weak var mTasksTableView: NSTableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        populateTaskTableView()
        
    }
    
    @IBAction func dismissButtonClicked(_ sender: Any) {
        dismiss(self)
    }
    
    func populateTaskTableView() -> Void {
        do {
            try mTasks = TaskHelper.getAllTasks()
        } catch {
            print("Error Fetching Data \(error)")
        }
        DispatchQueue.main.async {
            self.mTasksTableView.reloadData()
        }
        
    }

}

extension TasksViewController : NSTableViewDataSource {
    func numberOfRows(in tableView: NSTableView) -> Int {
        return mTasks?.count ?? 0
    }
}

extension TasksViewController : NSTableViewDelegate {
    
    fileprivate enum CellIdentifiers {
        static let DateCell : NSUserInterfaceItemIdentifier = NSUserInterfaceItemIdentifier("idDateCell")
        static let NameCell : NSUserInterfaceItemIdentifier = NSUserInterfaceItemIdentifier("idNameCell")
        static let CategoryCell : NSUserInterfaceItemIdentifier = NSUserInterfaceItemIdentifier("idCategoryCell")
        static let TimeCell : NSUserInterfaceItemIdentifier = NSUserInterfaceItemIdentifier("idTimeCell")
      }
    
    fileprivate enum ColumnIdentifiers {
        static let DateColumn : NSUserInterfaceItemIdentifier = NSUserInterfaceItemIdentifier("idDateColumn")
        static let NameColumn : NSUserInterfaceItemIdentifier = NSUserInterfaceItemIdentifier("idNameColumn")
        static let CategoryColumn : NSUserInterfaceItemIdentifier = NSUserInterfaceItemIdentifier("idCategoryColumn")
        static let TimeColumn : NSUserInterfaceItemIdentifier = NSUserInterfaceItemIdentifier("idTimeColumn")
      }
    
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        
        var cellIdentifier: NSUserInterfaceItemIdentifier = NSUserInterfaceItemIdentifier("")
        var text: String?
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        
        guard let task:Task = mTasks?[row] else {
            return nil
        }
        
        if tableColumn?.identifier == ColumnIdentifiers.DateColumn {
            cellIdentifier = CellIdentifiers.DateCell
            text = dateFormatter.string(from: task.mDate ?? Date.distantPast)
        }
        else if tableColumn?.identifier == ColumnIdentifiers.NameColumn {
            cellIdentifier = CellIdentifiers.NameCell
            text = task.mstrName
        }
        else if tableColumn?.identifier == ColumnIdentifiers.CategoryColumn {
            cellIdentifier = CellIdentifiers.CategoryCell
            text = task.mstrCategory
        }
        else if tableColumn?.identifier == ColumnIdentifiers.TimeColumn {
            cellIdentifier = CellIdentifiers.TimeCell
            text = String(task.mdTimeTaken)
        }
        
        
        guard let cellView = tableView.makeView(withIdentifier: cellIdentifier, owner: self) as? NSTableCellView else {
            return nil
        }
        cellView.textField?.stringValue = text ?? ""
        return cellView
    }
}
