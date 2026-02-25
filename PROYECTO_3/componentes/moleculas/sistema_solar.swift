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
            
        // sol
        let ubicacionesSol = [
            UbicacionModelo(
                nombre: "Estacion Solar",
                urlImagen: "https://outerwilds.ventures/assets/S_SUNSTATION-U8eJn4q9.jpg",
                detalles: [
                    "The Sun Station was designed to make the sun go supernova.",
                    "The Nomai fired the Sun Station but it had no effect on the sun. They concluded that the Sun Station could never cause the sun to go supernova.",
                    "After the failure of the Sun Station, the Nomai took a break to investigate the newly arrived comet.",
                    "According to a Nomai computer, our sun has reached the end of its natural life cycle."
                ]
            )
        ]
        
        // Zarza Oscura
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
            // Usamos los nombres exactos de tus assets como "sol", "lumbre", etc.
            PlanetaModelo(nombre: "Sol", imagen: "sol", tamaño: 280, ubicaciones: ubicacionesSol),
            PlanetaModelo(nombre: "Gemelos Reloj\nde Arena", imagen: "gemeloCeniza", tamaño: 140, ubicaciones: []),
            PlanetaModelo(nombre: "Lumbre", imagen: "lumbre", tamaño: 160, ubicaciones: []),
            PlanetaModelo(nombre: "Gravedad Hueca", imagen: "gravedadHueca", tamaño: 160, ubicaciones: []),
            PlanetaModelo(nombre: "Abismo del\nGigante", imagen: "abismoDelGigante", tamaño: 220, ubicaciones: []),
            PlanetaModelo(nombre: "Zarza Oscura", imagen: "zarzaOscura", tamaño: 180, ubicaciones: ubicacionesZarza)
        ]
    }
}
