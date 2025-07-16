//
//  TabView.swift
//  expense-tracker-app
//
//  Created by miyamotokenshin on R 7/07/16.
//

import SwiftUI

struct TabView: View {
    enum SelectedView {
        case input, list, statistics, none
    }
    @State var selectedView: SelectedView = .none
    var body: some View {
        VStack {
            Spacer()
            // 表示するビューの切り替え
            switch selectedView {
            case .input:
                InputView()
            case .list:
                ListView()
            case .statistics:
                StatisticsView()
            case .none:
                EmptyView()
            }
            
            Spacer()
            HStack(spacing: 100) {
                Button {
                    selectedView = .input
                } label: {
                    Image(systemName: "plus.circle")
                        .resizable()
                        .frame(width: 30, height: 30)
                }

                Button {
                    selectedView = .list
                } label: {
                    Image(systemName: "list.bullet")
                        .resizable()
                        .frame(width: 30, height: 30)
                }

                Button {
                    selectedView = .statistics
                } label: {
                    Image(systemName: "chart.bar")
                        .resizable()
                        .frame(width: 30, height: 30)
                }
            }
            .padding(.bottom)
        }
    }
}

#Preview {
    TabView()
}

