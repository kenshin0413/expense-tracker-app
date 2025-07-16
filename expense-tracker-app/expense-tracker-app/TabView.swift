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
    @State var isActive = false
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
                    isActive.toggle()
                } label: {
                    Image(systemName: "plus.circle")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .font(.system(size: 40))
                    // 三項演算子　条件式 ? 真の値 : 偽の値
                        .foregroundColor(selectedView == .input ? .blue : .gray)
                }
                
                Button {
                    selectedView = .list
                    isActive.toggle()
                } label: {
                    Image(systemName: "list.bullet")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .foregroundColor(selectedView == .list ? .blue : .gray)
                }
                
                Button {
                    selectedView = .statistics
                    isActive.toggle()
                } label: {
                    Image(systemName: "chart.bar")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .foregroundColor(selectedView == .statistics ? .blue : .gray)
                }
            }
            
            HStack(spacing: 100) {
                Text("入力")
                Text("一覧")
                Text("統計")
            }
        }
    }
}

#Preview {
    TabView()
}

