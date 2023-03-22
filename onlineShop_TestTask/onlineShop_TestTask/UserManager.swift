// UserManager.swift
// onlineSHop_TestTask. Created by Zlata Guseva.

import Foundation
import RealmSwift

class UserManager {
    // swiftlint:disable force_try
    let realm = try! Realm()
    // swiftlint:enable force_try
    lazy var users = realm.objects(User.self)

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

    func getPassword(email: String) -> String {
        let user = realm.object(ofType: User.self, forPrimaryKey: email)
        return user?.password ?? ""
    }

    func isUserExist(email: String) -> Bool {
        if let _ = realm.object(ofType: User.self, forPrimaryKey: email) {
            return true
        }
        return false
    }
}
