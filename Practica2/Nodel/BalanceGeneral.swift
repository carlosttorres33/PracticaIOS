//
//  BalanceGeneral.swift
//  Practica2
//
//  Created by UNAM FCA 18 on 19/05/22.
//

import Foundation
import SwiftUI

//Se crea una clase para poder crear variables de tipo Balance General
class BalanceGeneral : ObservableObject{
    
    //Se crea una variable Published para poder usarla en todo
    @Published var balanceGeneral : Float
    init(_ balanceGeneral: Float){
        self.balanceGeneral=balanceGeneral
    }
}
