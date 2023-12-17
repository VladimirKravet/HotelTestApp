//
//  HotelCoordinator.swift
//  HotelTestApp
//
//  Created by Vladimir Kravets on 16.12.2023.
//

import Foundation
import SwiftUI

class HotelCoordinator: ObservableObject {
    internal unowned var rootCoordinator: RootCoordinator
    @Published var viewModel: HotelViewModel!
    @Published var currentView: HotelViewsEnum?
    @Published var navigationStack: [HotelViewsEnum] = []
    init(rootCoordinator: RootCoordinator) {
        self.rootCoordinator = rootCoordinator
        self.viewModel = HotelViewModel(coordinator: self)
        start()
    }
}

// MARK: - Navigation
extension HotelCoordinator {
    func start() {
        self.navigationStack.append(.firstView)
        if let view = navigationStack.last {
            self.currentView = view
        }
    }

    func pushView(view: HotelViewsEnum) {
        if view == .firstView {
            self.navigationStack.removeAll()
        }
        self.navigationStack.append(view)
        if let view = navigationStack.last {
            withAnimation(.easeInOut(duration: 0.2)) {
                self.currentView = view
            }
        }
    }
}

enum HotelViewsEnum {
    case firstView
    case hotelMainView
    case orderView
    case doneView

}
