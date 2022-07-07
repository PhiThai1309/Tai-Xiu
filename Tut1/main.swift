//
//  main.swift
//  Tut1
//
//  Created by Phi Thai on 29/06/2022.
//

import Foundation

var theHouse:Int = 1000
var thePlayer:Int = 100

var roundNum = 1;
var dice: [Int] = [];

while(theHouse != 0 || thePlayer != 0){
    print("The house has $\(theHouse)")
    print("the player has $\(thePlayer)")
    
    print("Try your luck to win all money of the house!")
    print("Round \(roundNum):")
    print("How much do you want to bet?")
    let bet = readLine() ?? "0"
    print("You have bet $\(bet)")
    for _ in 1...3{
        dice.append(Int.random(in: 1...6))
    }
    let sum = dice.reduce(0, +)
    
    print("Do you want to bet big or small? (big/small)")
    var size = readLine() ?? "small"
    size = size.uppercased()
    
    print("The dices are \(dice)")
    print("The sum of 3 dices is \(sum)")
    
    if(size == "SMALL" && sum >= 4 && sum <= 10) {
        print("You won $\(bet)")
        theHouse -= Int(bet) ?? 0
        thePlayer += Int(bet) ?? 0
    } else if(size == "BIG" && sum >= 11 && sum <= 17) {
        print("You won $\(bet)")
        theHouse -= Int(bet) ?? 0
        thePlayer += Int(bet) ?? 0
    } else {
        print("You lost $\(bet)")
        theHouse += Int(bet) ?? 0
        thePlayer -= Int(bet) ?? 0
    }
    
    dice.removeAll()
    roundNum += 1
    
    print("The house has $\(theHouse)")
    print("the player has $\(thePlayer)")
    
    if(theHouse <= 0){
        print("The house is out of money!")
    } else if(thePlayer <= 0){
        print("You are out of money! Bye!")
        break
    }
    print("Do you still want to play? (true/false)")
    let play = readLine() ?? "true"
    if(play.uppercased() == "TRUE"){
        continue
    } else {
        break
    }
    
}


