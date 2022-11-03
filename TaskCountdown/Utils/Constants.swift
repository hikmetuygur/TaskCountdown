//
//  Constants.swift
//  TaskCountdown
//
//  Created by huygur on 3.11.2022.
//

import UIKit

struct Constants {

    //MARK: - Variables

    static var hasTopNotch: Bool {
        guard #available(iOS 11, *), let window = UIApplication.shared.windows.filter({ $0.isKeyWindow }).first else {return false}
        return window.safeAreaInsets.top >= 44
    }
}
