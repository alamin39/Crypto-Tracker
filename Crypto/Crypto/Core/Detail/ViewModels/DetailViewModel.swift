//
//  DetailViewModel.swift
//  Crypto
//
//  Created by Al-Amin on 2023/03/08.
//

import Foundation
import Combine

class DetailViewModel: ObservableObject {
    
    private let coinDetailService: CoinDetailDataService
    private var cancellables = Set<AnyCancellable>()
    
    init(coin: CoinModel) {
        coinDetailService = CoinDetailDataService(coin: coin)
        addSubscriber()
    }
    
    private func addSubscriber() {
        coinDetailService.$coinDetails
            .sink { returnedCoinDetails in
                print("Received coin detail data \(returnedCoinDetails)")
            }
            .store(in: &cancellables)
    }
}
