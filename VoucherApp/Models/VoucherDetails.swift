//
//  Voucher.swift
//  VoucherApp
//
//  Created by Dinith Fernando on 2024-11-26.
//

import Foundation


struct VoucherDetails: Identifiable {
    
    let id: UUID = UUID()
    let title:String
    let notes:String
    let amount: Double
    
    init(title:String, notes:String, amount: Double) {
        self.title = title
        self.notes = notes
        self.amount = amount
    }
}

