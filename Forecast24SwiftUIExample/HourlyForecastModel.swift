//
//  HourlyForecastModel.swift
//  Forecast24SwiftUIExample
//
//  Created by Hoye Lam on 10/09/2022.
//

import Foundation

struct HourlyForecastModel {
    let headline: String
    let forecasts: [HourForecast]
    
    static private var staticRandomHeadlines = [
        "Lower temperatures expected tomorrow, with a high of 16°.",
        "Higher temperatures expected today, with a high of 20°",
    ]
    
    static func makeRandom() -> HourlyForecastModel {
        let randomHourForecasts = (0...24).map { HourForecast.makeRandom(
            hour: Calendar.current.component(
                .hour,
                from: Calendar.current.date(
                    byAdding: .hour,
                    value: $0,
                    to: Date()
                )!
            ))
        }
        
        return HourlyForecastModel(
            headline: self.staticRandomHeadlines.randomElement()!,
            forecasts: randomHourForecasts
        )
    }
}

struct HourForecast {
    let hour: Int
    let celsius: Int
    let weatherType: WeatherType
    
    static func makeRandom(hour: Int) -> HourForecast {
        .init(
            hour: hour,
            celsius: Int.random(in: -10...20),
            weatherType: WeatherType.allCases.randomElement()!
        )
    }
}

extension HourForecast: Hashable { }

enum WeatherType {
    case sunny
    case cloud
    case rain
    case snow
    case hail
    case lightning
    
    var systemNameIcon: String {
        switch self {
        case .sunny:
            return "sun.min.fill"
        case .cloud:
            return "cloud.fill"
        case .rain:
            return "cloud.rain.fill"
        case .snow:
            return "cloud.sleet.fill"
        case .hail:
            return "cloud.hail.fill"
        case .lightning:
            return "cloud.bolt.fill"
        }
    }
}

extension WeatherType: CaseIterable { }
