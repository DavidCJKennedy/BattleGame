//
//  Devil Wizard.swift
//  Rgp Opp
//
//  Created by user on 04/08/2016.
//  Copyright © 2016 David Kennedy. All rights reserved.
//

import Foundation

class DevilWizard: Enemy {
    
    override var loot: [String] {
        return ["Magic Wand", "Dark Amulet", "Salted Pork"]
        
    }
    
    override var type: String {
        return "Devil Wizard"
    }
}