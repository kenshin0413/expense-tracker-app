//
//  Input.swift
//  expense-tracker-app
//
//  Created by miyamotokenshin on R 7/07/16.
//

import SwiftUI

struct InputView: View {
    var body: some View {
        NavigationStack {
            Form {
                Text("収支入力画面")
            }
            .navigationTitle("収支入力画面")
        }
    }
}

#Preview {
    InputView()
}
