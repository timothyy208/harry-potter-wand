//
//  Spells.swift
//  wand
//
//  Created by Timothy Yang on 4/1/19.
//  Copyright © 2019 Timothy Yang. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class Spells {
    var spellArray: [SpellData] = []
    let spellURL = "https://potterspells.herokuapp.com/api/v1/spells/"
    func getSpells(completed: @escaping () -> () ) {
        Alamofire.request(spellURL).responseJSON {response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                //print(json)
                let spellCount = json["results"]
                for id in 0...spellCount.count-1 {
                    //print(json["results"][id])
                    
                    let spellName = json["results"][id]["name"].stringValue
                    let spellDesc = json["results"][id]["description"].stringValue
                    let spellSound = json["results"][id]["soundFile"].stringValue
                    
                    self.spellArray.append(SpellData(name: spellName, description: spellDesc, soundFile: spellSound))
                    //print(self.spellArray)
                }
            case .failure:
                print("error")
            }
            completed()
        }
    }
    

}
