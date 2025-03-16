//
//  SimpleEntry.swift
//  StocksApp
//
//  Created by Takasur Azeem on 3/15/25.
//

import WidgetKit

struct SimpleEntry: TimelineEntry {
    let date: Date
    let configuration: ConfigurationAppIntent
    
    let stockData: StockData?
}
