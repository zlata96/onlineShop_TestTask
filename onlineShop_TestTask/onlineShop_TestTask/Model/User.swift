// User.swift
// onlineSHop_TestTask. Created by Zlata Guseva.

import RealmSwift

class User: Object {
    @Persisted(primaryKey: true) var email: String
    @Persisted var firstName: String
    @Persisted var lastName: String
    @Persisted var password: String

    convenience init(email: String, firstName: String, lastName: String, password: String) {
        self.init()
        self.email = email
        self.firstName = firstName
        self.lastName = lastName
        self.password = password
    }
}
