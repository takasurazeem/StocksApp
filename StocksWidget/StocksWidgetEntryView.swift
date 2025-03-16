//
//  StocksWidgetEntryView.swift
//  StocksApp
//
//  Created by Takasur Azeem on 3/15/25.
//

import SwiftUI
import WidgetKit

struct StocksWidgetEntryView : View {
    var entry: TimelineProvider.Entry

    var body: some View {
        VStack {
            HStack {
                Text("Symbol")
                Spacer()
                Text(entry.configuration.symbol)
            }
            if let stockData = entry.stockData {
                LineChart(values: stockData.closeValues)
                    .fill(
                        LinearGradient(
                            gradient: Gradient(
                                colors: [
                                    .green.opacity(0.7),
                                    .green.opacity(0.2),
                                    .green.opacity(0)
                                ]
                            ),
                            startPoint: .top,
                            endPoint: .bottom
                        )
                    )
                Text(entry.stockData?.latestClose ?? "")
            } else {
                Text("Failed to fetch data, check back later.")
            }
        }
    }
}


#Preview(as: .systemSmall) {
    StocksWidget()
} timeline: {
    SimpleEntry(
        date: .now,
        configuration: .ibm,
        stockData: .sample
    )
    SimpleEntry(
        date: .now,
        configuration: .aapl,
        stockData: .sample
    )
}


extension ConfigurationAppIntent {
    fileprivate static var ibm: ConfigurationAppIntent {
        let intent = ConfigurationAppIntent()
        intent.symbol = "IBM"
        return intent
    }
    
    fileprivate static var aapl: ConfigurationAppIntent {
        let intent = ConfigurationAppIntent()
        intent.symbol = "AAPL"
        return intent
    }
}
