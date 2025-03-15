//
//  AppIntent.swift
//  StocksWidget
//
//  Created by Takasur Azeem on 3/15/25.
//

import WidgetKit
import AppIntents

struct ConfigurationAppIntent: WidgetConfigurationIntent {
    static var title: LocalizedStringResource { "Configuration" }
    static var description: IntentDescription { "This is an example widget." }

   @Parameter(title: "symbol", default: "IBM")
    var symbol: String
}
