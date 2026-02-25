//
//  planeta.swift
//  PROYECTO_3
//
//  Created by Marco Dominguez on 24/02/26.
//
import Foundation

struct PlanetaModelo: Identifiable {
    let id: String = UUID().uuidString
    let nombre: String
    let urlImagen: String
    let tamaño: CGFloat
}
