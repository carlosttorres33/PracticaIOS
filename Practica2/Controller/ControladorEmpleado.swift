//
//  ControladorEmpleado.swift
//  Practica2
//
//  Created by UNAM FCA 18 on 19/05/22.
//

import Foundation
import SwiftUI

class ControladoEmpleado: ObservableObject {
    
     @Published var listaEmpleados:[EmpleadoModel] // array donde se van almacenar los empleados

     init(){
       self.listaEmpleados = [EmpleadoModel]()
       
       self.crearUsuario("person","Alejadra","Robles","RH",93)
       self.crearUsuario("person","Adriana","Ramon","Sistemas",99)
       self.crearUsuario("person","Roberto","Doniz","Sistemas",89)
       self.crearUsuario("person","Felipe","Morales","RH",88)
       self.crearUsuario("person","Abelardo","Lopez","Finanzas",87)
       self.crearUsuario("person","Lila","Downs","Sistemas",97)
       self.crearUsuario("person","Filemon","Santiago","RH",90)
       self.crearUsuario("person","Rolando","Rojas","Finanzas",95)
     }
     
    func crearUsuario(_ imagenEmpleado: String,_ nombre:String, _ apellidos:String, _ area:String, _ productividad:Int){
       var nuevoEmpleado:EmpleadoModel
       nuevoEmpleado = EmpleadoModel(imagenEmpleado,nombre,apellidos,area,productividad)//se crea un empleado nuevo, pasando los parametros correspondientes

        listaEmpleados(nuevoEmpleado) // se agrega el empleado nuevo al array por medio dela funcion lista empleados
       
     }
    
    func listaEmpleados(_ empleado:EmpleadoModel){//funcion para agregar empleados al array
        
        self.listaEmpleados.append(empleado)
      }
    
    func getListaEmpleado() -> [EmpleadoModel] {
        return listaEmpleados
    }
}
