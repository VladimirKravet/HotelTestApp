//
//  FlightInfo.swift
//  HotelTestApp
//
//  Created by Vladimir Kravets on 16.12.2023.
//

import SwiftUI

struct FlightInfoView: View {
    let title: String
    let value: String

    var body: some View {
        HStack {
            Text(title)
                .font(Font.custom("SF Pro Display", size: 16))
                .foregroundColor(Color(red: 0.51, green: 0.53, blue: 0.59))
            Spacer()
            Text(value)
                .font(Font.custom("SF Pro Display", size: 16))
                .foregroundColor(.black)
                .frame(width: MyAdaptive.shared.setDynamicValue(iPhoneValue: 203, iPadValue: 203), alignment: .topLeading)
        }
        .padding(.horizontal, MyAdaptive.shared.setDynamicValue(iPhoneValue: 16, iPadValue: 16))
    }
}

struct TotalInfoView: View {
    let title: String
    let value: Int // Изменил тип на Int, так как, вероятно, value является числовым значением

    var body: some View {
        HStack {
            Text(title)
                .font(Font.custom("SF Pro Display", size: 16))
                .foregroundColor(Color(red: 0.51, green: 0.53, blue: 0.59))
            Spacer()
            Text(formatCurrency(value))
                .font(Font.custom("SF Pro Display", size: 16))
                .foregroundColor(.black)
        }
        .padding(.horizontal, MyAdaptive.shared.setDynamicValue(iPhoneValue: 16, iPadValue: 16))
    }

    private func formatCurrency(_ value: Int) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.groupingSeparator = " " // Изменил groupingSeparator на пробел
        numberFormatter.minimumFractionDigits = 0
        numberFormatter.maximumFractionDigits = 0

        if let formattedValue = numberFormatter.string(from: NSNumber(value: value)) {
            return "\(formattedValue) ₽"
        } else {
            return "\(value) ₽"
        }
    }
}

struct AllAmountView: View {
    let title: String
    let value: Int // Изменил тип на Int, так как, вероятно, value является числовым значением

    var body: some View {
        HStack {
            Text(title)
                .font(Font.custom("SF Pro Display", size: 16))
                .foregroundColor(Color(red: 0.51, green: 0.53, blue: 0.59))
            Spacer()
            Text(formatCurrency(value))
                .font(Font.custom("SF Pro Display", size: 16))
                .foregroundColor(Color(red: 0.05, green: 0.45, blue: 1))
        }
        .padding(.horizontal, MyAdaptive.shared.setDynamicValue(iPhoneValue: 16, iPadValue: 16))
    }

    private func formatCurrency(_ value: Int) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.groupingSeparator = " " // Изменил groupingSeparator на пробел
        numberFormatter.minimumFractionDigits = 0
        numberFormatter.maximumFractionDigits = 0

        if let formattedValue = numberFormatter.string(from: NSNumber(value: value)) {
            return "\(formattedValue) ₽"
        } else {
            return "\(value) ₽"
        }
    }
}
