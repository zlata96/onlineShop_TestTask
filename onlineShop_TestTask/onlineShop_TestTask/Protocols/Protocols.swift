//
//  Protocols.swift
//  onlineShop_TestTask
//
//  Created by Zlata  on 19.03.2023.
//

import UIKit

/// Определяет возможность настройки представления
protocol Configurable where Self: UIView {
    associatedtype ViewModel

    /// Настраивает отображение
    ///
    /// - Parameter viewModel: Модель представления для конфигурации
    func configure(with viewModel: ViewModel)
}
