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
            
            // Dark Bramble
            let ubicacionesZarza = [
                UbicacionModelo(
                    nombre: "Campamento de Feldespato",
                    urlImagen: imgUrl,
                    detalles: [
                        "¡Feldespato está vivo! Estrelló su nave y ahora acampa dentro de un enorme esqueleto de pez pescador.",
                        "Feldespato no cree que mi rastreador se equivoque cuando dice que mi explorador está en dos lugares a la vez. Tiene la teoría de que el espacio no funciona igual dentro de Zarza Oscura.",
                        "No parece tener mucha prisa por volver a la civilización. Ha estado disfrutando de la (relativa) paz y tranquilidad."
                    ]
                ),
                UbicacionModelo(
                    nombre: "Cápsula de Escape 3",
                    urlImagen: imgUrl,
                    detalles: ["Señal de auxilio detectada proveniente del interior de Zarza Oscura."]
                ),
                UbicacionModelo(
                    nombre: "La Nave",
                    urlImagen: imgUrl,
                    detalles: ["El origen de la señal de auxilio Nomai."]
                )
            ]
            
            // Planetas
            planetas = [
                PlanetaModelo(nombre: "Sol", urlImagen: imgUrl, tamaño: 280, ubicaciones: []),
                PlanetaModelo(nombre: "Gemelos Reloj\nde Arena", urlImagen: imgUrl, tamaño: 140, ubicaciones: []),
                PlanetaModelo(nombre: "Lumbre", urlImagen: imgUrl, tamaño: 160, ubicaciones: []),
                PlanetaModelo(nombre: "Abismo del\nGigante", urlImagen: imgUrl, tamaño: 220, ubicaciones: []),
                PlanetaModelo(nombre: "Zarza Oscura", urlImagen: imgUrl, tamaño: 180, ubicaciones: ubicacionesZarza)
            ]
        }
}
