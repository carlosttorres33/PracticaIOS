//
//  VistaEmpleado.swift
//  Practica2
//
//  Created by UNAM FCA 18 on 19/05/22.
//

import Foundation
import SwiftUI

//Vista empleados
struct VistaEmpleados : View{
    //Se crean las variables para los bonos y el balance pero sin inicializar para que sigan con sus valores modificados
    @ObservedObject var datos: EmpleadoModel
    @ObservedObject var bonosNuevos: BonificacionModel
    @ObservedObject var balance : BalanceGeneral
    let sueldoBase : Float = 23587//Sueldo base
    
    
    var body: some View{
        HStack{
            Image(systemName: datos.imagenEmpleado).resizable().frame(width: 40, height: 40)//imagen del empleado
            VStack{
                HStack{
                    Text(datos.nombreEmpleado).font(.system(size: 11))//nombre del empleado
                    Text(datos.apellidoEmpleado).font(.system(size: 11))
                    Text("-").font(.system(size: 11))//apellido del empleado
                    Text(datos.areaEmpleado).foregroundColor(.gray).font(.system(size: 10))//area del empleado
                    Text("-").font(.system(size: 11))
                    Text("\(datos.prodEmpleado)").foregroundColor(.gray).font(.system(size: 10))//productividad del empleado
                    Spacer()
                }
                //Si es el empleado más productivo entra al ciclo y muestra todos los bonos
                    if(datos.nombreEmpleado=="Adriana"){
                        HStack{
                            
                            VStack{
                                HStack{
                                    //Se imprime el sueldo base, de $23587
                                    Text("\(sueldoBase)").font(.system(size: 7)).foregroundColor(.green)
                                    
                                    Text("+").font(.system(size: 7))
                                    
                                    //Se imprime la cantidad de bono de Area
                                    Text("\(bonoArea(_:bonosNuevos))").font(.system(size: 7)).foregroundColor(.red)
                                    Text("+").font(.system(size: 7))
                                    
                                    //Se muestra la cantidad de bono de empleado
                                    Text("\(bonoEmpleado(_:bonosNuevos))").font(.system(size: 7)).foregroundColor(.brown)
                                    Text("=").font(.system(size: 7))
                                    
                                    //Se muestra la suma de todos los bonos
                                    Text("\(sumaTodo(_:bonosNuevos))").font(.system(size: 7)).foregroundColor(.blue)
                                
                                }
                                //Si el estado del pago es nulo se entra a la consdicion
                                if ((datos.estadoPago) == nil){
                                    //Boton que cambia el valor del pago a True y hace la resta del balance general
                                    Button{
                                        datos.estadoPago = true
                                        balance.balanceGeneral = balance.balanceGeneral - sumaTodo(bonosNuevos)
                                    }label: {
                                        Text("Pagar")
                                    }
                                    
                                }else {
                                    Text("Pagado")//Si ya está pagado se muestra Pagado
                                }
                            
                                
                            }
                            
                            
                        }
                    //Si el empleado es del area más productiva se muestran solo los bonos del area
                    }else if (datos.areaEmpleado=="Sistemas"){
                        HStack{
                            VStack{
                                HStack{
                                    //Sueldo base
                                    Text("\(sueldoBase) ").font(.system(size: 7)).foregroundColor(.green)
                                    Text("+").font(.system(size: 7))
                                    //Bono del area
                                    Text("\(bonoArea(_:bonosNuevos))").font(.system(size: 7)).foregroundColor(.red)
                                    Text("=").font(.system(size: 7))
                                    //Suma del bono de area y sueldo base
                                    Text("\(sumaArea(_:bonosNuevos))").font(.system(size: 7)).foregroundColor(.blue)
                                }
                                //Si el estado del pago es nulo se entra a la condicion
                                if ((datos.estadoPago) == nil){
                                    //Boton que cambia su estado a pagado y realiza la resta del balance general
                                    Button{
                                        datos.estadoPago = true
                                        balance.balanceGeneral = balance.balanceGeneral - sumaArea(bonosNuevos)
                                    }label: {
                                        Text("Pagar")
                                    }
                                }else {
                                    //Si ya está pagado se muestra pagado
                                    Text("Pagado")
                                }
                            }
                        }
                        //Si no es ni empleado productivo ni de area productiva solo se muestra el salario base
                    } else {
                        HStack{
                            VStack{
                                HStack{
                                    //Se muestra el salario base
                                    Text("\(sueldoBase) ").font(.system(size: 7)).foregroundColor(.green)
                                    Text("=").font(.system(size: 7))
                                    Text("\(sueldoBase)").font(.system(size: 7)).foregroundColor(.blue)
                                }
                                //Si el estado del pago es nulo se entra a la condicion
                                if ((datos.estadoPago) == nil){
                                    //Boton que cambia su estado a pagado y realiza la resta del balance general
                                    Button{
                                        datos.estadoPago = true
                                        balance.balanceGeneral = balance.balanceGeneral - sueldoBase
                                    }label: {
                                        Text("Pagar")
                                    }
                                    
                                }else {
                                    Text("Pagado")//Si ya está pagado se muestra pagado
                                }
                            }
                        }
                    }
                    
                
            }
        }
    }
    
    //Funcion que calcula el bono para el area mas productiva
    func bonoArea(_ porcetaje: BonificacionModel) ->Float{
        
        var bonificacionDecimal = Float(porcetaje.bonoArea)
        var porcentajeArea : Float
        
        porcentajeArea = ( bonificacionDecimal / 100 ) * 23587
        
        return porcentajeArea
    }
    //Funcion que calcula el bono para el empleado mas productivo
    func bonoEmpleado(_ porcetaje: BonificacionModel) ->Float{
        
        var bonificacionDecimal = Float(porcetaje.bonoEmp)
        var porcentajeEmp : Float
        
        porcentajeEmp = ( bonificacionDecimal / 100 ) * 23587
        
        return porcentajeEmp
    }
    //Funcion que hace la suma del salario y todos los bonos
    func sumaTodo(_ porcentaje: BonificacionModel) -> Float{
        var bonificacionAreaDecimal = Float(porcentaje.bonoArea)
        var porcentajeArea : Float
        
        porcentajeArea = ( bonificacionAreaDecimal / 100 ) * 23587
        
        var bonificacionEmpDecimal = Float(porcentaje.bonoEmp)
        var porcentajeEmp : Float
        
        porcentajeEmp = ( bonificacionEmpDecimal / 100 ) * 23587
        
        var sumaTotal : Float = 23587+porcentajeEmp+porcentajeArea
        
        return sumaTotal
        
    }
    //Funcion que suma el sueldo base y solo el bono de empleado
    func sumaArea(_ porcentaje: BonificacionModel) -> Float{
        var bonificacionAreaDecimal = Float(porcentaje.bonoArea)
        var porcentajeArea : Float
        
        porcentajeArea = ( bonificacionAreaDecimal / 100 ) * 23587
        
        var sumaTotal : Float = 23587+porcentajeArea
        
        return sumaTotal
        
    }
    
}
