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
        let imagenPorDefecto = "https://outerwilds.ventures/assets/TH_VILLAGE-VoBiOHgy.jpg"
        
        rumores = [
            // Central Rumor
            NodoRumor(id: "atp", titulo: "Proyecto\nGemelo Ceniza", urlImagen: "https://outerwilds.ventures/assets/TT_TIME_LOOP_DEVICE-e72G7z37.jpg", colorTarjeta: colorNaranja, colorSobreTarjeta: colorNaranjaClaro, posicion: CGPoint(x: 0, y: 0), tamaño: .grande, detalles: [
                "Una cámara hueca en el interior de Gemelo Ceniza. Los cables de energía de la superficie están conectados a una carcasa protectora en el centro del planeta.",
                "Hay ocho monolitos con máscaras Nomai conectadas. Tres de las máscaras están recibiendo datos activamente del Módulo de Rastreo de la Sonda, Profundidades Gigantes y Woodle Hearth respectivamente.",
                "El Proyecto Gemelo Ceniza fue diseñado para usar la energía de una supernova (activada por la Estación Solar) para enviar los datos de la sonda del Cañón de Órbita de la Sonda 22 minutos al pasado.",
                "La Estación Solar no funcionó. Aunque el Proyecto Gemelo Ceniza era teóricamente sólido, los Nomai no pudieron darle energía.",
                "Hay un núcleo de distorsión avanzado dentro de la carcasa protectora en el centro del planeta. Retirar el núcleo desactivará el Proyecto Gemelo Ceniza."
            ]),
            NodoRumor(id: "hel", titulo: "Laboratorio de\nAlta Energía", urlImagen: imagenPorDefecto, colorTarjeta: colorNaranja, colorSobreTarjeta: colorNaranjaClaro, posicion: CGPoint(x: -150, y: -350), tamaño: .mediana, detalles: [
                "Los Nomai reprodujeron con éxito la anomalía temporal observada por primera vez en la Estación del Agujero Blanco (los objetos distorsionados parecen llegar antes de partir).",
                "Los Nomai descubrieron que podían aumentar el intervalo de tiempo negativo entre la llegada y la partida añadiendo energía a los núcleos de distorsión.",
                "Los Nomai querían saber si era posible un intervalo de tiempo negativo de 22 minutos. Concluyeron que requeriría nueva tecnología para producir la energía necesaria, así como un núcleo de distorsión avanzado. Se propuso Gemelo Ceniza como ubicación para el proyecto."
            ]),
            NodoRumor(id: "attd", titulo: "Diseños de\nTorres de\nGemelo Ceniza", urlImagen: "https://outerwilds.ventures/assets/CT_WARP_TOWER_MAP-rZxiwbV4.jpg", colorTarjeta: colorNaranja, colorSobreTarjeta: colorNaranjaClaro, posicion: CGPoint(x: -250, y: -180), tamaño: .pequeña, detalles: [
                "Diseños para cada una de las torres en el ecuador de Gemelo Ceniza.",
                "Cada torre se distorsiona hacia un planeta diferente (aunque muchos Nomai señalaron rápidamente que el sol no es realmente un planeta).",
                "Cada torre fue diseñada para reflejar visualmente su destino de distorsión.",
                "Las torres permitían a los Nomai viajar rápidamente entre Gemelo Ceniza y todas las demás ubicaciones cruciales para el Proyecto Gemelo Ceniza."
            ]),
            NodoRumor(id: "whs", titulo: "Estación del\nAgujero Blanco", urlImagen: "https://outerwilds.ventures/assets/WHITE_HOLE_STATION-esdUKL5C.jpg", colorTarjeta: colorNaranja, colorSobreTarjeta: colorNaranjaClaro, posicion: CGPoint(x: -550, y: -350), tamaño: .mediana, detalles: [
                "Cada torre de distorsión Nomai está sintonizada con un cuerpo astral específico.",
                "Para usar una torre, debes estar en la plataforma de distorsión durante la alineación de la torre con su cuerpo astral correspondiente (la alineación ocurre cuando el cuerpo astral está directamente encima).",
                "Los Nomai notaron algo extraño: los objetos distorsionados parecían llegar al receptor en Brittle Hollow ligeramente antes de salir de la Estación del Agujero Blanco.",
                "Este intervalo de tiempo negativo entre la llegada y la partida de un objeto era increíblemente minúsculo (aproximadamente una cienmilésima de segundo). Los Nomai dudaban de si su equipo podría medir el tiempo en un grado tan pequeño."
            ]),
            NodoRumor(id: "att", titulo: "Torres de\nGemelo Ceniza", urlImagen: "https://outerwilds.ventures/assets/TT_WARP_TOWERS-6FX_fVuS.jpg", colorTarjeta: colorNaranja, colorSobreTarjeta: colorNaranjaClaro, posicion: CGPoint(x: -400, y: -100), tamaño: .mediana, detalles: [
                "Varias torres Nomai grandes forman un anillo alrededor del ecuador de Gemelo Ceniza.",
                "La Estación del Agujero Blanco se utilizó como modelo para estas torres, que fueron construidas para el Proyecto Gemelo Ceniza."
            ]),
            NodoRumor(id: "ss", titulo: "Estación\nSolar", urlImagen: "https://outerwilds.ventures/assets/S_SUNSTATION-U8eJn4q9.jpg", colorTarjeta: colorNaranja, colorSobreTarjeta: colorNaranjaClaro, posicion: CGPoint(x: -750, y: -100), tamaño: .mediana, detalles: [
                "La Estación Solar fue diseñada para hacer que el sol se convierta en supernova.",
                "Los Nomai dispararon la Estación Solar pero no tuvo efecto en el sol. Concluyeron que la Estación Solar nunca podría causar que el sol se convierta en supernova.",
                "Tras el fracaso de la Estación Solar, los Nomai se tomaron un descanso para investigar el cometa recién llegado.",
                "Según una computadora Nomai, nuestro sol ha llegado al final de su ciclo de vida natural."
            ]),
            NodoRumor(id: "bhf", titulo: "Forja del\nAgujero Negro", urlImagen: "https://outerwilds.ventures/assets/BH_BLACK_HOLE_FORGE-1SDsy3k-.jpg", colorTarjeta: colorNaranja, colorSobreTarjeta: colorNaranjaClaro, posicion: CGPoint(x: -250, y: 300), tamaño: .mediana, detalles: [
                "El punto de alineación de una torre de distorsión no es su receptor. Más bien, una torre de distorsión siempre se alinea con el centro de su cuerpo astral correspondiente.",
                "El receptor de distorsión debe estar ubicado en (o en una órbita cercana a) el cuerpo astral relevante.",
                "Los Gemelos Reloj de Arena están tan cerca que funcionan como un solo cuerpo astral, con un punto de alineación compartido entre ellos.",
                "Todas las torres de distorsión se estaban construyendo en Gemelo Ceniza, mientras que los seis receptores se construían en diferentes ubicaciones.",
                "Un Nomai llamado Poke forjó con éxito un núcleo de distorsión avanzado para el Proyecto Gemelo Ceniza."
            ]),
            NodoRumor(id: "aad", titulo: "Diagrama de\nÁngulo de\nAlineación", urlImagen: imagenPorDefecto, colorTarjeta: colorNaranja, colorSobreTarjeta: colorNaranjaClaro, posicion: CGPoint(x: -130, y: 450), tamaño: .pequeña, detalles: [
                "Un diagrama que representa el ángulo de alineación entre una torre de distorsión y su cuerpo astral correspondiente.",
                "Los ángulos de alineación de las torres no son exactos. Solo necesitan estar a menos de cinco grados del centro del cuerpo astral.",
                "Esto resulta en ventanas de distorsión ligeramente más largas que duran aproximadamente varios segundos.",
                "Cualquiera que entre en la plataforma de distorsión durante la ventana activa será distorsionado inmediatamente."
            ]),
            NodoRumor(id: "si", titulo: "Isla de las\nEstatuas", urlImagen: "https://outerwilds.ventures/assets/GD_STATUE_ISLAND-Q1kBDiut.jpg", colorTarjeta: colorNaranja, colorSobreTarjeta: colorNaranjaClaro, posicion: CGPoint(x: 400, y: -250), tamaño: .mediana, detalles: [
                "Esta isla debe ser donde los Nomai crearon estatuas como la de nuestro observatorio.",
                "Encontré una estatua Nomai tirada en la playa. Se ve exactamente igual a la de nuestro observatorio."
            ]),
            NodoRumor(id: "sw", titulo: "Taller de\nEstatuas", urlImagen: "https://outerwilds.ventures/assets/GD_STATUE_WORKSHOP-1SF2HiR9.jpg", colorTarjeta: colorNaranja, colorSobreTarjeta: colorNaranjaClaro, posicion: CGPoint(x: 250, y: -120), tamaño: .pequeña, detalles: [
                "Las estatuas Nomai fueron diseñadas para emparejarse con un solo usuario, grabar sus recuerdos y enviarlos a una unidad de almacenamiento dentro del Proyecto Gemelo Ceniza.",
                "Cada unidad de almacenamiento dentro del Proyecto Gemelo Ceniza estaba equipada con una máscara (la contraparte de la estatua), que luego podía devolver esos recuerdos almacenados al usuario correspondiente.",
                "Las estatuas fueron diseñadas para activarse solo una vez que el Proyecto Gemelo Ceniza tuviera éxito, o en caso de que fallara."
            ]),
            NodoRumor(id: "nm", titulo: "Minas\nNomai", urlImagen: "https://outerwilds.ventures/assets/TH_NOMAI_MINE-w6HKKWJl.jpg", colorTarjeta: colorNaranja, colorSobreTarjeta: colorNaranjaClaro, posicion: CGPoint(x: 400, y: 300), tamaño: .mediana, detalles: [
                "Los Nomai extrajeron mineral de este sitio para fabricar una carcasa protectora diseñada para sellar físicamente la cámara central dentro de Gemelo Ceniza.",
                "Una vez terminada la carcasa, los Nomai verificaron que ya no hubiera entradas físicas ni grietas.",
                "Los Nomai descubrieron una especie de formas de vida semiacuáticas de cuatro ojos en las vías fluviales cerca de la mina."
            ]),
            NodoRumor(id: "vts", titulo: "Sitio de Pruebas\nVolcánicas", urlImagen: "https://outerwilds.ventures/assets/VM_VOLCANO-Ep2JtedZ.jpg", colorTarjeta: colorNaranja, colorSobreTarjeta: colorNaranjaClaro, posicion: CGPoint(x: 750, y: 300), tamaño: .mediana, detalles: [
                "Muestras de mineral de las Minas Nomai en Timber Hearth fueron enviadas a este volcán para pruebas de durabilidad.",
                "Los Nomai intentaban fabricar una carcasa a prueba de supernovas (brevemente) para encerrar el Proyecto Gemelo Ceniza.",
                "Incluso la más pequeña grieta o abertura en la carcasa protectora destruiría todo."
            ])
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

