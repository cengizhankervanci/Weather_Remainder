//
//  ApiManager.swift
//  Weather Remainder
//
//  Created by Cengizhan Kervancı on 18.11.2022.
//

import Foundation

class ApiManager : DataProtocol
{
    func fetchData(city : String, completion complition:@escaping(Result <WeatherModel,Error>)-> Void){
        let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=1f5c1535c6ec292b467873125fd96db8")!
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else{
                return
            }
            DispatchQueue.main.async {
                if let data = try? JSONDecoder().decode(WeatherModel.self, from: data){
                    complition(.success(data))
                }
                else{
                    complition(.failure(error!))
                }
            }
        }.resume()
    }
}
