//
//  Font+.swift
//  DigifireSweep
//
//  Created by Cocadei Ludmila on 17.07.2023.
//

import SwiftUI

enum SFDisplay: String {
    case bold = "SF-Pro-Display-Bold"
    case regular = "SFPRODISPLAYREGULAR"
    case medium = "SF-Pro-Display-Medium"
    case italic = "SFPRODISPLAYSEMIBOLDITALIC"
}

extension Font {
    static func SFDisplay(_ name: SFDisplay, size: CGFloat) -> Font {
        return .custom(name.rawValue, size: size)
    }
}


extension Text {

    private var myAdaptive: MyAdaptive {
        return MyAdaptive.shared
    }

    func customFont(_ name: SFDisplay, fontSizeForiPhone: CGFloat, fontSizeForiPad: CGFloat) -> Text {
        let adjustedFontSize = myAdaptive.setFontSize(fontSizeForiPhone: fontSizeForiPhone, fontSizeForiPad: fontSizeForiPad)
        return self.font(.custom(name.rawValue, size: adjustedFontSize))
    }
}

