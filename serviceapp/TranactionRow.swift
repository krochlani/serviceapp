//
//  TranactionRow.swift
//  serviceapp
//
//  Created by Kyna Rochlani on 03/10/2022.
//

import SwiftUI
import SwiftUIFontIcon

struct TranactionRow: View {
    var transaction: Transaction
    
    var body: some View {
        HStack(spacing: 20) {
            
            // Cateogry Icon
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .fill(Color.green.opacity(0.5))
                .frame(width: 44, height: 44)
                .overlay {
                    FontIcon.text(.awesome5Solid(code: transaction.icon), fontsize: 24, color: Color.white)
                }
            VStack(alignment: .leading, spacing: 6) {
                // Transaction Merchant
                Text(transaction.merchant)
                    .font(.subheadline)
                    .bold()
                    .lineLimit(1)
                
                // Transaction Cateogory
                Text(transaction.category)
                    .font(.footnote)
                    .opacity(0.7)
                    .lineLimit(1)
                
                // Transaction Date
                Text(transaction.dateParsed, format: .dateTime.year().month().day())
                    .font(.footnote)
                    .foregroundColor(.secondary)
                 
            }
            
            Spacer()
            
            // Transaction Amount
            Text(transaction.signedAmount, format: .currency(code: "AED"))
                .bold()
                .foregroundColor(transaction.type == TransactionType.credit.rawValue ? Color.text : .primary)
        }
        .padding([.top, .bottom], 8)
    }
}

struct TranactionRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TranactionRow(transaction: transactionPreviewData)
            TranactionRow(transaction: transactionPreviewData)
                .preferredColorScheme(.dark)

        }
    }
}
