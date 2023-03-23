// UICollectionView+Extension.swift
// onlineSHop_TestTask. Created by Zlata Guseva.

import UIKit

extension UICollectionView {
    func dequeueReusableCell<T: UICollectionViewCell>(withClass name: T.Type, for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withReuseIdentifier: String(describing: name), for: indexPath) as? T else {
            fatalError("Couldn't find \(String(describing: name)), make sure the cell is registered with table view")
        }
        return cell
    }

    func register<T: UICollectionViewCell>(cellWithClass name: T.Type) {
        register(T.self, forCellWithReuseIdentifier: String(describing: name))
    }
}
