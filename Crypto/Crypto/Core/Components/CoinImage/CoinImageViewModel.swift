//
//  CoinImageViewModel.swift
//  Crypto
//
//  Created by Al-Amin on 2023/02/26.
//

import Foundation
import SwiftUI
import Combine

class CoinImageViewModel: ObservableObject {
    
    @Published var image: UIImage? = nil
    @Published var isLoading: Bool = false
    
    private let coinImageService: CoinImageService
    private let coin: CoinModel
    private var cancellables = Set<AnyCancellable>()
    
    init(coin: CoinModel) {
        self.coin = coin
        self.coinImageService = CoinImageService(coin: coin)
        self.isLoading = true
        self.addSubscriber()
    }
    
    private func addSubscriber() {
        coinImageService.$image
            .sink { [weak self] _ in
                self?.isLoading = false
            } receiveValue: { [weak self] image in
                self?.image = image
            }
            .store(in: &cancellables)

    }
}
