//
//  ContentView.swift
//  Weather Remainder
//
//  Created by Cengizhan Kervancı on 17.11.2022.
//

import SwiftUI

let Day = Gradient(stops: [
    .init(color: Color.blue.opacity(0.6), location: 0.5),
    .init(color: Color.white, location: 1)]
)

let Night = Gradient(stops: [
    .init(color: Color.gray.opacity(1), location: 0.5),
    .init(color: Color.black, location: 1)
])

struct ContentView: View
{
    var body: some View
    {
        ZStack
        {
            Rectangle()
                .fill(LinearGradient(gradient: Day, startPoint:.top, endPoint:.bottomTrailing))
                .frame(width:UIScreen.main.bounds.width,height: UIScreen.main.bounds.height * 1.2)
            
            Rectangle()
                .fill(LinearGradient(gradient: Day, startPoint:.top, endPoint:.bottomTrailing))
                .frame(width:UIScreen.main.bounds.width,height: UIScreen.main.bounds.height * 1.2)
            
            VStack
            {
                Group
                {
                    Text("Kartal , İSTANBUL")
                        .font(.system(size: 40))
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                    
                    Text("Güneşli")
                        .font(.title3)
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                }
                
                Group
                {
                    Image("sun")
                        .resizable()
                        .frame(width: 260,height: 260)
                    
                    Text("24°")
                        .font(.system(size: 60))
                        .foregroundColor(.white)
                        .shadow(color:.white,radius: 0.7)

                    Text("Hava güneşli ve son derece açık gözüküyor. Günün keyfini çıkarın.")
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                }
                .offset(y:50)
                
                
                Group
                {
                    ZStack
                    {
                        RoundedRectangle(cornerRadius: 35)
                            .frame(width: UIScreen.main.bounds.width,height: UIScreen.main.bounds.height / 3.5)
                            .offset(y:90)
                            .foregroundColor(.white.opacity(0.2))
                            .shadow(color:.white,radius: 10)
                        
                        HStack
                        {
                            Image("termo")
                                .resizable()
                                .scaledToFit()
                                .shadow(radius: 10)
                                .frame(width: 45)
                            Text("Min Temp : 22°")
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .shadow(color:.black,radius: 1)
                            Spacer()
                            Image("termo")
                                .resizable()
                                .scaledToFit()
                                .shadow(radius: 10)
                                .frame(width: 45)
                            Text("Max Temp : 25°")
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .shadow(color:.black,radius: 1)
                        }.padding()
                            .offset(y:20)
                        
                            HStack
                            {
                                Image("wind")
                                    .resizable()
                                    .scaledToFit()
                                    .shadow(radius: 10)
                                    .frame(width: 45)
                                Text("Wind Speed : 10 m/s")
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
                                Text("Humidity : %10")
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                    .shadow(color:.black,radius: 1)
                            }.padding()
                            .offset(y:75)
                        
                    }
                }
                .offset(y:30)
                
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
