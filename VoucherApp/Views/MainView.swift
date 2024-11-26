//
//  ContentView.swift
//  VoucherApp
//
//  Created by Dinith Fernando on 2024-11-26.
//

import SwiftUI

struct MainView: View {
    
    @State var isVivid: Bool = true
    @State var viewForm: Bool = false
    
    @StateObject var mainViewVM = MainViewVM()
    
    var body: some View {

        VStack(alignment:.leading,spacing: 10){
            
            HStack{
                Text("Vouchers")
                    .font(.system(size: 35))
                    .bold()
                Toggle("",isOn: $isVivid)
                
            }
            
            ScrollView{
                
                if(mainViewVM.vouchers.isEmpty){
                    HStack{
                        Spacer()
                        VStack{
                            
                            
                            Image(systemName:"square.and.arrow.down")
                                .font(.system(size: 50))
                                .opacity(0.3)
                            
                            Text("No Vouchers Found")
                                .bold()
                                .font(.title2)
                                .padding(.top)
                            
                            Text("Add your first voucher today!")
                                .font(.subheadline)
                                .opacity(0.3)
                            
                        }
                        Spacer()
                    }
                    .padding(.vertical,200)
                }
                
                
                ForEach(mainViewVM.vouchers){ voucher in
                    VoucherView(voucherDetails: voucher, vivid: $isVivid)
                        .padding(.vertical,8)
                }
            }
            .padding(.top,40)
            
            Spacer()
            
            HStack{
                Spacer()
                
                Button(action:{
                    viewForm.toggle()
                }){
                    Image(systemName:"plus")
                        .foregroundColor(.white)
                        .font(.system(size: 30))
                        .frame(width:55,height:55)
                        .background(.blue)
                        .clipShape(Circle())
                        .padding(.trailing,30)
                }
                .sheet(isPresented: $viewForm) {
                    VoucherForm(mainViewVM: mainViewVM)
                }
            }
        }
        .padding()
    }
}

//#Preview {
//    
//    var mainViewVM = MainViewVM()
//    var voucher = VoucherDetails(title:"Farewell Gift Card",notes:"Saying goodbye is hard, but it's even harder when you have someone to say goodbye to.",amount: 10000)
//    
//    mainViewVM.vouchers.append(voucher)
//    
//    MainView(mainViewVM: mainViewVM)
//}

#Preview {
    // Helper function to initialize the view model
    var mainViewVM: MainViewVM {
        let viewModel = MainViewVM()
        let voucher = VoucherDetails(
            title: "Farewell Gift Card",
            notes: "Saying goodbye is hard, but it's even harder when you have someone to say goodbye to.",
            amount: 10000
        )
        viewModel.vouchers.append(voucher)
        return viewModel
    }
    
    // Pass the initialized view model to the MainView
    return MainView(mainViewVM: mainViewVM)
}
