//
//  DataProtocol.swift
//  Weather Remainder
//
//  Created by Cengizhan Kervancı on 18.11.2022.
//

import Foundation
protocol DataProtocol
{
    func fetchData(city:String,completion : @escaping(Result <WeatherModel,Error>)-> Void)
}

