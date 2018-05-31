//
//  ViewController.swift
//  Rgp Opp
//
//  Created by user on 04/08/2016.
//  Copyright © 2016 David Kennedy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var printLbl: UILabel!
    @IBOutlet weak var playerHpLbl: UILabel!
    @IBOutlet weak var enemyHpLbl: UILabel!
    @IBOutlet weak var enemyImg: UIImageView!
    @IBOutlet weak var chestBtn: UIButton!
    
    var player: Player!
    var enemy: Enemy!
    var chestMessage: String?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        player = Player(name: "Dirty Laundry21", hp: 110, attackPwr: 20)
        
        generateRandomEnemy()
        
        playerHpLbl.text = "\(player.hp) HP"
        
    }
    
    func generateRandomEnemy() {
        let rand = Int(arc4random_uniform(2))
        
        if rand == 0 {
            enemy = Kimara(startingHp: 50, attackPwr: 10)
        } else {
            enemy = DevilWizard(startingHp: 60, attackPwr: 10)
        }
        
        enemyImg.hidden = false
    }

    @IBAction func onChestTapped(sender: AnyObject) {
        chestBtn.hidden = true
        printLbl.text = chestMessage
        NSTimer.scheduledTimerWithTimeInterval(2.0, target: self, selector: "generateRandomEnemy", userInfo: nil, repeats: false)
    }

    @IBAction func attackTapped(sender: AnyObject) {
        
        if enemy.attemptAttack(player.attackPwr) {
            printLbl.text = "Attacked \(enemy.type) for \(player.attackPwr) HP"
            enemyHpLbl.text = "\(enemy.hp) HP"
        } else {
            printLbl.text = "Attack was unseccessful!"
        }
        
        if player.attemptAttack(enemy.attackPwr) {
            playerHpLbl.text = "\(player.hp) HP"
        }
        
        
        if let loot = enemy.dropLoot() {
            player.addItemToInventory(loot)
            
            chestMessage = "\(player.name) found \(loot)"
            chestBtn.hidden = false
        }
        
        
        if chestMessage == "\(player.name) found Salted Pork" {
            player.hp = player.hp + 10000
            playerHpLbl.text = "\(player.hp) HP"
        }
        
        
        if !enemy.isAlive {
            enemyHpLbl.text = ""
            printLbl.text = "Killed \(enemy.type)"
            enemyImg.hidden = true
        }
        
    }

}

