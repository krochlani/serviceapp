//
//  addActivity.swift
//  serviceapp
//
//  Created by Kyna Rochlani on 03/10/2022.
//

import SwiftUI

struct addActivity: View {
    @State var choiceMade = "Credit"
    @State var choiceMade2 = "Fundraiser"
    @State private var eventName = ""
    @State private var dateDay = Date()
    @State private var money = ""

    var body: some View {
        NavigationView {
            Form {
                
                Section(header: Text("Basic Information"))
                {
                    TextField("Activity Name", text: $eventName)
                    DatePicker("Date of Activity", selection: $dateDay, displayedComponents: .date)
                }
                
                Section(header: Text("Credit or Debit"))
                {
                    Menu {
                        Button(action: {
                            choiceMade = "Credit"
                        }, label: {
                            Text("Credit")
                        })
                        Button(action: {
                            choiceMade = "Debit"
                        }, label: {
                            Text("Debit")
                        })
                    } label: {
                        Label(
                            title: {Text("\(choiceMade)")},
                            icon: {Image(systemName: "plus")}
                        )
                    }
                    
                    TextField("Amount of AED", text: $money)
                    
                    
                }
                
                Section(header: Text("Type of Event"))
                {
                    Menu {
                        Button(action: {
                            choiceMade2 = "Fundraiser"
                        }, label: {
                            Text("Fundraiser")
                        })
                        Button(action: {
                            choiceMade2 = "Donation"
                        }, label: {
                            Text("Donation")
                        })
                        Button(action: {
                            choiceMade2 = "Expense"
                        }, label: {
                            Text("Expense")
                        })
                    } label: {
                        Label(
                            title: {Text("\(choiceMade2)")},
                            icon: {Image(systemName: "plus")}
                        )
                    }
                }
                
                Button(action: {
                        //print("sign up bin tapped")
                        ContentView()
                    }) {
                        Text("Save")
                            .bold()
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .font(.system(size: 15))
                            .padding()
                            .foregroundColor(Color.green)
                            .overlay(
                                RoundedRectangle(cornerRadius: 25)
                                    .stroke(Color.white, lineWidth: 2)
                        )
                    }
                
            }
            
            
            .navigationTitle("New Activity")
            .foregroundColor(Color.green)
            
            
        }
        
        
        
        
    }
    
}

struct addActivity_Previews: PreviewProvider {
    static var previews: some View {
        addActivity()
    }
}
