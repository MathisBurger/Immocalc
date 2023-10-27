//
//  RoiDataLIst.swift
//  Immocalc
//
//  Created by Mathis Burger on 27.10.23.
//

import SwiftUI

struct RoiDataList: View {
    
    @State private var store = StockSettingsStore();
    @State private var interest: Float = 0;
    @State private var bankInterest: Float = 0;
    @State private var valueIncreaseRate: Float = 0;
    
    var object: SearchObject;
    
    func calcCredDur(debt: Int, bankRate: Float, grossReturn: Float) -> Int {
        return calculateCreditDuration(debtsLeft: debt, bankInterestRate: bankRate, creditRate: creditRate(buyingPrice: debt, grossReturn: grossReturn));
    }
    
    func calcComInt(debt: Int, bankRate: Float, grossReturn: Float, valueInc: Float) -> Int {
        let duration = calcCredDur(debt: debt, bankRate: bankRate, grossReturn: grossReturn);
        return calcCompoundInterest(start: debt, interest: valueInc, years: duration);
    }
    
    func stocksPayOff() -> Bool {
        let diff = calcComInt(debt: object.buyingPrice, bankRate: bankInterest, grossReturn: object.grossReturn, valueInc: valueIncreaseRate) - calcCompoundInterest(start: object.buyingPrice/10, interest: interest, years: calcCredDur(debt: object.buyingPrice, bankRate: bankInterest, grossReturn: object.grossReturn));
        return diff <= 0;
    }
    
    
    var body: some View {
        VStack(alignment: .center) {
            HStack(alignment: .center, spacing: 40) {
                TextWithTitle(text: String(object.buyingPrice/10)+"€", title: "EK")
                TextWithTitle(text: String(object.rentPricePerSqm*object.squareMeter)+"€", title: "Erw. Miete")
            }
            Spacer()
            Text("Immobilien-Analyse")
                .font(.subheadline)
                .fontWeight(.light)
                .foregroundColor(.primary)
            HStack(alignment: .center, spacing: 40) {
                TextWithTitle(text: String(creditRate(buyingPrice: object.buyingPrice, grossReturn: object.grossReturn))+"€", title: "Kreditrate / Jahr")
                TextWithTitle(text: String(calcCredDur(debt: object.buyingPrice, bankRate: bankInterest, grossReturn: object.grossReturn))+" Jahre", title: "Kreditdauer")
                TextWithTitle(text: String(calcComInt(debt: object.buyingPrice, bankRate: bankInterest, grossReturn: object.grossReturn, valueInc: valueIncreaseRate))+"€", title: "Endkapital")
            }
            Text("Aktien-Analyse")
                .font(.subheadline)
                .fontWeight(.light)
                .foregroundColor(.primary)
            HStack(alignment: .center, spacing: 40) {
                TextWithTitle(text: String(interest)+"%", title: "Jährliche Rendite")
                TextWithTitle(text: String(calcCompoundInterest(start: object.buyingPrice/10, interest: interest, years: calcCredDur(debt: object.buyingPrice, bankRate: bankInterest, grossReturn: object.grossReturn)))+"€", title: "Endkapital")
                BooleanWithTitle(status: stocksPayOff(), title: "Rentabel")
            }
        }
        .task {
            do {
                try await store.load();
                if (store.stockSettings != nil) {
                    self.interest = (store.stockSettings!).interest;
                    self.bankInterest = (store.stockSettings!).bankInterest;
                    self.valueIncreaseRate = (store.stockSettings!).valueIncreaseRate;
                }
            } catch {}
        }
    }
}

