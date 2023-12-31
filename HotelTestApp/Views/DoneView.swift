//
//  DoneView.swift
//  HotelTestApp
//
//  Created by Vladimir Kravets on 17.12.2023.
//

import SwiftUI

struct DoneView: View {
    @EnvironmentObject private var coordinator: HotelCoordinator
    @EnvironmentObject private var viewModel: HotelViewModel
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Button {
                    viewModel.resetAllInfo()
                    viewModel.errorMail = true
                    viewModel.errorPhone = true
                    viewModel.errorSurName = true
                    viewModel.errorName = true
                    viewModel.errorCitizenship = true
                    viewModel.errorPassportNumber = true
                    viewModel.errorExpiredDateOfPassport = true
                    coordinator.currentView = .orderView
                } label: {
                    Image("backArrow")
                        .resizable()
                        .frame(width: MyAdaptive.shared.setDynamicValue(iPhoneValue: 32, iPadValue: 32), height: MyAdaptive.shared.setDynamicValue(iPhoneValue: 32, iPadValue: 32))
                }
                Spacer()
                Text("Заказ оплачен")
                    .customFont(.medium, fontSizeForiPhone: 18, fontSizeForiPad: 18)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.black)
                    .padding(.trailing, MyAdaptive.shared.setDynamicValue(iPhoneValue: 32, iPadValue: 32))
                Spacer()
            }
            .padding(.horizontal, MyAdaptive.shared.setDynamicValue(iPhoneValue: 16, iPadValue: 16))
            .padding(.bottom, MyAdaptive.shared.setDynamicValue(iPhoneValue: 16, iPadValue: 16))
            .background(.white)
            .padding(.bottom, MyAdaptive.shared.setDynamicValue(iPhoneValue: 138, iPadValue: 138))
            
            Image("done")
                .resizable()
                .frame(width: MyAdaptive.shared.setDynamicValue(iPhoneValue: 94, iPadValue: 94),height: MyAdaptive.shared.setDynamicValue(iPhoneValue: 94, iPadValue: 94))
                .padding(.bottom, MyAdaptive.shared.setDynamicValue(iPhoneValue: 32, iPadValue: 32))
            Text("Ваш заказ принят в работу")
                .customFont(.medium, fontSizeForiPhone: 22, fontSizeForiPad: 22)
                .multilineTextAlignment(.center)
                .foregroundColor(.black)
                .padding(.bottom, MyAdaptive.shared.setDynamicValue(iPhoneValue: 20, iPadValue: 20))
            Text("Подтверждение заказа №104893 может занять некоторое время (от 1 часа до суток). Как только мы получим ответ от туроператора, вам на почту придет уведомление.")
                .customFont(.medium, fontSizeForiPhone: 16, fontSizeForiPad: 16)
                .multilineTextAlignment(.center)
                .foregroundColor(Color(red: 0.51, green: 0.53, blue: 0.59))
                .padding(.horizontal, MyAdaptive.shared.setDynamicValue(iPhoneValue: 16, iPadValue: 16))
            Spacer()
            Button {
                viewModel.resetAllInfo()
                viewModel.errorMail = true
                viewModel.errorPhone = true
                viewModel.errorSurName = true
                viewModel.errorName = true
                viewModel.errorCitizenship = true
                viewModel.errorPassportNumber = true
                viewModel.errorExpiredDateOfPassport = true
                coordinator.currentView = .firstView
            } label: {
                VStack {
                    Text("Супер!")
                        .customFont(.medium, fontSizeForiPhone: 16, fontSizeForiPad: 16)
                        .kerning(0.1)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                }
                .frame(maxWidth: .infinity)
                .frame(height: MyAdaptive.shared.setDynamicValue(iPhoneValue: 48, iPadValue: 48))
                .background(Color(red: 0.05, green: 0.45, blue: 1))
                .cornerRadius(12)
            }
            .padding(.top, MyAdaptive.shared.setDynamicValue(iPhoneValue: 12, iPadValue: 12))
            .padding(.horizontal, MyAdaptive.shared.setDynamicValue(iPhoneValue: 16, iPadValue: 16))
        }
    }
}
