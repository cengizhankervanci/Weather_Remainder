//
//  WeatherViewModel.swift
//  Weather Remainder
//
//  Created by Cengizhan Kervancı on 17.11.2022.
//

import Foundation
import CoreLocation

class WeatherViewModel : ObservableObject
{
    @Published var cityName: String=""
    @Published var description: String=""
    @Published var temp: String=""
    @Published var comment: String=""
    @Published var minTemp: String=""
    @Published var maxTemp: String=""
    @Published var wind: String=""
    @Published var humidity: String=""
    
    init()
    {
        let latitude = CLLocationManager().location?.coordinate.latitude
        let longitude = CLLocationManager().location?.coordinate.longitude
        let baseURL = "https://api.openweathermap.org/data/2.5/weather?lat=\(latitude ?? 0.0)&lon=\(longitude ?? 0.0)&appid=1f5c1535c6ec292b467873125fd96db8"
        fetchWeatherData(url: baseURL)
    }
    
    func fetchWeatherData(url:String){
        guard let url = URL(string: url)else{return}
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data,error == nil else {return}
            
            do{
                let model = try JSONDecoder().decode(WeatherModel.self, from: data)
                
                DispatchQueue.main.async {
                    self.cityName = model.name
                    self.description = String(model.weather.first?.main ?? "Nill")
                    self.temp = String(format:"%0.1f",model.main.temp - 273.15)
                    self.comment = String(format:"%0.1f",model.main.feels_like - 273.15)
                    self.minTemp = String(format:"%0.1f",model.main.temp_min - 273.15)
                    self.maxTemp = String(format:"%0.1f",model.main.temp_max - 273.15)
                    self.wind = String(model.wind.speed)
                    self.humidity = String(model.main.humidity)
                }
            }
            catch{
                print(error.localizedDescription)
            }
            
        }
        task.resume()
    }
}
