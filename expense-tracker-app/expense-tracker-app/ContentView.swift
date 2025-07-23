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

enum ExpenseType: String, CaseIterable {
    case income = "収入"
    case expense = "支出"
}

struct Expense: Identifiable {
    var id: UUID = UUID()
    var amount: Double
    var incomeCategory: String?
    var expenseCategory: String?
    var date: Date
    var type: ExpenseType
}

class ExpenseViewModel: ObservableObject {
    @Published var expenses: [Expense] = []

    func addExpense(
        amount: Double,
        type: ExpenseType,
        incomeCategory: String?,
        expenseCategory: String?,
        date: Date
    ) {
        let newExpense = Expense(
            id: UUID(),
            amount: amount,
            incomeCategory: incomeCategory,
            expenseCategory: expenseCategory,
            date: date,
            type: type
        )
        expenses.append(newExpense)
    }
}

#Preview {
    ContentView()
}
