//
//  UserData.swift
//  Tutorial
//
//  Created by THE3796 on 14/02/2020.
//  Copyright © 2020 Firelabs. All rights reserved.
//

import Foundation
import Combine
import UIKit

final class UserData: ObservableObject {
    @Published var showFavoriteOnly: Bool = false
    @Published var items: [Landmark] = landmarkData
    @Published var showProfile: Bool = false
    @Published var isDark: Bool = UIScreen.main.traitCollection.userInterfaceStyle == .dark ? true : false {
        didSet {
            SceneDelegate.shared?.window!.overrideUserInterfaceStyle = isDark ? .dark : .light
        }
    }
}
