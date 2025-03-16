//
//  StocksAppIntents.swift
//  StocksAppIntents
//
//  Created by Takasur Azeem on 3/17/25.
//

import Foundation
import AppIntents
import WidgetKit

struct SelectStockIntent: AppIntent, WidgetConfigurationIntent {
    static var title: LocalizedStringResource { "Select Symbol" }
    static var description = IntentDescription("Selects the symbol to display stocks information for it.")

    @Parameter(title: "Selected Symbol")
    var symbol: StockSymbol?
    
    init(symbol: StockSymbol) {
        self.symbol = symbol
    }

    init() {

    }
    
    func perform() async throws -> some IntentResult {
        return .result()
    }
}


