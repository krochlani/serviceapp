//
//  ContentView.swift
//  serviceapp
//
//  Created by Kyna Rochlani on 03/10/2022.
//

import SwiftUICharts
import SwiftUI


struct ContentView: View {
    @EnvironmentObject var transactionListVM: TransactionListViewModel
    
    var body: some View {
        NavigationView {
            ScrollView {
                
                Text("American Community School Of Abu Dhabi")
                    .bold()
                    .frame(height: 2)
                    .position(x: 184, y: 20)
                
                HStack(alignment: .center, spacing: 230) {

                    Text("Welcome to")
                        .frame(width: 100, height: 2, alignment: .trailing)
                        .position(x: 55, y: 50)
                    
                    Image("acs")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .position(x: 35, y: 60)
                       
                }
                
                
                    
                VStack(alignment: .leading, spacing: 24) {
                    
                    // Title
                    Text("Circle Of Life")
                        .font(.title2)
                        .bold()
                    
                    // chart
                    let data = transactionListVM.accumulateTransactions()
                    
                    if !data.isEmpty {
                        let totalExpenses = data.last?.1 ?? 0
                        
                        CardView {
                            VStack(alignment: .leading) {
                                ChartLabel(totalExpenses.formatted(.currency(code: "AED")), type: .title, format: "AED%.02f")
                                LineChart()
                                    
                            }
                            .background(Color.systemBackground)
                        }
                        .data(data)
                        .chartStyle(ChartStyle(backgroundColor: Color.systemBackground, foregroundColor: ColorGradient(Color.green.opacity(0.4), Color.green)))
                        .frame(height: 300)
                        
                        NavigationLink{
                            addActivity()
                        }label:{
                            Text("+ New Activity")
                                .bold()
                                .frame(minWidth: 0, maxWidth: .infinity)
                                .font(.system(size: 20))
                                .padding()
                                .foregroundColor(Color.systemBackground)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 25)
                                        .stroke(Color.systemBackground, lineWidth: 3)
                            )
                        }
                        
                        
                        
                        /*
                        Button(action: {
                            addActivity()
                         
                                  
                        }, label: {
                                Text("+ New Activity")
                                    .bold()
                                    .frame(minWidth: 0, maxWidth: .infinity)
                                    .font(.system(size: 20))
                                    .padding()
                                    .foregroundColor(Color.systemBackground)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 25)
                                            .stroke(Color.systemBackground, lineWidth: 3)
                                )
                            })*/
                                  
                    }
                                  
                    // Transaction List
                    RecentTransactionList()
                    
                    
                    
                    
                    
                }
                .padding()
                .frame(maxWidth: .infinity)
                
                
            }
            .background(Color.green.opacity(0.3))
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                // Bell
                ToolbarItem {
                    Image(systemName: "bell.badge")
                        .symbolRenderingMode(.palette)
                        .foregroundStyle(Color.green, .primary)
                
                }
            }
            
        }
        .navigationViewStyle(.stack)
        .accentColor(.green)
    
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static let transactionListVM: TransactionListViewModel = {
        let transactionListVM = TransactionListViewModel()
        transactionListVM.transactions = transactionListPreviewData
        return transactionListVM
    }()
    static var previews: some View {
        Group {
            ContentView()
            ContentView()
                .preferredColorScheme(.dark)
        }
        .environmentObject(transactionListVM)
    }
}

