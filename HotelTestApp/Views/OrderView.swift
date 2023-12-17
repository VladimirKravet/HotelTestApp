//
//  OrderView.swift
//  HotelTestApp
//
//  Created by Vladimir Kravets on 16.12.2023.
//

import SwiftUI

struct OrderView: View {
    @EnvironmentObject private var coordinator: HotelCoordinator
    @EnvironmentObject private var viewModel: HotelViewModel
    @State var text = ""
    @State var isEditing: Bool = false
    @State private var isRectangeIsTapped = false
    @State private var istouristColumnTapped: [Bool] = []
    @State var errorMail: Bool = false
    var body: some View {
        ZStack {
            Color(red: 0.96, green: 0.96, blue: 0.98)
                .ignoresSafeArea()
            
            VStack {
                if let bookingInfo = viewModel.hotelInfo {
                    let totalAmount = bookingInfo.tourPrice + bookingInfo.fuelCharge + bookingInfo.serviceCharge
                    HStack {
                        Button {
                            coordinator.currentView = .hotelMainView
                        } label: {
                            Image("backArrow")
                                .resizable()
                                .frame(width: MyAdaptive.shared.setDynamicValue(iPhoneValue: 32, iPadValue: 32), height: MyAdaptive.shared.setDynamicValue(iPhoneValue: 32, iPadValue: 32))
                        }
                        Spacer()
                        Text("Бронирование")
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
                    ScrollView {
                        VStack(alignment: .leading ,spacing: MyAdaptive.shared.setDynamicValue(iPhoneValue: 8, iPadValue: 8)) {
                            HStack(spacing: 0) {
                                Image("star")
                                    .resizable()
                                    .frame(width: MyAdaptive.shared.setDynamicValue(iPhoneValue: 15, iPadValue: 24), height: MyAdaptive.shared.setDynamicValue(iPhoneValue: 15, iPadValue: 24))
                                    .padding(.leading, MyAdaptive.shared.setDynamicValue(iPhoneValue: 10, iPadValue: 10))
                                    .padding(.trailing, MyAdaptive.shared.setDynamicValue(iPhoneValue: 2, iPadValue: 4))
                                Text(bookingInfo.hoRating.description)
                                    .font(
                                        Font.custom("SF Pro Display", size: 16)
                                            .weight(.medium)
                                    )
                                    .foregroundColor(Color(red: 1, green: 0.66, blue: 0))
                                    .padding(.trailing, MyAdaptive.shared.setDynamicValue(iPhoneValue: 4, iPadValue: 4))
                                Text(bookingInfo.ratingName)
                                    .font(
                                        Font.custom("SF Pro Display", size: 16)
                                            .weight(.medium)
                                    )
                                    .foregroundColor(Color(red: 1, green: 0.66, blue: 0))
                                    .padding(.trailing, MyAdaptive.shared.setDynamicValue(iPhoneValue: 10, iPadValue: 10))
                                    .padding(.vertical, MyAdaptive.shared.setDynamicValue(iPhoneValue: 5, iPadValue: 5))
                            }
                            .background(Color(red: 1, green: 0.78, blue: 0).opacity(0.2))
                            .cornerRadius(MyAdaptive.shared.setDynamicValue(iPhoneValue: 5, iPadValue: 5))
                            .padding(.horizontal, MyAdaptive.shared.setDynamicValue(iPhoneValue: 16, iPadValue: 16))
                            Text(bookingInfo.hotelName)
                                .font(
                                    Font.custom("SF Pro Display", size: 22)
                                        .weight(.medium)
                                )
                                .foregroundColor(.black)
                                .padding(.horizontal, MyAdaptive.shared.setDynamicValue(iPhoneValue: 16, iPadValue: 16))
                            Button {
                                print("tapped")
                            } label: {
                                HStack {
                                    Text(bookingInfo.hotelAddress)
                                        .multilineTextAlignment(.leading)
                                        .font(
                                            Font.custom("SF Pro Display", size: 14)
                                                .weight(.medium)
                                            
                                        )
                                        .foregroundColor(Color(red: 0.05, green: 0.45, blue: 1))
                                    Spacer()
                                }
                            }
                            .padding(.horizontal, MyAdaptive.shared.setDynamicValue(iPhoneValue: 16, iPadValue: 16))
                            
                            
                        }
                        .padding(.vertical, MyAdaptive.shared.setDynamicValue(iPhoneValue: 16, iPadValue: 16))
                        .frame(maxWidth: .infinity)
                        .background(.white)
                        .cornerRadius(MyAdaptive.shared.setDynamicValue(iPhoneValue: 15, iPadValue: 15))
                        VStack(spacing: MyAdaptive.shared.setDynamicValue(iPhoneValue: 16, iPadValue: 16)) {
                            FlightInfoView(title: "Вылет из", value: bookingInfo.departure)
                            FlightInfoView(title: "Страна, город", value: bookingInfo.arrivalCountry)
                            HStack {
                                Text("Даты")
                                    .font(Font.custom("SF Pro Display", size: 16))
                                    .multilineTextAlignment(.leading)
                                    .foregroundColor(Color(red: 0.51, green: 0.53, blue: 0.59))
                                Spacer()
                                HStack{
                                    Text(bookingInfo.tourDateStart)
                                        .font(Font.custom("SF Pro Display", size: 16))
                                        .foregroundColor(.black)
                                    Text("- \(bookingInfo.tourDateStop)")
                                        .font(Font.custom("SF Pro Display", size: 16))
                                        .foregroundColor(.black)
                                }.frame(width: MyAdaptive.shared.setDynamicValue(iPhoneValue: 203, iPadValue: 203), alignment: .topLeading)
                            }
                            .padding(.horizontal, MyAdaptive.shared.setDynamicValue(iPhoneValue: 16, iPadValue: 16))
                            FlightInfoView(title: "Кол-во ночей", value: bookingInfo.numberOfNights.description)
                            FlightInfoView(title: "Отель", value: bookingInfo.hotelName)
                            FlightInfoView(title: "Номер", value: bookingInfo.room)
                            FlightInfoView(title: "Питание", value: bookingInfo.nutrition)
                        }
                        .padding(.vertical, MyAdaptive.shared.setDynamicValue(iPhoneValue: 16, iPadValue: 16))
                        .frame(maxWidth: .infinity)
                        .background(.white)
                        .cornerRadius(MyAdaptive.shared.setDynamicValue(iPhoneValue: 15, iPadValue: 15))
                        VStack {
                            HStack {
                                Text("Информация о покупателе")
                                    .font(
                                        Font.custom("SF Pro Display", size: 22)
                                            .weight(.medium)
                                    )
                                    .foregroundColor(.black)
                                Spacer()
                            }
                            .padding(.horizontal, MyAdaptive.shared.setDynamicValue(iPhoneValue: 16, iPadValue: 16))
                            NumberPhoneMaskView()
                                .padding(.horizontal, MyAdaptive.shared.setDynamicValue(iPhoneValue: 16, iPadValue: 16))
                            VStack(alignment: .leading) {
                                ZStack(alignment: .leading) {
                                    TextField("examplemail.000@mail.ru", text: $viewModel.email)
                                        .font(Font.custom("SF Pro Display", size: 16))
                                        .kerning(0.75)
                                        .frame(height: MyAdaptive.shared.setDynamicValue(iPhoneValue: 52, iPadValue: 52))
                                        .foregroundColor(Color(red: 0.08, green: 0.08, blue: 0.17))
                                        .cornerRadius(MyAdaptive.shared.setDynamicValue(iPhoneValue: 10, iPadValue: 10))
                                        .padding(.bottom, MyAdaptive.shared.setDynamicValue(iPhoneValue: 10, iPadValue: 10))
                                        .onSubmit {
                                            errorMail = !viewModel.isValidEmail(viewModel.email)
                                        }
                                    
                                    Text("Почта")
                                        .font(Font.custom("SF Pro Display", size: 12))
                                        .kerning(0.12)
                                        .foregroundColor(Color(red: 0.51, green: 0.53, blue: 0.59))
                                        .background(Color.clear)
                                        .offset(y: MyAdaptive.shared.setDynamicValue(iPhoneValue: -16, iPadValue: -16))
                                }
                            }
                            .padding(.top, MyAdaptive.shared.setDynamicValue(iPhoneValue: 8, iPadValue: 8))
                            .padding(.horizontal, MyAdaptive.shared.setDynamicValue(iPhoneValue: 16, iPadValue: 16))
                            .frame(height: MyAdaptive.shared.setDynamicValue(iPhoneValue: 52, iPadValue: 52))
                            .background(viewModel.errorMail ? Color(red: 0.96, green: 0.96, blue: 0.98) : Color(hex: 0xEB5757).opacity(0.15))
                            .cornerRadius(10)
                            .padding(.horizontal, MyAdaptive.shared.setDynamicValue(iPhoneValue: 16, iPadValue: 16))
                            Text("Эти данные никому не передаются. После оплаты мы вышли чек на указанный вами номер и почту")
                                .font(Font.custom("SF Pro Display", size: 14))
                                .foregroundColor(Color(red: 0.51, green: 0.53, blue: 0.59))
                                .padding(.horizontal, MyAdaptive.shared.setDynamicValue(iPhoneValue: 16, iPadValue: 16))
                        }
                        .padding(.vertical, MyAdaptive.shared.setDynamicValue(iPhoneValue: 16, iPadValue: 16))
                        .frame(maxWidth: .infinity)
                        .background(.white)
                        .cornerRadius(MyAdaptive.shared.setDynamicValue(iPhoneValue: 15, iPadValue: 15))
                        VStack {
                            Button {
                                isRectangeIsTapped.toggle()
                            } label: {
                                HStack {
                                    Text("Первый турист")
                                        .font(
                                            Font.custom("SF Pro Display", size: 22)
                                                .weight(.medium)
                                        )
                                        .foregroundColor(.black)
                                    Spacer()
                                    
                                    Image(isRectangeIsTapped ? "arrowUp": "arrowDown")
                                        .resizable()
                                        .frame(width: MyAdaptive.shared.setDynamicValue(iPhoneValue: 32, iPadValue: 32),height: MyAdaptive.shared.setDynamicValue(iPhoneValue: 32, iPadValue: 32))
                                }
                            }.padding(.horizontal, MyAdaptive.shared.setDynamicValue(iPhoneValue: 16, iPadValue: 16))
                            if self.isRectangeIsTapped {
                                CustomTextField(placeholder: "Введите имя", text: $viewModel.name, title: "Имя", errorState: viewModel.errorName)
                                CustomTextField(placeholder: "Введите фамилию", text: $viewModel.surName, title: "Фамилия", errorState: viewModel.errorSurName)
                                CustomTextField(placeholder: "Введите гражданство", text: $viewModel.citizenship, title: "Гражданство", errorState: viewModel.errorCitizenship)
                                CustomTextField(placeholder: "Введите номер загранпаспорта", text: $viewModel.passportNumber, title: "Номер загранпаспорта", errorState: viewModel.errorPassportNumber)
                                CustomTextField(placeholder: "Введите cрок действия загранпаспорта", text: $viewModel.epiredDateOfPassport, title: "Срок действия загранпаспорта", errorState: viewModel.errorExpiredDateOfPassport)
                                
                            }
                        }
                        .padding(.vertical, MyAdaptive.shared.setDynamicValue(iPhoneValue: 16, iPadValue: 16))
                        .frame(maxWidth: .infinity)
                        .background(.white)
                        .cornerRadius(MyAdaptive.shared.setDynamicValue(iPhoneValue: 15, iPadValue: 15))
                        
                        newTouristColumn()
                        if viewModel.addTouristCounter < 9 {
                            newTouristAdd()
                        }
                        VStack(spacing: MyAdaptive.shared.setDynamicValue(iPhoneValue: 16, iPadValue: 16)) {
                            TotalInfoView(title: "Тур", value: bookingInfo.tourPrice)
                            TotalInfoView(title: "Топливный сбор", value: bookingInfo.fuelCharge)
                            TotalInfoView(title: "Сервисный сбор", value: bookingInfo.serviceCharge)
                            let totalAmount = bookingInfo.tourPrice + bookingInfo.fuelCharge + bookingInfo.serviceCharge

                            AllAmountView(title: "К оплате", value: totalAmount)
                        }
                        .padding(.vertical, MyAdaptive.shared.setDynamicValue(iPhoneValue: 16, iPadValue: 16))
                        .frame(maxWidth: .infinity)
                        .background(.white)
                        .cornerRadius(MyAdaptive.shared.setDynamicValue(iPhoneValue: 15, iPadValue: 15))
                        Button {
                            if viewModel.isValidInput(viewModel: viewModel) {
                                coordinator.currentView = .doneView
                            }
                        } label: {
                            VStack {
                                Text("Оплатить \(totalAmount) ₽")
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

                } else {
                    Text("Error loading booking information")
                        .foregroundColor(.red)
                    
                }
                Spacer()
            }
        }
        .onTapGesture {
            viewModel.hideKeyboard()
        }
        .padding(.top, 4)
        .padding(.bottom, 4)
        .onAppear {
            viewModel.fetchBooking()
        }
    }
    @ViewBuilder
    private func newTouristAdd() -> some View {
        VStack {
            Button(action: {
                DispatchQueue.main.async {
                    viewModel.addNewTourist()
                    istouristColumnTapped.append(false)
                }
            }) {
                HStack {
                    Text("Добавить туриста")
                        .font(
                            Font.custom("SF Pro Display", size: 22)
                                .weight(.medium)
                        )
                        .foregroundColor(.black)
                    Spacer()
                    
                    Image("plus")
                        .resizable()
                        .frame(width: 32, height: 32)
                }
            }.padding(.horizontal, MyAdaptive.shared.setDynamicValue(iPhoneValue: 16, iPadValue: 16))
        }
        .padding(.vertical, MyAdaptive.shared.setDynamicValue(iPhoneValue: 16, iPadValue: 16))
        .frame(maxWidth: .infinity)
        .background(.white)
        .cornerRadius(MyAdaptive.shared.setDynamicValue(iPhoneValue: 15, iPadValue: 15))
    }
    @ViewBuilder
    private func newTouristColumn() -> some View {
        if !viewModel.tourists.isEmpty {
            ForEach(Array(viewModel.tourists.enumerated()), id: \.element.id) { index, subTask in
                VStack {
                    Button {
                        istouristColumnTapped[index].toggle()
                    } label: {
                        HStack {
                            Text(viewModel.currentTouristNames[index])
                                .font(
                                    Font.custom("SF Pro Display", size: 22)
                                        .weight(.medium)
                                )
                                .foregroundColor(.black)
                            Spacer()
                            
                            Image(isRectangeIsTapped ? "arrowUp": "arrowDown")
                                .resizable()
                                .frame(width: MyAdaptive.shared.setDynamicValue(iPhoneValue: 32, iPadValue: 32),height: MyAdaptive.shared.setDynamicValue(iPhoneValue: 32, iPadValue: 32))
                        }
                    }.padding(.horizontal, MyAdaptive.shared.setDynamicValue(iPhoneValue: 16, iPadValue: 16))
                    if self.istouristColumnTapped[index] {
                        CustomTextField(placeholder: "Введите имя", text: $viewModel.tourists[index].name, title: "Имя")
                        CustomTextField(placeholder: "Введите фамилию", text: $viewModel.tourists[index].surName, title: "Фамилия")
                        CustomTextField(placeholder: "Введите гражданство", text: $viewModel.tourists[index].citizenship, title: "Гражданство")
                        CustomTextField(placeholder: "Введите номер загранпаспорта", text: $viewModel.tourists[index].passportNumber, title: "Номер загранпаспорта")
                        CustomTextField(placeholder: "Введите cрок действия загранпаспорта", text: $viewModel.tourists[index].expiredDateOfPassport, title: "Срок действия загранпаспорта")
                    }
                }
                .padding(.vertical, MyAdaptive.shared.setDynamicValue(iPhoneValue: 16, iPadValue: 16))
                .frame(maxWidth: .infinity)
                .background(.white)
                .cornerRadius(MyAdaptive.shared.setDynamicValue(iPhoneValue: 15, iPadValue: 15))
            }
        }
    }
}

extension Color {
    init(hex: Int, opacity: Double = 1) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xFF) / 255.0,
            green: Double((hex >> 8) & 0xFF) / 255.0,
            blue: Double(hex & 0xFF) / 255.0,
            opacity: opacity
        )
    }
}
