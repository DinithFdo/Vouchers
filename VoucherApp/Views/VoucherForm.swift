//
//  VoucherForm.swift
//  VoucherApp
//
//  Created by Dinith Fernando on 2024-11-26.
//

import SwiftUI

enum VoucherValue:Double,CaseIterable {
    case thousand = 1000
    case twoThousand = 2000
    case twoThousandFiveHundred = 2500
    case fiveThousand = 5000
    case tenThousand = 10000
    
    var displayName:String{
        "$ \(Int(rawValue))"
    }
}

struct VoucherForm: View {
    
    @State var title: String = ""
    @State var notes: String = ""
    @State var amount: VoucherValue = .thousand
    
    @State var isError:Bool = false
    
    @ObservedObject var mainViewVM: MainViewVM
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationStack{
            Form{
                Section{
                    TextField("Title", text: $title)
                    TextField("Notes", text:$notes)
                }
                
                Section{
                    Picker("Amount", selection: $amount) {
                        ForEach(VoucherValue.allCases, id: \.self) { value in
                            Text(value.displayName).tag(value)
                        }
                    }
                    .pickerStyle(.navigationLink)
                }
            }
            .toolbar{
                ToolbarItem(placement: .topBarLeading) {
                    Button("Discard"){
                        dismiss()
                    }
                    .foregroundColor(.red)
                }
                ToolbarItem(placement: .principal) {
                    Text("Add Item")
                        .bold()
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Save"){
                        let result = mainViewVM.addANewVoucher(title: title, notes: notes, amount: amount.rawValue)
                        
                        if(result.starts(with: "Error")){
                            isError.toggle()
                        }else{
                            dismiss()
                        }
                    }
                    .alert("Error", isPresented: $isError) {
                        Button("Try Again", role: .cancel) { }
                    } message:{
                        Text("Please check your data")
                    }
                }
            }
        }
    }
}

#Preview {
    VoucherForm(mainViewVM: MainViewVM())
}
