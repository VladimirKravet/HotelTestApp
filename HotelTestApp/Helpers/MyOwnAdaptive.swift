//
//  MyOwnAdaptive.swift
//  InitialProject
//
//  Created by Vladimir Kravets on 08.12.2023.
//

import Foundation
import SwiftUI


public final class MyAdaptive: ObservableObject {
    public static let shared = MyAdaptive()

    @Environment(\.horizontalSizeClass) var deviceType
    @Published var currentIphoneSize: ScreenSizeType!

    //MARK: iphone 14
    let staticWidthIphone14: CGFloat = 390
    let staticHeightIphone14: CGFloat = 844

    //MARK: Ipad 11 4 gen
    let staticWidthIpad8: CGFloat = 834
    let staticHeightIpad8: CGFloat = 1194

    //MARK: Device Enums
    enum ScreenSizeType: CaseIterable {
        case iPhone15ProMax
        case iPhone15Pro
        case iPhone15Plus
        case iPhone15
        case iPadPro6thGen129
        case iPadPro6thGen11
        case iPad10thGen
        case iPhone14Plus
        case iPhone14ProMax
        case iPhone14Pro
        case iPhone14
        case iPhoneSE3rdGen
        case iPadAir5thGen
        case iPhone13
        case iPhone13Mini
        case iPhone13ProMax
        case iPhone13Pro
        case iPad9thGen
        case iPadPro5thGen129
        case iPadPro5thGen11
        case iPadAir4thGen
        case iPhone12
        case iPhone12Mini
        case iPhone12ProMax
        case iPhone12Pro
        case iPad8thGen
        case iPhone11ProMax
        case iPhone11Pro
        case iPhone11
        case iPadMini6thGen
        case iPhoneXR
        case iPhoneXSMax
        case iPhoneXS
        case iPhoneSE2ndGen
        case iPadPro4thGen129
        case iPadPro4thGen11
        case iPad7thGen
        case iPhone8Plus
        case iPhone8
        case iPhoneX
        case iPhone7Plus
        case iPhone7
        case iPadPro2ndGen129
        case iPadPro2ndGen105
        case iPad5thGen
        case iPadMini5thGen
        case iPadAir3rdGen
        case iPadPro3rdGen129
        case iPadPro3rdGen11
        case iPhoneSE1stGen
        case iPadPro1stGen97
        case iPadPro1stGen129

        //MARK: Device dimentiones
        var deviceData: DeviceData {
            switch self {
            case .iPhone15ProMax:
                return DeviceData(logicalWidth: 430, logicalHeight: 932)
            case .iPhone15Pro:
                return DeviceData(logicalWidth: 393, logicalHeight: 852)
            case .iPhone15Plus:
                return DeviceData(logicalWidth: 430, logicalHeight: 932)
            case .iPhone15:
                return DeviceData(logicalWidth: 393, logicalHeight: 852)
            case .iPadPro6thGen129:
                return DeviceData(logicalWidth: 1024, logicalHeight: 1366)
            case .iPadPro6thGen11:
                return DeviceData(logicalWidth: 834, logicalHeight: 1194)
            case .iPad10thGen:
                return DeviceData(logicalWidth: 820, logicalHeight: 1180)
            case .iPhone14Plus:
                return DeviceData(logicalWidth: 428, logicalHeight: 926)
            case .iPhone14ProMax:
                return DeviceData(logicalWidth: 430, logicalHeight: 932)
            case .iPhone14Pro:
                return DeviceData(logicalWidth: 393, logicalHeight: 852)
            case .iPhone14:
                return DeviceData(logicalWidth: 390, logicalHeight: 844)
            case .iPhoneSE3rdGen:
                return DeviceData(logicalWidth: 375, logicalHeight: 667)
            case .iPadAir5thGen:
                return DeviceData(logicalWidth: 820, logicalHeight: 1180)
            case .iPadMini6thGen:
                return DeviceData(logicalWidth: 744, logicalHeight: 1133)
            case .iPhone13:
                return DeviceData(logicalWidth: 390, logicalHeight: 844)
            case .iPhone13Mini:
                return DeviceData(logicalWidth: 375, logicalHeight: 812)
            case .iPhone13ProMax:
                return DeviceData(logicalWidth: 428, logicalHeight: 926)
            case .iPhone13Pro:
                return DeviceData(logicalWidth: 390, logicalHeight: 844)
            case .iPad9thGen:
                return DeviceData(logicalWidth: 810, logicalHeight: 1080)
            case .iPadPro5thGen129:
                return DeviceData(logicalWidth: 1024, logicalHeight: 1366)
            case .iPadPro5thGen11:
                return DeviceData(logicalWidth: 834, logicalHeight: 1194)
            case .iPadAir4thGen:
                return DeviceData(logicalWidth: 820, logicalHeight: 1180)
            case .iPhone12:
                return DeviceData(logicalWidth: 390, logicalHeight: 844)
            case .iPhone12Mini:
                return DeviceData(logicalWidth: 375, logicalHeight: 812)
            case .iPhone12ProMax:
                return DeviceData(logicalWidth: 428, logicalHeight: 926)
            case .iPhone12Pro:
                return DeviceData(logicalWidth: 390, logicalHeight: 844)
            case .iPad8thGen:
                return DeviceData(logicalWidth: 810, logicalHeight: 1080)
            case .iPhoneSE2ndGen:
                return DeviceData(logicalWidth: 375, logicalHeight: 667)
            case .iPadPro4thGen129:
                return DeviceData(logicalWidth: 1024, logicalHeight: 1366)
            case .iPadPro4thGen11:
                return DeviceData(logicalWidth: 834, logicalHeight: 1194)
            case .iPad7thGen:
                return DeviceData(logicalWidth: 810, logicalHeight: 1080)
            case .iPhone11ProMax:
                return DeviceData(logicalWidth: 414, logicalHeight: 896)
            case .iPhone11Pro:
                return DeviceData(logicalWidth: 375, logicalHeight: 812)
            case .iPhone11:
                return DeviceData(logicalWidth: 414, logicalHeight: 896)
            case .iPadMini5thGen:
                return DeviceData(logicalWidth: 768, logicalHeight: 1024)
            case .iPadAir3rdGen:
                return DeviceData(logicalWidth: 834, logicalHeight: 1112)
            case .iPadPro3rdGen129:
                return DeviceData(logicalWidth: 1024, logicalHeight: 1366)
            case .iPadPro3rdGen11:
                return DeviceData(logicalWidth: 834, logicalHeight: 1194)
            case .iPhoneXR:
                return DeviceData(logicalWidth: 414, logicalHeight: 896)
            case .iPhoneXSMax:
                return DeviceData(logicalWidth: 414, logicalHeight: 896)
            case .iPhoneXS:
                return DeviceData(logicalWidth: 375, logicalHeight: 812)
            case .iPhoneX:
                return DeviceData(logicalWidth: 375, logicalHeight: 812)
            case .iPhone8Plus:
                return DeviceData(logicalWidth: 414, logicalHeight: 736)
            case .iPhone8:
                return DeviceData(logicalWidth: 375, logicalHeight: 667)
            case .iPadPro2ndGen129:
                return DeviceData(logicalWidth: 1024, logicalHeight: 1366)
            case .iPadPro2ndGen105:
                return DeviceData(logicalWidth: 834, logicalHeight: 1112)
            case .iPad5thGen:
                return DeviceData(logicalWidth: 768, logicalHeight: 1024)
            case .iPhone7Plus:
                return DeviceData(logicalWidth: 414, logicalHeight: 736)
            case .iPhone7:
                return DeviceData(logicalWidth: 375, logicalHeight: 667)
            case .iPhoneSE1stGen:
                return DeviceData(logicalWidth: 320, logicalHeight: 568)
            case .iPadPro1stGen97:
                return DeviceData(logicalWidth: 768, logicalHeight: 1024)
            case .iPadPro1stGen129:
                return DeviceData(logicalWidth: 1024, logicalHeight: 1366)
            }
        }
    }

    struct DeviceData {
        var logicalWidth: CGFloat
        var logicalHeight: CGFloat
    }

    private init() {
        self.getCurrentDevice()
    }
    //MARK: Check Current Device
    private func getCurrentDevice() {
        let screenWidth = UIScreen.main.bounds.width
        let screenHeight = UIScreen.main.bounds.height

        // Определение устройства по текущим размерам экрана
        guard let currentSize = ScreenSizeType.allCases.first(where: { sizeType in
            let deviceData = sizeType.deviceData
            return deviceData.logicalWidth == screenWidth && deviceData.logicalHeight == screenHeight
        }) else {
            // Если не удается определить устройство, установите значение по умолчанию
            self.currentIphoneSize = .iPhone12
            return
        }

        self.currentIphoneSize = currentSize
    }

    //MARK: Padding size default is IPhone 12
    func setPadding(paddingByDesign: CGFloat) -> CGFloat {
        guard let currentIphoneSize = currentIphoneSize else { return 1.0 }

        // Получаем текущие размеры устройства
        let currentWidth = currentIphoneSize.deviceData.logicalWidth
        let currentHeight = currentIphoneSize.deviceData.logicalHeight

        // Определяем коэффициенты коррекции
        let widthCoefficient: CGFloat = 0.5
        let heightCoefficient: CGFloat = 0.5

        let adjustedPadding = paddingByDesign * (1.0 + widthCoefficient * (currentWidth - staticWidthIphone14) / staticWidthIphone14 +
                                                 heightCoefficient * (currentHeight - staticHeightIphone14) / staticHeightIphone14)

        return adjustedPadding
    }
}

extension MyAdaptive.ScreenSizeType {
    func isIPad() -> Bool {
        switch self {
        case .iPadPro6thGen129, .iPadPro6thGen11, .iPad10thGen,
             .iPhoneSE3rdGen, .iPadAir5thGen, .iPad9thGen,
             .iPadPro5thGen129, .iPadPro5thGen11, .iPadAir4thGen,
             .iPad8thGen, .iPadPro4thGen129, .iPadPro4thGen11,
             .iPad7thGen, .iPadPro2ndGen129, .iPadPro2ndGen105,
             .iPad5thGen, .iPadMini5thGen, .iPadAir3rdGen,
             .iPadPro3rdGen129, .iPadPro3rdGen11, .iPadPro1stGen97,
             .iPadPro1stGen129:
            return true
        default:
            return false
        }
    }
}

public extension MyAdaptive {

    func setDynamicValue(iPhoneValue: CGFloat, iPadValue: CGFloat) -> CGFloat {
        guard let currentIphoneSize = currentIphoneSize else { return 1.0 }

        // Получаем текущие размеры устройства
        let currentWidth = currentIphoneSize.deviceData.logicalWidth
        let currentHeight = currentIphoneSize.deviceData.logicalHeight

        // Определяем коэффициенты коррекции
        var widthCoefficient: CGFloat = 0.5
        var heightCoefficient: CGFloat = 0.5

        // Определяем, является ли текущее устройство iPad
        let isIPad = currentIphoneSize.isIPad()

        // Уменьшаем коэффициенты для устройств с меньшим экраном
        if currentIphoneSize == .iPhone13Mini {
            widthCoefficient = 0.7
            heightCoefficient = 0.7
        }

        if currentIphoneSize == .iPhoneSE3rdGen {
            widthCoefficient = 0.565
            heightCoefficient = 0.565
        }

        let widthCorrection = isIPad ? (currentWidth - staticWidthIpad8) / staticWidthIpad8 : (currentWidth - staticWidthIphone14) / staticWidthIphone14
        let heightCorrection = isIPad ? (currentHeight - staticHeightIpad8) / staticHeightIpad8 : (currentHeight - staticHeightIphone14) / staticHeightIphone14

        // Выбираем соответствующее значение в зависимости от типа устройства
        let deviceValue = isIPad ? iPadValue : iPhoneValue

        // Производим коррекцию значения
        let adjustedValue = deviceValue * (1.0 + widthCoefficient * widthCorrection +
                                           heightCoefficient * heightCorrection)

        return adjustedValue
    }

    func setFontSize(fontSizeForiPhone: CGFloat, fontSizeForiPad: CGFloat) -> CGFloat {
        guard let currentIphoneSize = currentIphoneSize else { return 1.0 }

        // Получаем текущие размеры устройства
        let currentWidth = currentIphoneSize.deviceData.logicalWidth
        let currentHeight = currentIphoneSize.deviceData.logicalHeight

        // Определяем коэффициенты коррекции
        var widthCoefficient: CGFloat = 0.5
        var heightCoefficient: CGFloat = 0.5

        // Определяем, является ли текущее устройство iPad
        let isIPad = currentIphoneSize.isIPad()

        // Уменьшаем коэффициенты для устройств с меньшим экраном
        if currentIphoneSize == .iPhone13Mini {
            widthCoefficient = 0.7
            heightCoefficient = 0.7
        }

        if currentIphoneSize == .iPhoneSE3rdGen {
            widthCoefficient = 0.565
            heightCoefficient = 0.565
        }

        let widthCorrection = isIPad ? (currentWidth - staticWidthIpad8) / staticWidthIpad8 : (currentWidth - staticWidthIphone14) / staticWidthIphone14
        let heightCorrection = isIPad ? (currentHeight - staticHeightIpad8) / staticHeightIpad8 : (currentHeight - staticHeightIphone14) / staticHeightIphone14

        // Выбираем соответствующее значение в зависимости от типа устройства
        let adjustedFontSize = isIPad ? fontSizeForiPad : fontSizeForiPhone

        // Производим коррекцию значения
        let adjustedValue = adjustedFontSize * (1.0 + widthCoefficient * widthCorrection +
                                           heightCoefficient * heightCorrection)

        return adjustedValue
    }
}

