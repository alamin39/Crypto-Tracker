//
//  PortfolioView.swift
//  Crypto
//
//  Created by Al-Amin on 2023/02/28.
//

import SwiftUI

struct PortfolioView: View {
   
    @EnvironmentObject private var vm: HomeViewModel
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 0) {
                    SearchBarView(searchText: $vm.searchText)
                    
                    ScrollView(.horizontal,showsIndicators: true) {
                        LazyHStack(spacing: 10) {
                            ForEach(vm.allCoins) { coin in
                                Text(coin.symbol.uppercased())
                            }
                        }

                    }
                }
            }
            .navigationTitle("Edit Portfolio")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    XMarkButton(dismiss: _dismiss)
                }
            }
        }
    }
}

struct PortfolioView_Previews: PreviewProvider {
    static var previews: some View {
        PortfolioView()
            .environmentObject(dev.homeVM)
    }
}
