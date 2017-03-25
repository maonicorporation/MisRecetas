//
//  Receta.swift
//  MisRecetas
//
//  Created by EMILIO PARRILLA CORONADO on 5/3/17.
//  Copyright © 2017 EMILIO PARRILLA CORONADO. All rights reserved.
//

import Foundation
import UIKit

class Receta : NSObject
{
    var name : String!
    var imagen : UIImage!
    var time : Int!
    var ingredientes : [String]!
    var pasos : [String]!
    
    var isFavourite : Bool = false
    
    init(name : String,  image : UIImage, time : Int, ingredientes : [String], pasos : [String])
    {
        self.name = name;
        self.imagen = image
        self.time = time
        self.ingredientes = ingredientes
        self.pasos = pasos
        
       
    }
    
}

