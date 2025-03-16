//
//  StockSymbol.swift
//  StocksApp
//
//  Created by Takasur Azeem on 3/16/25.
//

import Foundation
import AppIntents

struct StockSymbol: AppEntity {
    let id: String
    let displayName: String
    
    static var typeDisplayRepresentation: TypeDisplayRepresentation = "Stock Symbol"
    static var defaultQuery = SymbolQuery()
    
    var displayRepresentation: DisplayRepresentation {
        DisplayRepresentation(title: "\(id) - \(displayName)")
    }
    
    static var allSymbols: [StockSymbol] {
        [
            StockSymbol(id: "AAPL", displayName: "Apple Inc."),
            StockSymbol(id: "NVDA", displayName: "Nvidia"),
            StockSymbol(id: "FB", displayName: "Facebook"),
            StockSymbol(id: "IBM", displayName: "International Business Machine"),
        ]
    }
    
    static var sample: StockSymbol {
        StockSymbol(id: "AAPL", displayName: "Apple Inc.")
    }
}

struct SymbolQuery: DynamicOptionsProvider, EntityQuery {
    func entities(for identifiers: [String]) async throws -> [StockSymbol] {
        StockSymbol.allSymbols.filter { identifiers.contains($0.id) }
    }

    func suggestedEntities() async throws -> [StockSymbol] {
        StockSymbol.allSymbols
    }
    
    func defaultResult() async -> StockSymbol? {
        try? await suggestedEntities().first
    }
}
