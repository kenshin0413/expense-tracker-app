//
//  ListView.swift
//  expense-tracker-app
//
//  Created by miyamotokenshin on R 7/07/16.
//

import SwiftUI

struct ListView: View {
    @ObservedObject var viewModel: ExpenseViewModel
    var body: some View {
        NavigationStack {
            if viewModel.expenses.isEmpty {
                VStack {
                    Text("まだデータがありません")
                        .font(.title2)
                }
                .navigationTitle("一覧画面")
            } else {
                List(viewModel.expenses, id: \.id) { expense in
                    LabeledContent {
                        Text("¥\(Int(expense.amount))")
                    } label: {
                        HStack {
                            Image(systemName: expense.type == .income ? "plus.circle.fill" : "minus.circle.fill")
                                .foregroundColor(expense.type == .income ? .green : .red)
                            Text(categoryText(for: expense))
                                .foregroundColor(.primary)
                        }
                    }
                }
                .navigationTitle("一覧画面")
            }
        }
    }
    
    private func categoryText(for expense: Expense) -> String {
        switch expense.type {
        case .income:
            if let category = expense.incomeCategory {
                return category.rawValue
            }
        case .expense:
            if let category = expense.expenseCategory {
                return category.rawValue
            }
        }
        return "未分類"
    }
}

#Preview {
    ListView(viewModel: ExpenseViewModel())
}
