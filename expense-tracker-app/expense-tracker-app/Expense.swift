//
//  Expense.swift
//  expense-tracker-app
//
//  Created by miyamotokenshin on R 7/07/24.
//

import SwiftUI

struct Expense: Identifiable {
    var id: UUID = UUID()
    var amount: Double
    var incomeCategory: IncomeCategory?
    var expenseCategory: ExpenseCategory?
    var date: Date
    var type: ExpenseType
}

enum IncomeCategory: String, CaseIterable {
    case pay = "給与"
    case subjob = "副業"
    case investment = "投資"
    case other = "その他"
}

enum ExpenseCategory: String, CaseIterable {
    case food = "食費"
    case travel = "交通費"
    case amusement = "娯楽"
    case lightheat = "光熱費"
    case medical = "医療費"
    case other = "その他"
}

enum ExpenseType: String, CaseIterable {
    case income = "収入"
    case expense = "支出"
}

