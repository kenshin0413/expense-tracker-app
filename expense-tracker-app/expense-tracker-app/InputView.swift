//
//  Input.swift
//  expense-tracker-app
//
//  Created by miyamotokenshin on R 7/07/16.
//

import SwiftUI

struct InputView: View {
    @StateObject private var viewModel = ExpenseViewModel()
    @State private var expenseType: ExpenseType = .expense
    @State private var amount: String = ""
    @State private var selectIncomeCategory: IncomeCategory? = nil
    @State private var selectExpenseCategory: ExpenseCategory? = nil
    @State private var date: Date = Date()
    @State private var showAlert = false
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
                                Text(type.rawValue).tag(type as IncomeCategory?)
                            }
                        }
                        .pickerStyle(.menu)
                    } else {
                        Picker("カテゴリ", selection: $selectExpenseCategory) {
                            ForEach(ExpenseCategory.allCases, id: \.self) { type in
                                Text(type.rawValue).tag(type as ExpenseCategory?)
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
                    Button("保存") {
                        let doubleAmount = Double(amount) ?? 0
                        viewModel.addExpense(
                            amount: doubleAmount,
                            type: expenseType == .income ? .income : .expense,
                            incomeCategory: selectIncomeCategory,
                            expenseCategory: selectExpenseCategory,
                            date: date
                        )
                        amount = ""
                        showAlert = true
                    }
                    .disabled(
                        //文字列を数値に変換 失敗したら0にする
                        Double(amount) ?? 0 <= 0 ||
                        //収入が選ばれていて、かつ収入カテゴリが選択されていない または
                        (expenseType == .income && selectIncomeCategory == nil) ||
                        //支出が選ばれていて、かつ支出カテゴリが選択されていない
                        (expenseType == .expense && selectExpenseCategory == nil)
                    )
                }
            }
            .navigationTitle("収支入力画面")
        }
        .alert("通知", isPresented: $showAlert) {
            
        } message: {
            Text("保存しました")
        }
    }
}

#Preview {
    InputView()
}

