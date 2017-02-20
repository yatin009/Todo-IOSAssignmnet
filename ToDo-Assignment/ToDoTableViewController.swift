//
//  ToDoTableViewController.swift
//  ToDo-Assignment
//
//  Created by Yatin on 31/01/17.
//  Copyright © 2017 MAPD-124. All rights reserved.
//

import UIKit
import RealmSwift

class ToDoTableViewController: UITableViewController, EditTaskDelegate, AddTaskDelegate {

    var todos : [TodoModel] = []
    
    
    
    func updateTodoTask(data: TodoModel, position: Int) {
        initializeToDoList(true)
        print("Delegate UPDATE")
    }
    
    func addTodoTask(data: TodoModel) {
        initializeToDoList(true)
        print("Delegate ADD")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        initializeToDoList(false)
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
        
    func initializeToDoList(_ isReload: Bool){
        let realm = try! Realm()
        todos =  Array(realm.objects(TodoModel.self))
        print(todos.count)
        if(isReload){
            self.tableView.reloadData()
        }
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
        return todos.count
    }

    @IBAction func deleteAllAction(_ sender: UIBarButtonItem) {
        let realm = try! Realm()
        // Delete all objects from the realm
        try! realm.write {
            realm.deleteAll()
        }
        initializeToDoList(true)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "todoCell", for: indexPath) as! ToDoTableViewCell

        let todoTask = self.todos[indexPath.row]
        print(todoTask.name)

        cell.todoName.text = todoTask.name
        cell.todoSwitch.setOn(todoTask.isDone, animated: true)
        cell.todoSwitch.tag = indexPath.row
        cell.todoSwitch.addTarget(self, action: #selector(ToDoTableViewController.switchChanged(_:)), for: UIControlEvents.valueChanged)
        return cell
    }
    
    func switchChanged(_ mySwitch: UISwitch!) {
        let value = mySwitch.isOn
        print(value)
        print(mySwitch.tag)
        let realm = try! Realm()
        try! realm.write {
            todos[mySwitch.tag].isDone = value
        }
        // Do something
    }


    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            let todoTask = self.todos[indexPath.row]
            let realm = try! Realm()
            try! realm.write {
                realm.delete(todoTask)
            }
            initializeToDoList(true)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }


    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("Click")
        
        if let destinationViewController = segue.destination as? AddToViewController {
            destinationViewController.delegate = self
        }
        
        if let destinationViewController = segue.destination as? EditTodoViewController {
            let row = self.tableView.indexPathForSelectedRow!.row
            let name = todos[row].name;
            print(row)
            print(name)
            destinationViewController.todoTask = todos[row]
            destinationViewController.taskPosition = row
            destinationViewController.delegate = self
        }
    }
    

}
