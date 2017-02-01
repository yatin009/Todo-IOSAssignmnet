//
//  TodoModel.swift
//  ToDo-Assignment
//
//  Created by Yatin on 31/01/17.
//  Copyright © 2017 MAPD-124. All rights reserved.
//

import UIKit

class TodoModel{
    
    var name: String = ""
    var isDone = false
    var notes : String = ""
    
    init(){
        
    }
    
    init(_ name: String,_ isDone: Bool,_ notes: String){
        self.name = name
        self.isDone = isDone
        self.notes = notes
    }
    
}
