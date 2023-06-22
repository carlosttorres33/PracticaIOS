//
//  VistaPrincipal.swift
//  Practica2
//
//  Created by UNAM FCA 18 on 19/05/22.
//

import Foundation
import SwiftUI

//Vista principal
struct VistaPrincipal : View{
    
    @EnvironmentObject var controller: ControladoEmpleado

    
    //Se inicializan con los valores por defectos de las bonificaciones y del balance general
    @ObservedObject var bonificaciones : BonificacionModel = BonificacionModel(17, 10)
    @ObservedObject var balance : BalanceGeneral = BalanceGeneral(3500500)
    
    var body: some View{
        NavigationView{//Navigation para poder crear enlaces entre pantallas
            VStack{
                HStack{
                    Spacer()
                    Text("Mc Ronalds").font(.title)//Titulo
                    Spacer()
                }
                HStack{
                    //NavigationLink que indica que vamos a la pantalla de ListaEmpleados y se le mandan a todos los empleados que se creaton
                    NavigationLink(destination: ListaEmpleados(bonoMasNuevoXD: bonificaciones, balance: balance) ) {
                            Text("Ver Nómina").foregroundColor(.blue)//Texto del boton
                        }
                    
                    
                }
                Text("Configuración salario base $23,587")
                Text("Bonificación de área:")
                HStack{
                    Spacer()
                    //Botón que disminuye el bono de area
                    Button{
                        bonificaciones.bonoArea = bonificaciones.bonoArea-1
                    }label: {
                        Text("-").foregroundColor(.red)
                    }
                    Spacer()
                    Text("\(bonificaciones.bonoArea)%")
                    Spacer()
                    //Boton que aumenta el bono de area
                    Button{
                        bonificaciones.bonoArea = bonificaciones.bonoArea+1
                    }label: {
                        Text("+").foregroundColor(.blue)
                    }
                    Spacer()
                    
                }
                Text("Bonificación de Empleado:")
                HStack{
                    Spacer()
                    //Boton que disminuye el bono de empleado
                    Button{
                        bonificaciones.bonoEmp = bonificaciones.bonoEmp-1
                    }label: {
                        Text("-").foregroundColor(.red)
                    }
                    Spacer()
                    Text("\(bonificaciones.bonoEmp)%")
                    Spacer()
                    //Boton que aumenta el bono de empleado
                    Button{
                        bonificaciones.bonoEmp = bonificaciones.bonoEmp+1
                    }label: {
                        Text("+").foregroundColor(.blue)
                    }
                    Spacer()
                }
                HStack{
                    VStack{
                        Text("Balance General")
                        Text("$\(balance.balanceGeneral)") //Se muestra el valor del balance general
                    }
                    
                }
                NavigationLink(destination: VistaAgregarEmpleados(datos: controller, Productividad: 90) ) {
                        Text("Agregar Empleados").foregroundColor(.blue)//Texto del boton
                    }
            }
            
        }
        
    }
    
}
