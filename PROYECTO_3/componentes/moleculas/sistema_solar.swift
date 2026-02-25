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
                nombre: "Estación Solar",
                urlImagen: "https://outerwilds.ventures/assets/S_SUNSTATION-U8eJn4q9.jpg",
                detalles: [
                    "La Estación Solar fue diseñada para hacer que el sol se convierta en supernova.",
                    "Los Nomai dispararon la Estación Solar pero no tuvo efecto en el sol. Concluyeron que la Estación Solar nunca podría causar que el sol se convierta en supernova.",
                    "Tras el fracaso de la Estación Solar, los Nomai se tomaron un descanso para investigar el recién llegado cometa.",
                    "Según una computadora Nomai, nuestro sol ha llegado al final de su ciclo de vida natural."
                ]
            )
        ]
        
        // Gemelos Reloj de Arena
        let ubicacionesGemelos = [
            UbicacionModelo(
                nombre: "Ciudad Reloj de Arena",
                urlImagen: imgUrl,
                detalles: [
                    "Una enorme ciudad Nomai construida en las cavernas de Gemelo Ceniza, protegida del flujo de arena por puertas estancas.",
                    "Contiene los distritos de energía, enseñanza e investigación del Proyecto Gemelo Ceniza."
                ]
            ),
            UbicacionModelo(
                nombre: "Proyecto Gemelo Ceniza",
                urlImagen: "https://outerwilds.ventures/assets/TT_TIME_LOOP_DEVICE-e72G7z37.jpg",
                detalles: [
                    "Una cámara sellada en el núcleo de Gemelo Ceniza capaz de enviar recuerdos al pasado.",
                    "Se diseñó para activarse con la energía de una supernova y generar un bucle temporal de 22 minutos."
                ]
            )
        ]
        
        // Lumbre (Timber Hearth)
        let ubicacionesLumbre = [
            UbicacionModelo(
                nombre: "Minas Nomai",
                urlImagen: "https://outerwilds.ventures/assets/TH_NOMAI_MINE-w6HKKWJl.jpg",
                detalles: [
                    "Los Nomai extrajeron mineral de aquí para construir la coraza protectora del Proyecto Gemelo Ceniza.",
                    "Observaron formas de vida de cuatro ojos en las vías fluviales, los ancestros de los hearthianos."
                ]
            ),
            UbicacionModelo(
                nombre: "Observatorio de Woodle Hearth",
                urlImagen: imgUrl,
                detalles: [
                    "Sede del programa espacial Hearthiano, donde se guarda la estatua Nomai que se vinculó conmigo."
                ]
            )
        ]
        
        // Gravedad Hueca (Brittle Hollow)
        let ubicacionesGravedad = [
            UbicacionModelo(
                nombre: "Ciudad Colgante",
                urlImagen: imgUrl,
                detalles: [
                    "Una ciudad suspendida bajo la corteza del planeta, justo encima del agujero negro central.",
                    "Los Nomai la construyeron para refugiarse de los bombardeos volcánicos de Linterna del Arconte."
                ]
            ),
            UbicacionModelo(
                nombre: "Forja del Agujero Negro",
                urlImagen: "https://outerwilds.ventures/assets/BH_BLACK_HOLE_FORGE-1SDsy3k-.jpg",
                detalles: [
                    "Donde se forjaron los núcleos de distorsión avanzados para el Proyecto Gemelo Ceniza."
                ]
            )
        ]
        
        // Abismo del Gigante (Giant's Deep)
        let ubicacionesAbismo = [
            UbicacionModelo(
                nombre: "Módulo de Rastreo de la Sonda",
                urlImagen: imgUrl,
                detalles: [
                    "Parte del Cañón de Órbita de la Sonda que se hundió bajo la corriente de nubes.",
                    "Guarda los registros de cada lanzamiento y las coordenadas exactas del Ojo del Universo."
                ]
            ),
            UbicacionModelo(
                nombre: "Taller de Estatuas",
                urlImagen: "https://outerwilds.ventures/assets/GD_STATUE_WORKSHOP-1SF2HiR9.jpg",
                detalles: [
                    "El lugar donde los Nomai tallaron las estatuas para registrar y transmitir recuerdos."
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
            PlanetaModelo(nombre: "Sol", imagen: "sol", tamaño: 280, ubicaciones: ubicacionesSol),
            PlanetaModelo(nombre: "Gemelos Reloj\nde Arena", imagen: "gemeloCeniza", tamaño: 140, ubicaciones: ubicacionesGemelos),
            PlanetaModelo(nombre: "Lumbre", imagen: "lumbre", tamaño: 160, ubicaciones: ubicacionesLumbre),
            PlanetaModelo(nombre: "Gravedad Hueca", imagen: "gravedadHueca", tamaño: 160, ubicaciones: ubicacionesGravedad),
            PlanetaModelo(nombre: "Abismo del\nGigante", imagen: "abismoDelGigante", tamaño: 220, ubicaciones: ubicacionesAbismo),
            PlanetaModelo(nombre: "Zarza Oscura", imagen: "zarzaOscura", tamaño: 180, ubicaciones: ubicacionesZarza)
        ]
    }
}
