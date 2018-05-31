//
//  Kimara.swift
//  Rgp Opp
//
//  Created by user on 04/08/2016.
//  Copyright © 2016 David Kennedy. All rights reserved.
//

import Foundation

class Kimara: Enemy {
    
    let Immune_Max = 15
    
    override var loot: [String] {
        return ["Tough Hide", "Kimara Venom", "Rare Sword"]
    }
    
    override var type: String{
        return "Kimara"
    }
    
    override func attemptAttack(attackPwr: Int) -> Bool {
        if attackPwr >= Immune_Max {
            return super.attemptAttack(attackPwr)
        } else {
            return false
        }
    }
}
