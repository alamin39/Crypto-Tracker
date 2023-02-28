//
//  HomeViewModel.swift
//  Crypto
//
//  Created by Al-Amin on 2023/02/25.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    
    @Published var statistics: [StatisticModel] = []
    @Published var allCoins: [CoinModel] = []
    @Published var portfolioCoins: [CoinModel] = []
    @Published var searchText: String = ""
    
    private var coinDataService = CoinDataService()
    private var marketDataService = MarketDataService()
    private var cancellables = Set<AnyCancellable>()
    
    init() {
       addSubscriber()
    }
    
    private func addSubscriber() {
        //update all coins
        $searchText
            .combineLatest(coinDataService.$allCoins)
            .debounce(for: 0.5, scheduler: DispatchQueue.main)
            .map(filterCoins)
            .sink(receiveValue: { [weak self] returnedCoins in
                self?.allCoins = returnedCoins
            })
            .store(in: &cancellables)
        
        // updates marketDAta
        marketDataService.$marketData
            .map(mapGlobalMarketData)
            .sink { [weak self] returnedStats in
                self?.statistics = returnedStats
            }
            .store(in: &cancellables)
    }
    
    private func filterCoins(text: String, coins: [CoinModel]) -> [CoinModel] {
        guard !text.isEmpty else { return coins }
        
        let lowerCasedText = text.lowercased()
        
        return coins.filter { coin in
            return coin.id.lowercased().contains(lowerCasedText) ||
            coin.name.lowercased().contains(lowerCasedText) ||
            coin.symbol.lowercased().contains(lowerCasedText)
        }
    }
    
    private func mapGlobalMarketData(marketData: MarketData?) -> [StatisticModel] {
        var stats = [StatisticModel]()
        guard let data = marketData else {
            return stats
        }
        
        let marketCap = StatisticModel(title: "Market Cap", value: data.marketCap, percentageChange: data.marketCapChangePercentage24HUsd)
        let volume = StatisticModel(title: "24h Volume", value: data.volume)
        let btcDominance = StatisticModel(title: "BTC Dominance", value: data.btcDominance)
        let portfolio = StatisticModel(title: "Portfolio Value", value: "$0.00", percentageChange: 0)
        
        stats.append(contentsOf: [
            marketCap,
            volume,
            btcDominance,
            portfolio
        ])
        return stats
    }
}