//
//  Provider.swift
//  StocksApp
//
//  Created by Takasur Azeem on 3/15/25.
//

import WidgetKit

struct TimelineProvider: AppIntentTimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), configuration: ConfigurationAppIntent(), stockData: nil)
    }
    
    func snapshot(for configuration: ConfigurationAppIntent, in context: Context) async -> SimpleEntry {
        await createTimelineEntry(date: Date(), configuration: configuration)
    }
    
    func timeline(for configuration: ConfigurationAppIntent, in context: Context) async -> Timeline<SimpleEntry> {
        await createTimeLine(configuration: configuration)
    }
    
    func createTimelineEntry(date: Date, configuration: ConfigurationAppIntent) async -> SimpleEntry {
        let stockData = await StockService.getStockData(for: configuration.symbol)
        let entry = SimpleEntry(date: date, configuration: configuration, stockData: stockData)
        return entry
    }
    
    func createTimeLine(date: Date = Date(), configuration: ConfigurationAppIntent) async -> Timeline<SimpleEntry> {
        let stockData = await StockService.getStockData(for: configuration.symbol)
        let entry = SimpleEntry(date: date, configuration: configuration, stockData: stockData)
        let timeline = Timeline(entries: [entry], policy: .atEnd)
        return timeline
    }
    
    
    //    func relevances() async -> WidgetRelevances<ConfigurationAppIntent> {
    //        // Generate a list containing the contexts this widget is relevant in.
    //    }
}
