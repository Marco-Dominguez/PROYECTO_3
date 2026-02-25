//
//  mapa-rumores.swift
//  PROYECTO_3
//
//  Created by Marco Dominguez on 24/02/26.
//
import Foundation
import SwiftUI
internal import Combine

class MapaRumores: ObservableObject {
    @Published var rumores: [NodoRumor] = []
    @Published var conexiones: [Conexion] = []
    
    init() {
        cargarDatos()
    }
    
    private func cargarDatos() {
        let colorNaranja = Color(hex: 0xB4764B)
        let colorNaranjaClaro = Color(hex: 0xFFA768)
        let imgUrl = "https://outerwilds.ventures/assets/TH_VILLAGE-VoBiOHgy.jpg"
        
        rumores = [
            // Rumor Central
            NodoRumor(id: "atp", titulo: "Ash Twin\nProject", urlImagen: imgUrl, colorTarjeta: colorNaranja, colorSobreTarjeta: colorNaranjaClaro, posicion: CGPoint(x: 0, y: 0), tamaño: .grande),

            NodoRumor(id: "hel", titulo: "High Energy\nLab", urlImagen: imgUrl, colorTarjeta: colorNaranja, colorSobreTarjeta: colorNaranjaClaro, posicion: CGPoint(x: -150, y: -350), tamaño: .mediana),
            NodoRumor(id: "attd", titulo: "Ash Twin\nTower\nDesigns", urlImagen: imgUrl, colorTarjeta: colorNaranja, colorSobreTarjeta: colorNaranjaClaro, posicion: CGPoint(x: -250, y: -180), tamaño: .pequeña),
            NodoRumor(id: "whs", titulo: "White Hole\nStation", urlImagen: imgUrl, colorTarjeta: colorNaranja, colorSobreTarjeta: colorNaranjaClaro, posicion: CGPoint(x: -550, y: -350), tamaño: .mediana),
            NodoRumor(id: "att", titulo: "Ash Twin\nTowers", urlImagen: imgUrl, colorTarjeta: colorNaranja, colorSobreTarjeta: colorNaranjaClaro, posicion: CGPoint(x: -400, y: -100), tamaño: .mediana),
            NodoRumor(id: "ss", titulo: "Sun Station", urlImagen: imgUrl, colorTarjeta: colorNaranja, colorSobreTarjeta: colorNaranjaClaro, posicion: CGPoint(x: -750, y: -100), tamaño: .mediana),
            NodoRumor(id: "bhf", titulo: "Black Hole\nForge", urlImagen: imgUrl, colorTarjeta: colorNaranja, colorSobreTarjeta: colorNaranjaClaro, posicion: CGPoint(x: -250, y: 300), tamaño: .mediana),
            NodoRumor(id: "aad", titulo: "Alignment\nAngle\nDiagram", urlImagen: imgUrl, colorTarjeta: colorNaranja, colorSobreTarjeta: colorNaranjaClaro, posicion: CGPoint(x: -130, y: 450), tamaño: .pequeña),
            NodoRumor(id: "si", titulo: "Statue\nIsland", urlImagen: imgUrl, colorTarjeta: colorNaranja, colorSobreTarjeta: colorNaranjaClaro, posicion: CGPoint(x: 400, y: -250), tamaño: .mediana),
            NodoRumor(id: "sw", titulo: "Statue\nWorkshop", urlImagen: imgUrl, colorTarjeta: colorNaranja, colorSobreTarjeta: colorNaranjaClaro, posicion: CGPoint(x: 250, y: -120), tamaño: .pequeña),
            NodoRumor(id: "nm", titulo: "Nomai Mines", urlImagen: imgUrl, colorTarjeta: colorNaranja, colorSobreTarjeta: colorNaranjaClaro, posicion: CGPoint(x: 400, y: 300), tamaño: .mediana),
            NodoRumor(id: "vts", titulo: "Volcanic\nTesting Site", urlImagen: imgUrl, colorTarjeta: colorNaranja, colorSobreTarjeta: colorNaranjaClaro, posicion: CGPoint(x: 750, y: 300), tamaño: .mediana)
        ]
        
        conexiones = [
            Conexion(origenId: "whs", destinoId: "hel"),
            Conexion(origenId: "hel", destinoId: "whs"),
            Conexion(origenId: "whs", destinoId: "att"),
            Conexion(origenId: "ss", destinoId: "att"),
            Conexion(origenId: "bhf", destinoId: "att"),
            Conexion(origenId: "att", destinoId: "atp"),
            Conexion(origenId: "hel", destinoId: "atp"),
            Conexion(origenId: "bhf", destinoId: "atp"),
            Conexion(origenId: "si", destinoId: "atp"),
            Conexion(origenId: "nm", destinoId: "atp"),
            Conexion(origenId: "vts", destinoId: "nm")
        ]
    }
}

