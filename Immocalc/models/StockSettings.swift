//
//  StockSettings.swift
//  Immocalc
//
//  Created by Mathis Burger on 27.10.23.
//

import Foundation

struct StockSettings : Codable, Hashable {
    var interest: Float;
    var bankInterest: Float;
    var valueIncreaseRate: Float;
    
    init(interest: Float, bankInterest: Float, valueIncreaseRate: Float) {
        self.interest = interest;
        self.bankInterest = bankInterest;
        self.valueIncreaseRate = valueIncreaseRate;
    }
    
    init() {
        self.interest = 0;
        self.bankInterest = 0;
        self.valueIncreaseRate = 0;
    }
}

func creditRate(buyingPrice: Int, grossReturn: Float) -> Float {
    let percent = grossReturn / 100;
    return Float(buyingPrice) * percent * 0.55;
}

func calculateCreditDuration(debtsLeft: Int, bankInterestRate: Float, creditRate: Float) -> Int {
    var counter = 0;
    var debtLeft = Float(debtsLeft);
    while (debtLeft > 0) {
        let debtsAfterRate = debtLeft - creditRate;
        let interestRateAsPercent = bankInterestRate / 100;
        debtLeft = debtsAfterRate * (1+interestRateAsPercent);
        counter += 1;
    }
    return counter;
}

func calcCompoundInterest(start: Int, interest: Float, years: Int) -> Int {
    var money: Float = Float(start);
    let interestAsPercentage = interest / 100;
    for _ in 1...years {
        money = money*(Float(1)+interestAsPercentage);
    }
    return Int(money)
}
