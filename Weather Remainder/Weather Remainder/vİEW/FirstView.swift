//
//  FirstView.swift
//  Weather Remainder
//
//  Created by Cengizhan Kervancı on 17.11.2022.
//

import SwiftUI
import CoreLocationUI

struct FirstView: View {
    @EnvironmentObject var locationManagar : LocationManager
    
    
    {
        VStack
        {
            VStack(spacing: 20)
            {
                Text("Welcome to the Umbralle Remainder")
                    .bold()
                    .font(.title)
                Text("We need your location for weather status...")
                    .padding()
            }
            .multilineTextAlignment(.center)
            
            LocationButton(.shareCurrentLocation){
                locationManagar.requestLocation()
            }
            .cornerRadius(30)
            .symbolVariant(.fill)
            .foregroundColor(.white)
        }
        .frame(maxWidth: .infinity,maxHeight: .infinity)
    }
}

struct FirstView_Previews: PreviewProvider {
    static var previews: some View {
        FirstView()
    }
}
