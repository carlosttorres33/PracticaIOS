//
//  BonificacionModel.swift
//  Practica2
//
//  Created by UNAM FCA 18 on 19/05/22.
//

import Foundation
import SwiftUI
//Se crea una clase para poder crear valores de tipo Bonificacion model
class BonificacionModel : ObservableObject{
    
    //Se crean las variables para el bono del area y del empleado, son published para poderlos usar en otras pantallas y que sus valores se modifiquen
    @Published var bonoArea : Int
    @Published var bonoEmp : Int
    
    //Inicializador de estos mismos
    init(_ bonoArea: Int, _ bonoEmp: Int){
        self.bonoArea=bonoArea
        self.bonoEmp=bonoEmp
    }
    
}
