//
//  MainView.swift
//  HotelTestApp
//
//  Created by Vladimir Kravets on 16.12.2023.
//

import SwiftUI

struct MainView: View {
    @StateObject private var rootCoordinator = RootCoordinator()
    
    var body: some View {
        ZStack {
            VStack {
                switch rootCoordinator.currentView {
                case .hotelView:
                    HotelRootView(coordinator: rootCoordinator.hotelCoordinator, viewModel: rootCoordinator.hotelCoordinator.viewModel)
                }
            }
        }
        .onAppear {
            UIView.appearance().isExclusiveTouch = true
            UIView.appearance().isMultipleTouchEnabled = false
        }
        .environmentObject(rootCoordinator)
    }
}
