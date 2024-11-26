//
//  VoucherView.swift
//  VoucherApp
//
//  Created by Dinith Fernando on 2024-11-26.
//

import SwiftUI

enum VoucherColor {
    case amount(Double)
    
    var color: Color {
        switch self {
        case .amount(1000): return .cyan
        case .amount(2000): return .indigo
        case .amount(2500): return .mint
        case .amount(5000): return .teal
        case .amount(10000): return .pink
        default : return .gray
        }
    }
}

enum Opacity {
    case vivid(Bool)
    
    var opacity: Double {
        switch self{
        case .vivid(true): return 1
        case .vivid(false): return 0.3
        }
    }
}

struct VoucherView: View {
    
    @State var voucherDetails: VoucherDetails;
    @Binding var vivid: Bool
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 5) {
                HStack{
                    Text(voucherDetails.title)
                        .font(.headline)
                        .foregroundColor(vivid ? .white:.black)
                    Spacer()
                    Text("$ \(voucherDetails.amount, specifier:"%.2f")")
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(vivid ? .white:.black)
                }
                
                Text(voucherDetails.notes)
                    .font(.subheadline)
                    .foregroundColor(vivid ? .white:.black .opacity(0.7))
                    .padding(.top)
            }
            Spacer()
            
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(VoucherColor.amount(voucherDetails.amount).color)
                .opacity(
                    vivid ? 1 : 0.3
                )
        )
        .padding(.horizontal)
    }
}

#Preview {
    let voucher = VoucherDetails(title:"Farewell Gift Card",notes:"Saying goodbye is hard, but it's even harder when you have someone to say goodbye to.",amount: 10000)
    
    VoucherView(voucherDetails: voucher,vivid: .constant(true))
}
