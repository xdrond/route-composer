//
// RouteComposer
// WishListContextTask.swift
// https://github.com/ekazaev/route-composer
//
// Created by Eugene Kazaev in 2018-2020.
// Distributed under the MIT license.
//

import Foundation
import RouteComposer
import UIKit

class WishListContextTask: ContextTask {

    func perform(on viewController: WishListViewController, with context: WishListContext) throws {
        viewController.context = context
    }

}
