//
//  Splash Screen.swift
//  serviceapp
//
//  Created by Kyna Rochlani on 03/10/2022.
//

import SwiftUI

struct Splash_Screen: View {
    
    @State private var isActive = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    @StateObject var transactionListVM = TransactionListViewModel()
    
    
    var body: some View {
        
        if isActive {
            ContentView()
                .environmentObject(transactionListVM)
        } else {
            ZStack {
                Color.green.opacity(0.3)
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    VStack {
                        Image("acs")
                            .resizable()
                            .frame(width: 150, height: 150)
                        Text("ACS SERVICE")
                            .font(Font.custom("Baskerville-Bold", size: 26))
                            .foregroundColor(.black.opacity(0.8))
                    }
                    .scaleEffect(size)
                    .opacity(opacity)
                    .onAppear {
                        withAnimation(.easeIn(duration: 1.5)) {
                            self.size = 1
                            self.opacity = 1.0
                        }
                    }
                }
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.9) {
                        self.isActive = true
                    }
                }
                
            }
            
            
        }
        
        }

}

struct Splash_Screen_Previews: PreviewProvider {
    static var previews: some View {
        Splash_Screen()
    }
}
