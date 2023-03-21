// UserManager.swift
// onlineSHop_TestTask. Created by Zlata Guseva.

import Foundation
import RealmSwift

class UserManager {
    // swiftlint:disable force_try
    let realm = try! Realm()
    // swiftlint:enable force_try
    func saveUser(email: String, firstName: String, lastName: String, password: String) {
        do {
            try realm.write {
                let newUser = User(email: email, firstName: firstName, lastName: lastName, password: password)
                realm.add(newUser)
            }
        } catch let error as NSError {
            print("Can not create habit, error: \(error)")
        }
    }
}
