//
//  Provider.swift
//  StocksApp
//
//  Created by Takasur Azeem on 3/15/25.
//

import WidgetKit

struct TimelineProvider: AppIntentTimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), configuration: SelectStockIntent(), stockData: nil)
    }
    
    func snapshot(for configuration: SelectStockIntent, in context: Context) async -> SimpleEntry {
        await createTimelineEntry(date: Date(), configuration: configuration)
    }
    
    func timeline(for configuration: SelectStockIntent, in context: Context) async -> Timeline<SimpleEntry> {
        await createTimeLine(configuration: configuration)
    }
    
    func createTimelineEntry(date: Date, configuration: SelectStockIntent) async -> SimpleEntry {
        let symbol = configuration.symbol ?? .sample
        let stockData = await StockService.getMockStockData(for: symbol.id)
        let entry = SimpleEntry(date: date, configuration: configuration, stockData: stockData)
        return entry
    }
    
    func createTimeLine(date: Date = Date(), configuration: SelectStockIntent) async -> Timeline<SimpleEntry> {
        let symbol = configuration.symbol ?? .sample
        let stockData = await StockService.getMockStockData(for: symbol.id)
        let entry = SimpleEntry(date: date, configuration: configuration, stockData: stockData)
        let timeline = Timeline(entries: [entry], policy: .atEnd)
        return timeline
    }
    
    func recommendations() -> [AppIntentRecommendation<SelectStockIntent>] {
        []
    }
    //    func relevances() async -> WidgetRelevances<ConfigurationAppIntent> {
    //        // Generate a list containing the contexts this widget is relevant in.
    //    }
}
