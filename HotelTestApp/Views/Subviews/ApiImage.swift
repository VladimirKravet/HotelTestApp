//
//  ApiImage.swift
//  HotelTestApp
//
//  Created by Vladimir Kravets on 15.12.2023.
//

import Foundation
import SwiftUI

struct RemoteImage: View {
    let url: String
    
    @State var image: Image?
    
    var body: some View {
        Group {
            if let image = image {
                image
                    .resizable()
                    .frame(width: MyAdaptive.shared.setDynamicValue(iPhoneValue: 343, iPadValue: 500), height: MyAdaptive.shared.setDynamicValue(iPhoneValue: 257, iPadValue: 327))
            } else {
                Image(systemName: "photo")
                    .resizable()
                    .foregroundColor(.gray)
                    .frame(width: MyAdaptive.shared.setDynamicValue(iPhoneValue: 343, iPadValue: 500), height: MyAdaptive.shared.setDynamicValue(iPhoneValue: 257, iPadValue: 327))
                    .onAppear(perform: loadImage)
            }
        }
    }
    
    private func loadImage() {
        guard let imageUrl = URL(string: url) else { return }
        
        URLSession.shared.dataTask(with: imageUrl) { data, _, error in
            if let data = data, let uiImage = UIImage(data: data) {
                DispatchQueue.main.async {
                    self.image = Image(uiImage: uiImage)
                }
            } else {
                print("Error loading image: \(error?.localizedDescription ?? "Unknown error")")
            }
        }.resume()
    }
}
