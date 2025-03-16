//
//  StocksWidget.swift
//  StocksWidget
//
//  Created by Takasur Azeem on 3/15/25.
//

import WidgetKit
import SwiftUI

struct StocksWidget: Widget {
    let kind: String = "StocksWidget"

    var body: some WidgetConfiguration {
        AppIntentConfiguration(
            kind: kind,
            intent: SelectStockIntent.self,
            provider: TimelineProvider()
        ) { entry in
            StocksWidgetEntryView(entry: entry)
                .containerBackground(.fill.tertiary, for: .widget)
        }
        .configurationDisplayName("Stocks Symbols")
        .description("Displays stocks information for a selected symbol")
    }
}
