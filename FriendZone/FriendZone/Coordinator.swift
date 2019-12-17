//
//  Coordinator.swift
//  FriendZone
//
//  Created by Felix Lin on 12/16/19.
//  Copyright © 2019 Felix Lin. All rights reserved.
//

import UIKit

protocol Coordinator {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    
    func start()
}
