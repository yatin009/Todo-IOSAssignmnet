//
//  ToDoTableViewController.swift
//  ToDo-Assignment
//
//  Created by Yatin on 31/01/17.
//  Copyright © 2017 MAPD-124. All rights reserved.
//

import UIKit

class ToDoTableViewController: UITableViewController, EditTaskDelegate, AddTaskDelegate {

    var todoList : [TodoModel] = []
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("Click")
        
         if let destinationViewController = segue.destination as? AddToViewController {
            destinationViewController.delegate = self
        }
        
        if let destinationViewController = segue.destination as? EditTodoViewController {
            let row = self.tableView.indexPathForSelectedRow!.row
            let name = todoList[row].name;
            print(row)
            print(name)
            destinationViewController.todoTask = todoList[row]
            destinationViewController.taskPosition = row
            destinationViewController.delegate = self
        }
    }
    
    
    func updateTodoTask(data: TodoModel, position: Int) {
        // Uses the data passed back
        print("Delegate EDIT")
        print(data.name)
        todoList[position] = data
        self.tableView.reloadData()
        //        self.tableView.reloadRowsAtIndexPaths(position, withRowAnimation: UITableViewRowAnimation.None)
    }
    
    func addTodoTask(data: TodoModel) {
        // Uses the data passed back
        print("Delegate ADD")
        print(data.name)
        todoList.append(data)
        self.tableView.reloadData()
        //        self.tableView.reloadRowsAtIndexPaths(position, withRowAnimation: UITableViewRowAnimation.None)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        initializeToDoList()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    func initializeToDoList(){
        let todo1 = TodoModel("Task 1", false, "Note 1")
        let todo2 = TodoModel("Task 2", false, "Note 2")
        let todo3 = TodoModel("Task 3", true, "Note 3")
        todoList.append(todo1)
        todoList.append(todo2)
        todoList.append(todo3)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return todoList.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "todoCell", for: indexPath) as! ToDoTableViewCell

        let todoTask = self.todoList[indexPath.row]
        cell.todoName.text = todoTask.name
        cell.todoSwitch.setOn(todoTask.isDone, animated: true)

        return cell
    }


    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
