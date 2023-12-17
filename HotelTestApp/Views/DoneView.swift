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
                    coordinator.currentView = .orderView
                } label: {
                    Image("backArrow")
                        .resizable()
                        .frame(width: MyAdaptive.shared.setDynamicValue(iPhoneValue: 32, iPadValue: 32), height: MyAdaptive.shared.setDynamicValue(iPhoneValue: 32, iPadValue: 32))
                }
                Spacer()
                Text("Заказ оплачен")
                    .font(
                        Font.custom("SF Pro Display", size: 18)
                            .weight(.medium)
                    )
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
                .font(
                    Font.custom("SF Pro Display", size: 22)
                        .weight(.medium)
                )
                .multilineTextAlignment(.center)
                .foregroundColor(.black)
                .padding(.bottom, MyAdaptive.shared.setDynamicValue(iPhoneValue: 20, iPadValue: 20))
            Text("Подтверждение заказа №104893 может занять некоторое время (от 1 часа до суток). Как только мы получим ответ от туроператора, вам на почту придет уведомление.")
            .font(Font.custom("SF Pro Display", size: 16))
            .multilineTextAlignment(.center)
            .foregroundColor(Color(red: 0.51, green: 0.53, blue: 0.59))
            .padding(.horizontal, MyAdaptive.shared.setDynamicValue(iPhoneValue: 16, iPadValue: 16))
            Spacer()
            Button {
                coordinator.currentView = .firstView
            } label: {
                VStack {
                    Text("Супер!")
                        .font(
                            Font.custom("SF Pro Display", size: 16)
                                .weight(.medium)
                        )
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
