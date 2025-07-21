//
//  ListView.swift
//  expense-tracker-app
//
//  Created by miyamotokenshin on R 7/07/16.
//

import SwiftUI

struct ListView: View {
    var body: some View {
        NavigationStack {
            List {
                Text("一覧画面")
            }
            .navigationTitle("一覧画面")
        }
    }
}

#Preview {
    ListView()
}
