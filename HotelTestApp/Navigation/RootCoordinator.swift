//
//  RootCoordinator.swift
//  HotelTestApp
//
//  Created by Vladimir Kravets on 16.12.2023.
//

import Foundation
import SwiftUI

final class RootCoordinator: ObservableObject {
    @Published var currentView: MainViewsEnum = .hotelView
    
    @Published var hotelCoordinator: HotelCoordinator!

    
    @Published var hideTabBar: Bool = false

    init() {
        self.hotelCoordinator = HotelCoordinator(rootCoordinator: self)
        
    }
}

// MARK: - Methods for navigation
extension RootCoordinator {
    func navigateTo(to view: MainViewsEnum) {
        withAnimation(.easeInOut(duration: 0.2)) {
             self.currentView = view
        }
    }
}

enum MainViewsEnum {
    case hotelView

}

