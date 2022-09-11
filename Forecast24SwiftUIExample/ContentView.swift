//
//  ContentView.swift
//  Forecast24SwiftUIExample
//
//  Created by Hoye Lam on 10/09/2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = ContentViewModel()
    
    var body: some View {
        hourForecastView
            .padding()
    }
    
    private var hourForecastView: some View {
        VStack(alignment: .leading) {
            Text(viewModel.data.headline)
                .padding(.horizontal)

            Divider()
            
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(alignment: .top, spacing: 24) {
                    ForEach(viewModel.data.forecasts, id: \.self) { forecast in
                        VStack {
                            Text("\(forecast.hour)")
                                .bold()
                            
                            Image(systemName: forecast.weatherType.systemNameIcon)
                                .imageScale(.large)
                                .frame(height: 40)
                            
                            Text("\(forecast.celsius)°")
                                .bold()
                        }
                    }
                }
                .padding([.horizontal])
            }
        }
        .padding(.vertical)
        .frame(height: 200)
        .foregroundColor(.white)
        .background(
            LinearGradient(gradient: Gradient(colors: [.accentColor.opacity(0.8), .accentColor.opacity(0.6)]), startPoint: .leading, endPoint: .trailing)
        )
        .cornerRadius(16)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
