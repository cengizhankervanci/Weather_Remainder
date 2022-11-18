//
//  WeatherModel.swift
//  Weather Remainder
//
//  Created by Cengizhan Kervancı on 17.11.2022.
//

import Foundation

struct WeatherModel: Codable{
    let name : String
    let weather : [WeatherInfo]
    let main : MainData
    let wind : Wind
}

struct WeatherInfo : Codable{
    let main : String
}

struct MainData: Codable {
    let temp, feels_like, temp_min, temp_max: Double
    let humidity : Int
}

struct Wind:Codable{
    let speed:Double
}


