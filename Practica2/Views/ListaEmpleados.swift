//
//  ListaEmpleados.swift
//  Practica2
//
//  Created by UNAM FCA 18 on 19/05/22.
//

import Foundation
import SwiftUI

//Vista de la lista de empleados
struct ListaEmpleados : View{
    
    //Se crean todas las variables para los empleados que va a recibir al ser llamada la funcion
                        
    //var empleados = ControladoEmpleado()
    @EnvironmentObject var empleados:ControladoEmpleado
    //Se crean las variables para los bonos y el balance pero sin inicializar para que sigan con sus valores modificados
    @ObservedObject var bonoMasNuevoXD : BonificacionModel
    @ObservedObject var balance : BalanceGeneral
    
    var body: some View{
        //Lista de todos los empleados, se llama la vista y se le manda a su respectivo empleado, los bonos y el balance General
        ScrollView{
            
            ForEach(empleados.getListaEmpleado()) { emple in
                            
                            //VistaEmpleado(empleado: emple, bonos: bonos, nomina: nomina)
                            VistaEmpleados(datos: emple, bonosNuevos: bonoMasNuevoXD, balance: balance)
                }
            
        }
    }
        
    
}
