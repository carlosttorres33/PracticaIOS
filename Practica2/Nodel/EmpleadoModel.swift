//
//  EmpleadoModel.swift
//  Practica2
//
//  Created by UNAM FCA 18 on 19/05/22.
//

import Foundation
import SwiftUI

//Se crea la clase EmpleadoModel para poder crear a los empleados con sus respectivos datos
class EmpleadoModel: Identifiable, ObservableObject{
    var id = UUID()
    var imagenEmpleado : String //nombre de la imagen del empleado
    var nombreEmpleado : String//nombre del empleado
    var apellidoEmpleado : String//Apellido del empleado
    var areaEmpleado : String//area del empleado
    var prodEmpleado : Int//productividad del empleado
    @Published var estadoPago : Bool?? //Variable que indica que el empleado ya recibiò su pago o no, es opcional e inicia vacia
    
    //Se inicializan las variables
    init(_ imagenEmpleado: String,_ nombreEmpleado: String,_ apellidoEmpleado: String,_ areaEmpleado: String,_ prodEmpleado: Int){
        
        self.imagenEmpleado = imagenEmpleado
        self.nombreEmpleado = nombreEmpleado
        self.apellidoEmpleado = apellidoEmpleado
        self.areaEmpleado = areaEmpleado
        self.prodEmpleado = prodEmpleado
        
        
    }
    
}
