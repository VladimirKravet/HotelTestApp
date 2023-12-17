//
//  HotelViewModel.swift
//  HotelTestApp
//
//  Created by Vladimir Kravets on 15.12.2023.
//

import Foundation

import Foundation
import UIKit

class HotelViewModel: ObservableObject {
    internal unowned var coordinator: HotelCoordinator
    @Published var hotel: Hotel?
    @Published var rooms: [Room]?
    @Published var selectHotel : Hotel?
    @Published var selectedRoom : Room?
    @Published var hotelInfo: HotelInfo?
    @Published var phone = "7"
    @Published var name = ""
     let maskPhone = "+* (***) ***-**-**"
    @Published var surName = ""
    @Published var dateOfBirth = ""
    @Published var citizenship = ""
    @Published var passportNumber = ""
    @Published var epiredDateOfPassport = ""
    @Published var tourists: [Tourist] = []
    @Published var currentTouristNumber = 1
    @Published var currentTouristNames = ["Второй турист", "Третий турист", "Четвертый турист", "Пятый турист", "Шестой турист", "Седьмой турист", "Восьмой турист", "Девятый турист", "Десятый турист"]
    @Published var addTouristCounter: Int = 0
    private let MAX_SUB_COUNT: Int = 10
    @Published var errorMail: Bool = true
    @Published var errorPhone: Bool = true
    @Published var email = ""
    @Published var errorSurName: Bool = true
    @Published var errorName: Bool = true
        @Published var errorCitizenship: Bool = true
        @Published var errorPassportNumber: Bool = true
        @Published var errorExpiredDateOfPassport: Bool = true
    
    init(coordinator: HotelCoordinator) {
        self.coordinator = coordinator
        fetchHotel()
        fetchRooms()
        fetchBooking()
    }
    
    func fetchHotel() {
        guard let url = URL(string: "https://run.mocky.io/v3/d144777c-a67f-4e35-867a-cacc3b827473") else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let data = data {
                do {
                    let decodedResponse = try JSONDecoder().decode(Hotel.self, from: data)
                    DispatchQueue.main.async {
                        self.hotel = decodedResponse
                    }
                } catch {
                    print("Error decoding JSON: \(error)")
                }
            } else if let error = error {
                print("Error fetching data: \(error)")
            }
        }.resume()
    }
    
    func fetchRooms() {
        guard let url = URL(string: "https://run.mocky.io/v3/8b532701-709e-4194-a41c-1a903af00195") else {
            print("Invalid URL")
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                return
            }
            
            guard let data = data else {
                print("No data received")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let roomList = try decoder.decode(RoomList.self, from: data)
                DispatchQueue.main.async {
                    self.rooms = roomList.rooms
                }
            } catch {
                print("Error decoding JSON: \(error.localizedDescription)")
            }
        }.resume()
    }
    func fetchBooking() {
        guard let url = URL(string: "https://run.mocky.io/v3/63866c74-d593-432c-af8e-f279d1a8d2ff") else {
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                return
            }

            guard let httpResponse = response as? HTTPURLResponse else {
                print("Error: No HTTP response")
                return
            }

            print("HTTP Status Code: \(httpResponse.statusCode)")

            guard let data = data else {
                print("Error: No data received")
                return
            }

            if let jsonString = String(data: data, encoding: .utf8) {
                print("Response JSON: \(jsonString)")
            }

            do {
                let decodedData = try JSONDecoder().decode(HotelInfo.self, from: data)
                DispatchQueue.main.async {
                    self.hotelInfo = decodedData
                }
            } catch {
                print("Error decoding JSON: \(error.localizedDescription)")
            }
        }.resume()
    }
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
        
        
    }
    func addNewTourist() {
        guard addTouristCounter < MAX_SUB_COUNT else { return }
        let newTourist = Tourist(
            id: UUID().uuidString,
            name: "",
            surName: "",
            citizenship: "",
            passportNumber: "",
            expiredDateOfPassport: ""
        )
        tourists.append(newTourist)
        currentTouristNumber += 1
        addTouristCounter += 1
        objectWillChange.send()
    }
    func formatPrice(_ price: Int) -> String? {
            let numberFormatter = NumberFormatter()
            numberFormatter.numberStyle = .decimal
            numberFormatter.groupingSeparator = " "
            numberFormatter.minimumFractionDigits = 0
            numberFormatter.maximumFractionDigits = 0

            return numberFormatter.string(from: NSNumber(value: price))
        }
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        
        let isValid = emailPred.evaluate(with: email)
        
        // Update errorMail based on the result
        errorMail = isValid
        
        return isValid
    }
    func areAllDigitsEntered(phone: String) -> Bool {
        let numbers = phone.replacingOccurrences(of: "[^0-9]", with: "", options: .regularExpression)
        return numbers.count == 12
    }
    func validateSurName() -> Bool {
            let trimmedSurName = surName.trimmingCharacters(in: .whitespacesAndNewlines)
            errorSurName = trimmedSurName.isEmpty
            return !errorSurName
        }
    func validateName() -> Bool {
            let trimmedSurName = name.trimmingCharacters(in: .whitespacesAndNewlines)
            errorName = trimmedSurName.isEmpty
            return !errorName
        }
    func validateCitizenship() -> Bool {
            let trimmedSurName = citizenship.trimmingCharacters(in: .whitespacesAndNewlines)
            errorCitizenship = trimmedSurName.isEmpty
            return !errorCitizenship
        }
    func validatePassportNumber() -> Bool {
            let trimmedSurName = passportNumber.trimmingCharacters(in: .whitespacesAndNewlines)
            errorPassportNumber = trimmedSurName.isEmpty
            return !errorPassportNumber
        }
    func validatePassportExpired() -> Bool {
            let trimmedSurName = epiredDateOfPassport.trimmingCharacters(in: .whitespacesAndNewlines)
            errorExpiredDateOfPassport = trimmedSurName.isEmpty
            return !errorExpiredDateOfPassport
        }

    func isValidInput(viewModel: HotelViewModel) -> Bool {
        var isValid = true

        // Email validation
        if !viewModel.isValidEmail(viewModel.email) {
            viewModel.errorMail = false
            isValid = false
        }

        // Phone validation
        if !viewModel.areAllDigitsEntered(phone: viewModel.phone) {
            viewModel.errorPhone = false
            isValid = false
        } else {
            viewModel.errorPhone = true
        }
        if !viewModel.validateSurName() {
            viewModel.errorSurName = false
        } else {
            viewModel.errorSurName = true
        }

        if !viewModel.validateName() {
            viewModel.errorName = false
        } else {
            viewModel.errorName = true
        }
        if !viewModel.validateCitizenship() {
            viewModel.errorCitizenship =  false
        } else {
            viewModel.errorCitizenship =  true
        }
        if !viewModel.validatePassportNumber() {
            viewModel.errorPassportNumber = false
        } else {
            viewModel.errorPassportNumber = true
        }

        if !viewModel.validatePassportExpired() {
            viewModel.errorExpiredDateOfPassport =  false
        } else {
            viewModel.errorExpiredDateOfPassport =  true
        }
        return isValid
    }
    
}

struct RoomList: Codable {
    let rooms: [Room]
}
