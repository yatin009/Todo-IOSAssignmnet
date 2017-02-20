//
//  TodoModel.swift
//  ToDo-Assignment
//
//  Created by Yatin on 31/01/17.
//  Copyright © 2017 MAPD-124. All rights reserved.
//

import Foundation
import RealmSwift

class TodoModel: Object {
    
    dynamic var name: String = ""
    dynamic var isDone = false
    dynamic var notes : String = ""
    
}
