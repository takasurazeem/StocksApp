//
//  StockData.swift
//  StocksApp
//
//  Created by florian schweizer on 01.05.21.
//

import Foundation

struct StockData: Codable, Identifiable {
    struct MetaData: Codable {
        let information: String
        var symbol: String
        let lastRefreshed: String
        let interval: String
        let outputSize: String
        let timeZone: String
        
        private enum CodingKeys: String, CodingKey {
            case information = "1. Information"
            case symbol = "2. Symbol"
            case lastRefreshed = "3. Last Refreshed"
            case interval = "4. Interval"
            case outputSize = "5. Output Size"
            case timeZone = "6. Time Zone"
        }
    }
    
    struct StockDataEntry: Codable {
        let open: String
        let high: String
        let low: String
        let close: String
        let volume: String
        
        private enum CodingKeys: String, CodingKey {
            case open = "1. open"
            case high = "2. high"
            case low = "3. low"
            case close = "4. close"
            case volume = "5. volume"
        }
    }
    
    let id = UUID()
    
    var metaData: MetaData
    let timeSeries5min: [String: StockDataEntry]
    
    var latestClose: String {
        timeSeries5min.first?.value.close ?? "NaN"
    }
    
    var closeValues: [Double] {
        let rawValues = timeSeries5min.values.map { Double($0.close)! }
        let max = rawValues.max()!
        let min = rawValues.min()!
        
        return rawValues.map { ($0 - min * 0.95) / (max - min * 0.95) }
    }
    
    private enum CodingKeys: String, CodingKey {
        case metaData = "Meta Data"
        case timeSeries5min = "Time Series (5min)"
    }
    
    
    /// Since the free API has a rate limit of 25 API calls a day, let us use their
    /// sample data to our advantage and kick out the API usage and its limit for development
    static var sample: StockData {
        let url = URL(fileURLWithPath: #file)
            .deletingLastPathComponent()
            .appendingPathComponent("StockData.json")
        let data = try! Data(contentsOf: url)
        var stockData = try! JSONDecoder().decode(StockData.self, from: data)
        stockData.metaData.symbol = [
            "AAPL",
            "MSFT",
            "TSLA",
            "GOOGL",
            "AMZN",
            "FB",
            "NVDA",
            "IBM"
        ].randomElement() ?? "IBM"
        
        return stockData
    }
}
