//
//  Product.swift
//  UrDailyStep
//
//  Created by guillaume chieb bouares on 06/10/2016.
//  Copyright © 2016 com.github.shemana. All rights reserved.
//

import UIKit

class Product: NSObject {

    var name:String?
    var describe:String?
    var price:Float?
    var quantityLeft:Int?
    var image:[String] = []
    
    
    
    static func mockedProduct() -> [Product] {
        var productList:[Product] = []
        var i = 0
        while(i < 4){
            var product = Product()
            switch i{
            case 0:
                product.name = "BRACELET CONNECTÉ NOIR (TAILLE L)"
                product.describe = "Conçu pour avoir un suivi continu de la fréquence cardiaque et analyse des activités tout au long de la journée, depuis votre poignet."
                product.price = 149.99
                product.quantityLeft = 5
                product.image = ["bracelet.png","bracelet-2.png"]
                break
            case 1:
                product.name = "SANGLE ETIREMENT STRECHING POUR TOUT LE CORPS"
                product.describe = "Conçu pour les étirements après vos séances de tonification , de musculation et de fitness : renforce la souplesse musculaire et articulaire."
                product.price = 9.99
                break
            case 2:
                product.name = "CORDE À SAUTER CUIR"
                product.describe = "Conçu pour le pratiquant régulier de corde à sauter (2 à 3 fois par semaine)."
                product.price = 9.99
                break
            case 3:
                product.name = "Poids chevilles/poignets en nylon et acier - 2kg"
                product.describe = "Poids transportables que l'on peut accrocher aux poignets ou aux chevilles. Ils pèsent 2kg. Utilisables en outdoor, indoor, au bureau et sous l’eau."
                product.price = 12.90
                break
            default:
                product.name = "APPAREIL POUR RAFFERMISSEMENT DES CUISSES ET DES BRAS"
                product.describe = "Raffermit la musculature intérieure et extérieure des cuisses Tonifie bras, poitrine et fessiers Guide de fitness inclus"
                product.price = 12.90
                break
            }
            productList.append(product)
            i+=1
        }
        
        return productList;
    }
    
}
