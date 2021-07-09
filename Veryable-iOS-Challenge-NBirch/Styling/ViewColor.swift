//
//  ViewColor.swift
//  Veryable-iOS-Challenge-NBirch
//
//  Created by Birch, Nathan J on 7/7/21.
//

import UIKit

public enum ViewColor: VColor {
    case background, surface
    var color: UIColor {
        switch self {
            case .background: return UIColor(named: "Background")!
            case .surface: return UIColor(named: "Surface")!
        }
    }
}
