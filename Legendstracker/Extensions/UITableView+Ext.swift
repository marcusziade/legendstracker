//
//  UITableView+Ext.swift
//  legendstracker
//
//  Created by Marcus Ziadé on 29.9.2022.
//

import Foundation
import UIKit

public extension UITableView {

    final func registerCell<T: UITableViewCell>(_ cell: T.Type) {
        register(cell, forCellReuseIdentifier: NSStringFromClass(cell))
    }

    final func registerHeaderFooterView<T: UITableViewHeaderFooterView>(_ header: T.Type) {
        register(header, forHeaderFooterViewReuseIdentifier: NSStringFromClass(header))
    }

    final func dequeueCell<T: UITableViewCell>(_ cell: T.Type, forIndexPath indexPath: IndexPath!) -> T {
        return dequeueReusableCell(withIdentifier: NSStringFromClass(cell), for: indexPath) as! T
    }

    final func dequeueHeaderFooterView<T: UITableViewHeaderFooterView>(_ header: T.Type) -> T {
        return dequeueReusableHeaderFooterView(withIdentifier: NSStringFromClass(header)) as! T
    }
}