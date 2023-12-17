//
//  HotelRootView.swift
//  HotelTestApp
//
//  Created by Vladimir Kravets on 16.12.2023.
//

import SwiftUI

struct HotelRootView: View {
    @StateObject var coordinator: HotelCoordinator
    @StateObject var viewModel: HotelViewModel
    
    var body: some View {
        Group {
            switch coordinator.currentView {
            case .firstView:
                ContentView()
            case .hotelMainView:
                HotelMainView()
            case .orderView:
                OrderView()
            case .doneView:
                DoneView()
            case .none:
                EmptyView()
            }
        }
        .environmentObject(coordinator)
        .environmentObject(viewModel)
    }
}
