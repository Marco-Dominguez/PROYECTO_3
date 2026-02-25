//
//  personaje_modelo.swift
//  PROYECTO_3
//
//  Created by Marco Dominguez on 24/02/26.
//
import Foundation

struct PersonajeModelo: Identifiable {
    let id: String = UUID().uuidString
    let nombre: String
    let descripcion: String
    let urlImagen: String
    let objetos: [String]
}
