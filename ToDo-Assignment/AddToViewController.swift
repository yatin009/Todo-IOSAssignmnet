//
//  AddToViewController.swift
//  ToDo-Assignment
//
//  Created by Yatin on 31/01/17.
//  Copyright © 2017 MAPD-124. All rights reserved.
//

import UIKit

protocol AddTaskDelegate {
    func addTodoTask(data: TodoModel)
}

class AddToViewController: UIViewController {

    var delegate: AddTaskDelegate?
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var switchButton: UISwitch!
    @IBOutlet weak var noteField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

   
     @IBAction func addTaskAction(_ sender: UIButton) {
        let nameValue = nameField.text;
        if(nameValue==nil){
            return
        }
        let switchValue = switchButton.isOn
        let notevalue = noteField.text
        if(notevalue==nil){
            return
        }
        let newTask = TodoModel(nameValue!, switchValue, notevalue!)
        delegate?.addTodoTask(data: newTask)
        self.navigationController?.popViewController(animated: true)

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
