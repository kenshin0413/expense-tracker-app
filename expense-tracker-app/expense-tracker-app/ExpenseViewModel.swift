//
//  ExpenseViewModel.swift
//  expense-tracker-app
//
//  Created by miyamotokenshin on R 7/07/24.
//

import SwiftUI

class ExpenseViewModel: ObservableObject {
    
    @Published var expenses: [Expense] = []

    func addExpense(
        amount: Double,
        type: ExpenseType,
        incomeCategory: IncomeCategory? = nil,
        expenseCategory: ExpenseCategory? = nil,
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

