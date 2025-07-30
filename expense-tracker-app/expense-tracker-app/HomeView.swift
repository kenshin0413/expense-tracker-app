//
//  TabView.swift
//  expense-tracker-app
//
//  Created by miyamotokenshin on R 7/07/16.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = ExpenseViewModel()
    @State var selection = 1
    var body: some View {
        TabView(selection: $selection) {
            InputView(viewModel: viewModel)
                .tabItem {
                    Label("入力", systemImage: "plus.circle")
                }
                .tag(1)

            ListView(viewModel: viewModel)
                .tabItem {
                    Label("一覧", systemImage: "list.bullet")
                }
                .tag(2)

            StatisticsView()
                .tabItem {
                    Label("統計", systemImage: "chart.bar")
                }
                .tag(3)
        }
    }
}

#Preview {
    HomeView()
}

