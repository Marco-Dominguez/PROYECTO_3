//
//  galeria_personajes.swift
//  PROYECTO_3
//
//  Created by Marco Dominguez on 24/02/26.
//
import Foundation
import SwiftUI
internal import Combine

class GaleriaPersonajes: ObservableObject {
    @Published var personajes: [PersonajeModelo] = []
    
    init() {
        cargarPersonajes()
    }
    
    private func cargarPersonajes() {
        personajes = [
            PersonajeModelo(
                nombre: "Gabbro",
                descripcion: "Un astronauta muy relajado que pasa su tiempo tocando la flauta en el Abismo del Gigante. Parece ser el único, además de ti, que es consciente del bucle temporal.",
                urlImagen: "https://static.wikia.nocookie.net/outerwilds_gamepedia/images/c/cc/Gabbro.jpg/revision/latest/scale-to-width-down/1200?cb=20211017172115",
                objetos: ["Flauta Hearthiana", "Nave Espacial", "Estatua Nomai"]
            ),
            PersonajeModelo(
                nombre: "Riebeck",
                descripcion: "Arqueólogo Hearthiano asustadizo pero apasionado. Toca el banjo y ha establecido su campamento en las entrañas del Cruce Quebradizo.",
                urlImagen: "https://static.wikia.nocookie.net/outerwilds_gamepedia/images/f/fe/Riebeck.jpg/revision/latest?cb=20190716001215",
                objetos: ["Banjo", "Grabadora de voz", "Equipo de arqueología"]
            ),
            PersonajeModelo(
                nombre: "Feldespato",
                descripcion: "El mejor piloto de Lumbre y una leyenda viviente. Desapareció hace mucho tiempo, pero su armónica aún se puede escuchar resonando en el sistema solar.",
                urlImagen: "https://static.tvtropes.org/pmwiki/pub/images/feldspar_6.jpg",
                objetos: ["Armónica", "Nave estrellada", "Lata de malvaviscos"]
            ),
            PersonajeModelo(
                nombre: "Chert",
                descripcion: "El astrónomo del programa espacial. Acampa en los Gemelos Reloj de Arena observando las estrellas, pero últimamente ha notado que las supernovas son demasiado frecuentes.",
                urlImagen: "https://static.wikia.nocookie.net/outerwilds_gamepedia/images/c/c2/Chert.png/revision/latest?cb=20211017171706",
                objetos: ["Tambores", "Telescopio", "Cartas astrales"]
            )
        ]
    }
}
