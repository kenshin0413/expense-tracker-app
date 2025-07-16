//
//  ContentView.swift
//  expense-tracker-app
//
//  Created by miyamotokenshin on R 7/07/16.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

enum ExpenseType {
    case income, expense
}

struct Expense: Identifiable {
    var id: UUID
    var amount: Double
    var category: String
    var date: Date
    var type: ExpenseType
}

class ExpenseViewModel: ObservableObject {
    @Published var expenses: [Expense] = []
}

#Preview {
    ContentView()
}
