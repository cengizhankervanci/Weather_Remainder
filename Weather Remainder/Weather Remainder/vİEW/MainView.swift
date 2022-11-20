//
//  MainView.swift
//  Weather Remainder
//
//  Created by Cengizhan Kervancı on 17.11.2022.
//

import SwiftUI

struct MainView: View
{
    let Day = Gradient(stops: [
        .init(color: Color.blue.opacity(0.6), location: 0.5),
        .init(color: Color.white, location: 1)]
    )

    let Night = Gradient(stops: [
        .init(color: Color.black.opacity(0.7), location: 0.4),
        .init(color: Color.black, location: 1)
    ])

    let hour = Calendar.current.component(.hour, from: Date())
    
    @StateObject var viewModel = WeatherViewModel()
    
    var body: some View {
        ZStack
        {
            if(hour < 18 && hour > 5)
            {
                Rectangle()
                    .fill(LinearGradient(gradient: Day, startPoint:.top, endPoint:.bottomTrailing))
                    .frame(width:UIScreen.main.bounds.width,height: UIScreen.main.bounds.height * 1.2)
            }else{
                Rectangle()
                    .fill(LinearGradient(gradient: Night, startPoint:.top, endPoint:.bottomTrailing))
                    .frame(width:UIScreen.main.bounds.width,height: UIScreen.main.bounds.height * 1.2)
            }
            VStack
            {
                
                Group
                {
                    Text(viewModel.cityName)
                        .font(.system(size: 40))
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                    
                    Text(viewModel.description)
                        .font(.title3)
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                }
                
                Group
                {
                    Image(viewModel.weatherIcons(stat: viewModel.description))
                        .resizable()
                        .frame(width: 260,height: 260)
                    
                    Text("\(viewModel.temp)°")
                        .font(.system(size: 60))
                        .foregroundColor(.white)
                        .shadow(color:.white,radius: 0.7)
                    
                    Text("Feels Like: \(viewModel.comment)°")
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                }
                
                Group
                {
                    ZStack
                    {
                        RoundedRectangle(cornerRadius: 35)
                            .frame(width: UIScreen.main.bounds.width,height: UIScreen.main.bounds.height / 3.9)
                            
                            .foregroundColor(.white.opacity(0.2))
                            .shadow(color:.white,radius: 10)
                        
                        HStack
                        {
                            Image("termo")
                                .resizable()
                                .scaledToFit()
                                .shadow(radius: 10)
                                .frame(width: 45)
                            Text("Min Temp : \(viewModel.minTemp)°")
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .shadow(color:.black,radius: 1)
                                .frame(width: 120)
                            Spacer()
                            Image("termo")
                                .resizable()
                                .scaledToFit()
                                .shadow(radius: 10)
                                .frame(width: 45)
                            Text("Max Temp : \(viewModel.maxTemp)°")
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .shadow(color:.black,radius: 1)
                        }
                        .padding()
                        .offset(y:-50)
                        
                        HStack
                        {
                            Image("wind")
                                .resizable()
                                .scaledToFit()
                                .shadow(radius: 10)
                                .frame(width: 45)
                            Text("Wind Speed : \(viewModel.wind)m/s")
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .shadow(color:.black,radius: 1)
                                .frame(width: 120)
                            Spacer()
                            Image("humidity")
                                .resizable()
                                .scaledToFit()
                                .shadow(radius: 10)
                                .frame(width: 45)
                            Text("Humidity : %\(viewModel.humidity)")
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .shadow(color:.black,radius: 1)
                        }
                        .padding()
                        .offset(y:25)
                    }
                }
                .offset(y:20)
            }
        }
        .padding()
    }
}

struct MainView_Previews: PreviewProvider
{
    static var previews: some View
    {
        MainView()
    }
 }

