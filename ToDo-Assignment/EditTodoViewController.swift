//
//  EditTodoViewController.swift
//  ToDo-Assignment
//
//  Created by Yatin on 31/01/17.
//  Copyright © 2017 MAPD-124. All rights reserved.
//

import UIKit
import RealmSwift

protocol EditTaskDelegate : class {
    func updateTodoTask(data: TodoModel, position: Int)
}

class EditTodoViewController: UIViewController {

    var todoTask : TodoModel = TodoModel()
    weak var delegate: EditTaskDelegate?
    var taskPosition = 0
    
    @IBOutlet weak var nameLabel: UITextField!
    @IBOutlet weak var noteText: UITextField!
    @IBOutlet weak var switchButton: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = todoTask.name
        noteText.text = todoTask.notes
        switchButton.setOn(todoTask.isDone, animated: true)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var updateTask: UIButton!
    @IBAction func updateTaskAction(_ sender: UIButton) {
        let nameValue = nameLabel.text;
        if(nameValue==nil){
            return
        }
        let switchValue = switchButton.isOn
        let notevalue = noteText.text
        if(notevalue==nil){
            return
        }
        
        // Get the default Realm
        let realm = try! Realm()
        
        try! realm.write {
            print("INSIDE REALM WRITE")
            //Updating Realm object values
            todoTask.name = nameValue!
            todoTask.isDone = switchValue
            todoTask.notes = notevalue!
            delegate?.updateTodoTask(data: todoTask, position: taskPosition)
            self.navigationController?.popViewController(animated: true)
        }
    }
    
     /*
   
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
