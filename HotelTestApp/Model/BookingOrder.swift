//
//  BookingOrder.swift
//  HotelTestApp
//
//  Created by Vladimir Kravets on 16.12.2023.
//

import Foundation

struct HotelInfo: Codable {
    let id: Int
    let hotelName: String
    let hotelAddress: String
    let hoRating: Int  // Int for "horating"
    let ratingName: String
    let departure: String
    let arrivalCountry: String
    let tourDateStart: String
    let tourDateStop: String
    let numberOfNights: Int
    let room: String
    let nutrition: String
    let tourPrice: Int  // Int for "tour_price"
    let fuelCharge: Int  // Int for "fuel_charge"
    let serviceCharge: Int  // Int for "service_charge"

    private enum CodingKeys: String, CodingKey {
        case id
        case hotelName = "hotel_name"
        case hotelAddress = "hotel_adress"
        case hoRating = "horating"
        case ratingName = "rating_name"
        case departure
        case arrivalCountry = "arrival_country"
        case tourDateStart = "tour_date_start"
        case tourDateStop = "tour_date_stop"
        case numberOfNights = "number_of_nights"
        case room
        case nutrition
        case tourPrice = "tour_price"
        case fuelCharge = "fuel_charge"
        case serviceCharge = "service_charge"
    }
}
