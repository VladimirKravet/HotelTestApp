//
//  CustomTextField.swift
//  HotelTestApp
//
//  Created by Vladimir Kravets on 17.12.2023.
//

import SwiftUI

struct CustomTextField: View {
    
    var placeholder: String
    @Binding var text: String
    var title: String
    var errorState: Bool?
    
    var body: some View {
        VStack(alignment: .leading) {
            ZStack(alignment: .leading) {
                TextField(placeholder, text: $text)
                    .font(Font.custom("SF Pro Display", size: 16))
                    .kerning(0.75)
                    .frame(height: MyAdaptive.shared.setDynamicValue(iPhoneValue: 52, iPadValue: 52))
                    .foregroundColor(Color(red: 0.08, green: 0.08, blue: 0.17))
                    .cornerRadius(MyAdaptive.shared.setDynamicValue(iPhoneValue: 10, iPadValue: 10))
                    .padding(.bottom, MyAdaptive.shared.setDynamicValue(iPhoneValue: 10, iPadValue: 10))

                if !text.isEmpty {
                    Text(title)
                        .font(Font.custom("SF Pro Display", size: 12))
                        .kerning(0.12)
                        .foregroundColor(Color(red: 0.51, green: 0.53, blue: 0.59))
                        .background(Color.clear)
                        .offset(y: MyAdaptive.shared.setDynamicValue(iPhoneValue: -16, iPadValue: -16))
                }
            }
        }
        .padding(.top, MyAdaptive.shared.setDynamicValue(iPhoneValue: 8, iPadValue: 8))
        .padding(.horizontal, MyAdaptive.shared.setDynamicValue(iPhoneValue: 16, iPadValue: 16))
        .frame(height: MyAdaptive.shared.setDynamicValue(iPhoneValue: 52, iPadValue: 52))
        .background(errorState.map { $0 ? Color(red: 0.96, green: 0.96, blue: 0.98) : Color(hex: 0xEB5757).opacity(0.15) } ?? Color(red: 0.96, green: 0.96, blue: 0.98))
        .cornerRadius(10)
        .padding(.horizontal, MyAdaptive.shared.setDynamicValue(iPhoneValue: 16, iPadValue: 16))
    }
}
