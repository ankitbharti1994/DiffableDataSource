//
//  Model.swift
//  DiffableDataSource
//
//  Created by ankit bharti on 06/10/19.
//  Copyright © 2019 ankit kumar bharti. All rights reserved.
//

import Foundation

struct Contact: Hashable {
    var name: String
    var email: String
}

struct ContactList {
    var friends: [Contact]
    var family: [Contact]
    var coworkers: [Contact]
}
