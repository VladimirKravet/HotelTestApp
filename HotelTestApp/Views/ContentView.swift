//
//  ContentView.swift
//  HotelTestApp
//
//  Created by Vladimir Kravets on 15.12.2023.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject private var coordinator: HotelCoordinator
    @EnvironmentObject private var viewModel: HotelViewModel
    
    var body: some View {
        ZStack {
            Color(red: 0.96, green: 0.96, blue: 0.98)
                .ignoresSafeArea()
            VStack(spacing: 0) {
                ScrollView(showsIndicators: false) {
                    if let hotel = viewModel.hotel {
                        VStack(spacing: 0) {
                            Text("Отель")
                                .customFont(.medium, fontSizeForiPhone: 18, fontSizeForiPad: 18)
                                .foregroundColor(.black)
                                .padding(.bottom, MyAdaptive.shared.setDynamicValue(iPhoneValue: 16, iPadValue: 16))
                            TabView {
                                ForEach(hotel.imageUrls, id: \.self) { imageUrl in
                                    RemoteImage(url: imageUrl)
                                        .scaledToFit()
                                        .cornerRadius(MyAdaptive.shared.setDynamicValue(iPhoneValue: 15, iPadValue: 15))
                                }
                            }
                            .tabViewStyle(PageTabViewStyle())
                            .frame(width: MyAdaptive.shared.setDynamicValue(iPhoneValue: 343, iPadValue: 500), height: MyAdaptive.shared.setDynamicValue(iPhoneValue: 257, iPadValue: 327))
                            .padding(.bottom, MyAdaptive.shared.setDynamicValue(iPhoneValue: 16, iPadValue: 16))
                            VStack(alignment: .leading, spacing: 0) {
                                HStack(spacing: 0) {
                                    Image("star")
                                        .resizable()
                                        .frame(width: MyAdaptive.shared.setDynamicValue(iPhoneValue: 15, iPadValue: 24), height: MyAdaptive.shared.setDynamicValue(iPhoneValue: 15, iPadValue: 24))
                                        .padding(.leading, MyAdaptive.shared.setDynamicValue(iPhoneValue: 10, iPadValue: 10))
                                        .padding(.trailing, MyAdaptive.shared.setDynamicValue(iPhoneValue: 2, iPadValue: 4))
                                    Text(hotel.rating.description)
                                        .customFont(.medium, fontSizeForiPhone: 16, fontSizeForiPad: 16)
                                        .foregroundColor(Color(red: 1, green: 0.66, blue: 0))
                                        .padding(.trailing, MyAdaptive.shared.setDynamicValue(iPhoneValue: 4, iPadValue: 4))
                                    Text(hotel.ratingName)
                                        .customFont(.medium, fontSizeForiPhone: 16, fontSizeForiPad: 16)
                                        .foregroundColor(Color(red: 1, green: 0.66, blue: 0))
                                        .padding(.trailing, MyAdaptive.shared.setDynamicValue(iPhoneValue: 10, iPadValue: 10))
                                        .padding(.vertical, MyAdaptive.shared.setDynamicValue(iPhoneValue: 5, iPadValue: 5))
                                }
                                .background(Color(red: 1, green: 0.78, blue: 0).opacity(0.2))
                                .cornerRadius(MyAdaptive.shared.setDynamicValue(iPhoneValue: 5, iPadValue: 5))
                                
                                Text(hotel.name)
                                    .customFont(.medium, fontSizeForiPhone: 22, fontSizeForiPad: 22)
                                    .foregroundColor(.black)
                                    .padding(.vertical, MyAdaptive.shared.setDynamicValue(iPhoneValue: 8, iPadValue: 8))
                                
                                Button {
                                    print("tapped")
                                } label: {
                                    Text(hotel.address)
                                        .customFont(.medium, fontSizeForiPhone: 14, fontSizeForiPad: 14)
                                        .foregroundColor(Color(red: 0.05, green: 0.45, blue: 1))
                                        .multilineTextAlignment(.leading)
                                }
                                HStack {
                                    if let formattedPrice = viewModel.formatPrice(hotel.minimalPrice) {
                                        Text("от \(formattedPrice) ₽")
                                            .customFont(.medium, fontSizeForiPhone: 30, fontSizeForiPad: 30)
                                            .foregroundColor(.black)
                                    }
                                    Text("за тур с перелётом")
                                        .customFont(.medium, fontSizeForiPhone: 16, fontSizeForiPad: 16)
                                        .foregroundColor(Color(red: 0.51, green: 0.53, blue: 0.59))
                                        .padding(.leading, MyAdaptive.shared.setDynamicValue(iPhoneValue: 8, iPadValue: 8))
                                        .padding(.top, MyAdaptive.shared.setDynamicValue(iPhoneValue: 12, iPadValue: 12))
                                    
                                }
                                .padding(.bottom, MyAdaptive.shared.setDynamicValue(iPhoneValue: 16, iPadValue: 16))
                            }
                            .padding(.horizontal, MyAdaptive.shared.setDynamicValue(iPhoneValue: 16, iPadValue: 16))
                        }
                        .frame(maxWidth: .infinity)
                        .background(.white)
                        .cornerRadius(MyAdaptive.shared.setDynamicValue(iPhoneValue: 12, iPadValue: 12))
                        .padding(.bottom, MyAdaptive.shared.setDynamicValue(iPhoneValue: 8, iPadValue: 9))
                        VStack(spacing: 0) {
                            VStack(spacing: 0) {
                                HStack(spacing: 0) {
                                    Text("Об отеле")
                                        .customFont(.medium, fontSizeForiPhone: 22, fontSizeForiPad: 22)
                                        .foregroundColor(.black)
                                    Spacer()
                                }
                                .padding(.top, MyAdaptive.shared.setDynamicValue(iPhoneValue: 16, iPadValue: 16))
                                .padding(.bottom, MyAdaptive.shared.setDynamicValue(iPhoneValue: 21, iPadValue: 21))
                                //                               ScrollView(.horizontal, showsIndicators: false) {
                                LazyVGrid(columns: Array(repeating: GridItem(), count: 2), alignment: .leading, spacing: 8) {
                                    ForEach(hotel.aboutTheHotel.peculiarities, id: \.self) { peculiarity in
                                        Text(peculiarity)
                                            .customFont(.medium, fontSizeForiPhone: 14, fontSizeForiPad: 14)
                                            .lineLimit(nil)
                                            .foregroundColor(Color(red: 0.51, green: 0.53, blue: 0.59))
                                            .padding(.horizontal, MyAdaptive.shared.setDynamicValue(iPhoneValue: 10, iPadValue: 10))
                                            .padding(.vertical, MyAdaptive.shared.setDynamicValue(iPhoneValue: 5, iPadValue: 5))
                                            .background(Color(red: 0.98, green: 0.98, blue: 0.99))
                                            .cornerRadius(MyAdaptive.shared.setDynamicValue(iPhoneValue: 5, iPadValue: 5))
                                        //                                              .fixedSize(horizontal: true, vertical: true)
                                    }
                                    //                                        .padding(.horizontal, MyAdaptive.shared.setDynamicValue(iPhoneValue: 64, iPadValue: 64))
                                    //                                            .padding(.vertical, MyAdaptive.shared.setDynamicValue(iPhoneValue: 8, iPadValue: 8))
                                    //                                            .padding(.leading, MyAdaptive.shared.setDynamicValue(iPhoneValue: 64, iPadValue: 64))
                                }
                                //                              }
                                Text(hotel.aboutTheHotel.description)
                                    .customFont(.medium, fontSizeForiPhone: 16, fontSizeForiPad: 16)
                                    .foregroundColor(.black.opacity(0.9))
                                    .padding(.top, MyAdaptive.shared.setDynamicValue(iPhoneValue: 17, iPadValue: 17))
                                    .padding(.bottom, MyAdaptive.shared.setDynamicValue(iPhoneValue: 16, iPadValue: 16))
                            }
                            .padding(.horizontal, MyAdaptive.shared.setDynamicValue(iPhoneValue: 16, iPadValue: 16))
                            VStack {
                                CustomButton(imageName: "emoji-happy", title: "Удобства", subtitle: "Самое необходимое", action: {
                                    print("tapped1")
                                }, showDivider: true)
                                
                                CustomButton(imageName: "tick-square", title: "Что включено", subtitle: "Самое необходимое", action: {
                                    print("tapped2")
                                }, showDivider: true)
                                
                                CustomButton(imageName: "close-square", title: "Что не включено", subtitle: "Самое необходимое", action: {
                                    print("tapped3")
                                }, showDivider: false)
                            }
                            .background(Color(red: 0.98, green: 0.98, blue: 0.99))
                            .cornerRadius(15)
                            .padding(.horizontal, MyAdaptive.shared.setDynamicValue(iPhoneValue: 16, iPadValue: 16))
                            .padding(.bottom, MyAdaptive.shared.setDynamicValue(iPhoneValue: 16, iPadValue: 16))
                        }
                        .frame(maxWidth: .infinity)
                        .background(.white)
                        .cornerRadius(MyAdaptive.shared.setDynamicValue(iPhoneValue: 12, iPadValue: 12))
                        VStack {
                            Button {
                                viewModel.selectHotel = hotel
                                coordinator.currentView = .hotelMainView
                            } label: {
                                VStack {
                                    Text("К выбору номера")
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
                        .frame(height: 88)
                        .background(Color.white)
                        .edgesIgnoringSafeArea(.bottom)
                    } else {
                        Spacer().frame(height: MyAdaptive.shared.setDynamicValue(iPhoneValue: 380, iPadValue: 380))
                        ProgressView()
                    }
                }
            }
        }
        .padding(.top, 4)
        .padding(.bottom, 4)
        .onAppear {
            viewModel.fetchHotel()
        }
    }
    
}
