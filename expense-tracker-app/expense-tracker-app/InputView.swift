//
//  Input.swift
//  expense-tracker-app
//
//  Created by miyamotokenshin on R 7/07/16.
//

import SwiftUI

struct InputView: View {
    enum ExpenseType: String, CaseIterable {
        case income = "収入"
        case expense = "支出"
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
    @State private var expenseType: ExpenseType = .expense
    @State private var amount: String = ""
    @State private var selectIncomeCategory: IncomeCategory = .pay
    @State private var selectExpenseCategory: ExpenseCategory = .food
    @State private var date: Date = Date()
    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("収支種別")) {
                    Picker("", selection: $expenseType) {
                        ForEach(ExpenseType.allCases, id: \.self) { type in
                            Text(type.rawValue)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                Section(header: Text("金額")) {
                    TextField("金額を入力", text: $amount)
                        .keyboardType(.decimalPad)
                }
                
                Section(header: Text("カテゴリ")) {
                    if expenseType == .income {
                        Picker("カテゴリ", selection: $selectIncomeCategory) {
                            ForEach(IncomeCategory.allCases, id: \.self) { type in
                                Text(type.rawValue)
                            }
                        }
                        .pickerStyle(.menu)
                    } else {
                        Picker("カテゴリ", selection: $selectExpenseCategory) {
                            ForEach(ExpenseCategory.allCases, id: \.self) { type in
                                Text(type.rawValue)
                            }
                        }
                        .pickerStyle(.menu)
                    }
                }
                
                Section(header: Text("日付")) {
                    DatePicker("日付", selection: $date,
                               displayedComponents: [.date])
                }
                
                Section {
                    Button {
                        
                    } label: {
                        Text("保存")
                    }

                }
            }
            .navigationTitle("収支入力画面")
        }
    }
}

#Preview {
    InputView()
}

