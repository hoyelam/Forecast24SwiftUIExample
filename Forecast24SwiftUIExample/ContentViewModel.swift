//
//  ContentViewModel.swift
//  Forecast24SwiftUIExample
//
//  Created by Hoye Lam on 11/09/2022.
//

import Foundation

protocol ForecastProviding {
    func getHourlyForecastData() -> HourlyForecastModel
}

final class MockForecastProvider: ForecastProviding {
    func getHourlyForecastData() -> HourlyForecastModel {
        return .makeRandom()
    }
}

@MainActor
final class ContentViewModel: ObservableObject {
    @Published var data: HourlyForecastModel
    
    private let forecastProvider: ForecastProviding
    
    init(forecastProvider: ForecastProviding = MockForecastProvider()) {
        self.forecastProvider = forecastProvider
        self.data = self.forecastProvider.getHourlyForecastData()
    }
}
