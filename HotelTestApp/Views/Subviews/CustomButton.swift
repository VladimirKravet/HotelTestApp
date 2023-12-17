//
//  CustomButton.swift
//  HotelTestApp
//
//  Created by Vladimir Kravets on 16.12.2023.
//

import SwiftUI

struct CustomButton: View {
    var imageName: String
    var title: String
    var subtitle: String
    var action: () -> Void
    var showDivider: Bool // Добавлен параметр для определения, нужен ли Divider
    
    init(imageName: String, title: String, subtitle: String, action: @escaping () -> Void, showDivider: Bool = true) {
        self.imageName = imageName
        self.title = title
        self.subtitle = subtitle
        self.action = action
        self.showDivider = showDivider
    }
    
    var body: some View {
        Button(action: action) {
            VStack(spacing: 0) {
                HStack {
                    Image(imageName)
                        .resizable()
                        .frame(width: MyAdaptive.shared.setDynamicValue(iPhoneValue: 24, iPadValue: 24), height: MyAdaptive.shared.setDynamicValue(iPhoneValue: 24, iPadValue: 24))
                    VStack(alignment: .leading) {
                        Text(title)
                            .customFont(.medium, fontSizeForiPhone: 16, fontSizeForiPad: 16)
                            .foregroundColor(Color(red: 0.17, green: 0.19, blue: 0.21))
                        Text(subtitle)
                            .customFont(.medium, fontSizeForiPhone: 14, fontSizeForiPad: 14)
                            .foregroundColor(Color(red: 0.51, green: 0.53, blue: 0.59))
                    }
                    Spacer()
                    Image("arrow")
                        .resizable()
                        .frame(width: MyAdaptive.shared.setDynamicValue(iPhoneValue: 24, iPadValue: 24), height: MyAdaptive.shared.setDynamicValue(iPhoneValue: 24, iPadValue: 24))
                }
                .padding(.vertical, MyAdaptive.shared.setDynamicValue(iPhoneValue: 15, iPadValue: 15))
                .padding(.horizontal, MyAdaptive.shared.setDynamicValue(iPhoneValue: 15, iPadValue: 15))
                
                
                if showDivider {
                    Divider()
                        .background(Color(red: 0.51, green: 0.53, blue: 0.59).opacity(0.15))
                        .padding(.leading, MyAdaptive.shared.setDynamicValue(iPhoneValue: 51, iPadValue: 51))
                        .padding(.trailing, MyAdaptive.shared.setDynamicValue(iPhoneValue: 15, iPadValue: 15))
                }
            }
        }
    }
}
