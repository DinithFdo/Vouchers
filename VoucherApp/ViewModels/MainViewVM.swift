//
//  MainViewVM.swift
//  VoucherApp
//
//  Created by Dinith Fernando on 2024-11-26.
//

import Foundation

class MainViewVM : ObservableObject{
    
    @Published var vouchers:[VoucherDetails] = []
    
    func addANewVoucher(title:String, notes:String, amount:Double) -> String{
        var result = ""
        
        if(title.isEmpty || notes.isEmpty){
            result = "Error:Please check your data"
        }else{
            let newVoucher = VoucherDetails(title: title, notes: notes, amount: amount)
            vouchers.append(newVoucher)
            result = "Voucher added successfully"
        }
        
        return result
    }
    
}
