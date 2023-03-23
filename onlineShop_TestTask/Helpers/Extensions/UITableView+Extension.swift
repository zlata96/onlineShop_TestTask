// UITableView+Extension.swift
// onlineSHop_TestTask. Created by Zlata Guseva.

import UIKit

extension UITableView {
    func dequeueReusableCell<T: UITableViewCell>(withClass name: T.Type) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: String(describing: name)) as? T else {
            fatalError("Couldn't find \(String(describing: name)), make sure the cell is registered with table view")
        }
        return cell
    }

    func register<T: UITableViewCell>(cellWithClass name: T.Type) {
        register(T.self, forCellReuseIdentifier: String(describing: name))
    }
}
