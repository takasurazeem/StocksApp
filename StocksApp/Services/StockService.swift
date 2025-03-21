//
//  StockService.swift
//  StocksApp
//
//  Created by florian schweizer on 18.05.21.
//

import Foundation
import Combine

struct StockService {
    static func getStockData(for symbol: String) -> AnyPublisher<StockData, Error> {
        let url = URL(string: "https://www.alphavantage.co/query?function=TIME_SERIES_INTRADAY&symbol=\(symbol)&interval=5min&apikey=\(APIKEY)")!
        
        return URLSession.shared
            .dataTaskPublisher(for: url)
            .tryMap { element -> Data in
                guard let httpResponse = element.response as? HTTPURLResponse,
                      httpResponse.statusCode == 200 else {
                    throw URLError(.badServerResponse)
                }
                
                return element.data
            }
            .decode(type: StockData.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
    
    static func getStockData(for symbol: String) async -> StockData? {
        let url = URL(string: "https://www.alphavantage.co/query?function=TIME_SERIES_INTRADAY&symbol=\(symbol)&interval=5min&apikey=\(APIKEY)")!
        
        let data = try? Data(contentsOf: url)
        
        if let data = data {
            return try? JSONDecoder().decode(StockData.self, from: data)
        }

        return nil
    }
    
    static func getMockStockData(for symbol: String) async -> StockData? {
        return .sample
    }
    
    static func getMockStockData(for symbol: String? = nil) -> StockData? {
        // Read SockData.json and decode it into ``StockData`` object.
        let jsonURL = Bundle.main.url(forResource: "SockData", withExtension: "json")!
        let jsonData = try! Data(contentsOf: jsonURL)
        return try? JSONDecoder().decode(StockData.self, from: jsonData)
    }
}
