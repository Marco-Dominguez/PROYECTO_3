//
//  sistema-solar.swift
//  PROYECTO_3
//
//  Created by Marco Dominguez on 24/02/26.
//
import Foundation
import SwiftUI
internal import Combine

class SistemaSolar: ObservableObject {
    @Published var planetas: [PlanetaModelo] = []
    
    init() {
        cargarPlanetas()
    }
    
    private func cargarPlanetas() {
        let imgUrl = "https://outerwilds.ventures/assets/TH_VILLAGE-VoBiOHgy.jpg"
        
        planetas = [
            PlanetaModelo(nombre: "Sol", urlImagen: imgUrl, tamaño: 280),
            PlanetaModelo(nombre: "Gemelos Reloj\nde Arena", urlImagen: imgUrl, tamaño: 140),
            PlanetaModelo(nombre: "Lumbre", urlImagen: imgUrl, tamaño: 160),
            PlanetaModelo(nombre: "Abismo del\nGigante", urlImagen: imgUrl, tamaño: 220),
            PlanetaModelo(nombre: "Zarza Oscura", urlImagen: imgUrl, tamaño: 180)
        ]
    }
}
