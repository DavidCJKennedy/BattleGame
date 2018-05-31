//
//  Character.swift
//  Rgp Opp
//
//  Created by user on 04/08/2016.
//  Copyright © 2016 David Kennedy. All rights reserved.
//

import Foundation


class Character {
    
    private var _hp: Int = 100
    private var _attackPwr: Int = 10
    //private var _attackPwrArr: [Int]

    var attackPwr: Int {
        get {
            //randAttPwr([2, 5, 8, 10, 20])
            return _attackPwr
            //return randAttPwr([2, 5, 8, 10, 20])
        }
    }

    var hp: Int {
        get {
            return _hp
        } set {
            
        }
    }
    
//    var attackPwrArr: [Int] {
//        get {
//            return _attackPwrArr
//        }
//    }
    
    var isAlive: Bool {
        get {
            if hp <= 0 {
                return false
            } else {
                return true
            }
        }
    }
    
    init(startingHp: Int, attackPwr: Int) {
        self._hp = startingHp
        self._attackPwr = attackPwr
        //self._attackPwrArr = attackPwr
        
    }
    
    
    func attemptAttack(attackPwr: Int) -> Bool {
        
        self._hp -= attackPwr
        
        return true
        
    }
    
//    func randAttPwr(attackPwrArr: [Int]) -> Int {
//        let rand = Int(arc4random_uniform(UInt32(attackPwrArr.count)))
//        return attackPwrArr[rand]
//    }
    
}





