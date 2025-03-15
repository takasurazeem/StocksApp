//
//  StocksWidgetEntryView.swift
//  StocksApp
//
//  Created by Takasur Azeem on 3/15/25.
//

import SwiftUI
import WidgetKit

struct StocksWidgetEntryView : View {
    var entry: Provider.Entry

    var body: some View {
        VStack {
            Text("Symbol:")
            Text(entry.configuration.symbol)
        }
    }
}


#Preview(as: .systemSmall) {
    StocksWidget()
} timeline: {
    SimpleEntry(date: .now, configuration: .ibm)
    SimpleEntry(date: .now, configuration: .aapl)
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
