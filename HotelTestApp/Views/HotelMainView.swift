//
//  HotelMainView.swift
//  HotelTestApp
//
//  Created by Vladimir Kravets on 16.12.2023.
//

import SwiftUI

struct HotelMainView: View {
    @EnvironmentObject private var coordinator: HotelCoordinator
    @EnvironmentObject private var viewModel: HotelViewModel
    
    var body: some View {
        ZStack {
            Color(red: 0.96, green: 0.96, blue: 0.98)
                .ignoresSafeArea()
            VStack {
                if let rooms = viewModel.rooms {
                    HStack {
                        Button {
                            coordinator.currentView = .firstView
                        } label: {
                            Image("backArrow")
                                .resizable()
                                .frame(width: MyAdaptive.shared.setDynamicValue(iPhoneValue: 32, iPadValue: 32), height: MyAdaptive.shared.setDynamicValue(iPhoneValue: 32, iPadValue: 32))
                        }
                        Spacer()
                        if let hotelName = viewModel.selectHotel?.name {
                            Text(hotelName)
                                .font(
                                    Font.custom("SF Pro Display", size: 18)
                                        .weight(.medium)
                                )
                                .multilineTextAlignment(.center)
                                .foregroundColor(.black)
                        } else {
                            Text("No hotel selected")
                                .font(
                                    Font.custom("SF Pro Display", size: 18)
                                        .weight(.medium)
                                )
                                .multilineTextAlignment(.center)
                                .foregroundColor(.black)
                        }
                        Spacer()
                    }
                    .padding(.horizontal, MyAdaptive.shared.setDynamicValue(iPhoneValue: 16, iPadValue: 16))
                    .padding(.bottom, MyAdaptive.shared.setDynamicValue(iPhoneValue: 16, iPadValue: 16))
                    .background(.white)
                    ScrollView {
                        ForEach(rooms) { room in
                            VStack {
                                TabView {
                                    ForEach(room.image_urls, id: \.self) { imageUrl in
                                        RemoteImage(url: imageUrl)
                                            .scaledToFit()
                                            .cornerRadius(MyAdaptive.shared.setDynamicValue(iPhoneValue: 15, iPadValue: 15))
                                    }
                                }
                                .tabViewStyle(PageTabViewStyle())
                                .frame(width: MyAdaptive.shared.setDynamicValue(iPhoneValue: 343, iPadValue: 500), height: MyAdaptive.shared.setDynamicValue(iPhoneValue: 257, iPadValue: 327))
                                .padding(.bottom, MyAdaptive.shared.setDynamicValue(iPhoneValue: 8, iPadValue: 8))
                                VStack(alignment: .leading, spacing: 0) {
                                    Text(room.name)
                                        .font(
                                            Font.custom("SF Pro Display", size: 22)
                                                .weight(.medium)
                                        )
                                        .foregroundColor(.black)
                                        .padding(.vertical, MyAdaptive.shared.setDynamicValue(iPhoneValue: 8, iPadValue: 8))
                                    
                                    LazyVGrid(columns: [GridItem(.flexible(), spacing: 8), GridItem(.flexible(), spacing: 8)], alignment: .leading, spacing: 8) {
                                        ForEach(room.peculiarities, id: \.self) { peculiarity in
                                            Text(peculiarity)
                                                .font(
                                                    Font.custom("SF Pro Display", size: 15)
                                                        .weight(.regular)
                                                )
                                                .lineLimit(1)
                                                .foregroundColor(Color(red: 0.51, green: 0.53, blue: 0.59))
                                                .padding(.horizontal, MyAdaptive.shared.setDynamicValue(iPhoneValue: 10, iPadValue: 10))
                                                .padding(.vertical, MyAdaptive.shared.setDynamicValue(iPhoneValue: 5, iPadValue: 5))
                                                .background(Color(red: 0.98, green: 0.98, blue: 0.99))
                                                .cornerRadius(MyAdaptive.shared.setDynamicValue(iPhoneValue: 5, iPadValue: 5))
                                                .fixedSize(horizontal: true, vertical: true)
                                            
                                        }
                                    }
                                    .padding(.bottom, MyAdaptive.shared.setDynamicValue(iPhoneValue: 8, iPadValue: 8))
                                    Button {
                                        print("tapped")
                                    } label: {
                                        HStack{
                                            Text("Подробнее о номере")
                                                .font(
                                                    Font.custom("SF Pro Display", size: 16)
                                                        .weight(.medium)
                                                )
                                                .multilineTextAlignment(.center)
                                                .foregroundColor(Color(red: 0.05, green: 0.45, blue: 1))
                                            Image("blueArrow")
                                                .resizable()
                                                .frame(width: MyAdaptive.shared.setDynamicValue(iPhoneValue: 24, iPadValue: 24), height: MyAdaptive.shared.setDynamicValue(iPhoneValue: 24, iPadValue: 24))
                                            
                                        }.padding(.leading, MyAdaptive.shared.setDynamicValue(iPhoneValue: 10, iPadValue: 10))
                                            .padding(.trailing, MyAdaptive.shared.setDynamicValue(iPhoneValue: 2, iPadValue: 2))
                                            .padding(.vertical, MyAdaptive.shared.setDynamicValue(iPhoneValue: 5, iPadValue: 5))
                                            .background(Color(red: 0.05, green: 0.45, blue: 1).opacity(0.1))
                                        
                                            .cornerRadius(MyAdaptive.shared.setDynamicValue(iPhoneValue: 5, iPadValue: 5))
                                    }
                                    
                                }
                                .padding(.horizontal, MyAdaptive.shared.setDynamicValue(iPhoneValue: 16, iPadValue: 16))
                                HStack {
                                    if let formattedPrice = viewModel.formatPrice(room.price) {
                                        Text("\(formattedPrice) ₽")
                                            .font(
                                                Font.custom("SF Pro Display", size: 30)
                                                    .weight(.heavy)
                                            )
                                            .foregroundColor(.black)
                                    }
                                    Text("за 7 ночей с перелётом")
                                        .font(Font.custom("SF Pro Display", size: 16))
                                        .foregroundColor(Color(red: 0.51, green: 0.53, blue: 0.59))
                                        .padding(.leading, MyAdaptive.shared.setDynamicValue(iPhoneValue: 8, iPadValue: 8))
                                        .padding(.top, MyAdaptive.shared.setDynamicValue(iPhoneValue: 12, iPadValue: 12))
                                    Spacer()
                                }
                                .padding(.horizontal, MyAdaptive.shared.setDynamicValue(iPhoneValue: 16, iPadValue: 16))
                                Button {
                                    viewModel.selectedRoom = room
                                    coordinator.currentView = .orderView
                                } label: {
                                    VStack {
                                        Text("Выбрать номер")
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
                            .frame(maxWidth: .infinity )
                            .padding(.vertical, MyAdaptive.shared.setDynamicValue(iPhoneValue: 16, iPadValue: 16))
                            .background(.white)
                            .cornerRadius(MyAdaptive.shared.setDynamicValue(iPhoneValue: 16, iPadValue: 16))
                        }
                        .padding(.bottom, MyAdaptive.shared.setDynamicValue(iPhoneValue: 16, iPadValue: 16))
                    }
                }
                
                Spacer()
            }
            
        }
        .padding(.top, 4)
        .padding(.bottom, 4)
        .onAppear {
            viewModel.fetchRooms()
        }
    }
}
