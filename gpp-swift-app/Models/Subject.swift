//
//  Subject.swift
//  gpp-swift-app
//
//  Created by Douglas Gomes de Paula on 11/03/24.
//

import Foundation

struct Subject : Codable, Hashable, Identifiable {
    var id: String = UUID().uuidString
    var code: String
    var title: String
    var group: String
    var credits: String
    var workload: String
    var generalObjectives: String
    var url: String
    var status: SubjectStatus
    var semester: Int = 1
    
    var codeString : (String, String) {
        let code = code.split(separator: "-")
        return (String(code[0]),String(code[1]))
    }
}

extension Subject {
    static let sampleList : [Subject] = [
        Subject(
            code: "PGC-001",
            title: "Metodologia de Pesquisa em Computação",
            group: "Núcleo de Formação Teórica",
            credits: "5",
            workload: "90 horas",
            generalObjectives: "Introduzir as técnicas básicas de eficiência de algoritmos, com cálculo de tempo de pior caso e tempo médio. Isto é feito com a apresentação de um grande número de algoritmos que servem de ponto de partida para o desenvolvimento de novos algoritmos. Considera-se também uma introdução ao estudo comparativo dos principais métodos de computação, particularmente nos aspectos de complexidade de tempo e de espaço de problemas computacionais. ",
            url: "http://www.ppgco.facom.ufu.br/disciplinas/analise-de-algoritmos",
            status: .NAO_MATRICULADO,
            semester: 1
        ),
        Subject(
            code: "PGC-002",
            title: "Seminário em Computação 1",
            group: "Núcleo de Formação Teórica",
            credits: "5",
            workload: "90 horas",
            generalObjectives: "Introduzir as técnicas básicas de eficiência de algoritmos, com cálculo de tempo de pior caso e tempo médio. Isto é feito com a apresentação de um grande número de algoritmos que servem de ponto de partida para o desenvolvimento de novos algoritmos. Considera-se também uma introdução ao estudo comparativo dos principais métodos de computação, particularmente nos aspectos de complexidade de tempo e de espaço de problemas computacionais. ",
            url: "http://www.ppgco.facom.ufu.br/disciplinas/analise-de-algoritmos",
            status: .NAO_MATRICULADO,
            semester: 1
        ),
        Subject(
            code: "PGC-003",
            title: "Seminário em Computação 2",
            group: "Núcleo de Formação Teórica",
            credits: "5",
            workload: "90 horas",
            generalObjectives: "Introduzir as técnicas básicas de eficiência de algoritmos, com cálculo de tempo de pior caso e tempo médio. Isto é feito com a apresentação de um grande número de algoritmos que servem de ponto de partida para o desenvolvimento de novos algoritmos. Considera-se também uma introdução ao estudo comparativo dos principais métodos de computação, particularmente nos aspectos de complexidade de tempo e de espaço de problemas computacionais. ",
            url: "http://www.ppgco.facom.ufu.br/disciplinas/analise-de-algoritmos",
            status: .NAO_MATRICULADO,
            semester: 2
        ),
        Subject(
            code: "PGC-004",
            title: "Análise de Algoritmos",
            group: "Núcleo de Formação Teórica",
            credits: "5",
            workload: "90 horas",
            generalObjectives: "Introduzir as técnicas básicas de eficiência de algoritmos, com cálculo de tempo de pior caso e tempo médio. Isto é feito com a apresentação de um grande número de algoritmos que servem de ponto de partida para o desenvolvimento de novos algoritmos. Considera-se também uma introdução ao estudo comparativo dos principais métodos de computação, particularmente nos aspectos de complexidade de tempo e de espaço de problemas computacionais. ",
            url: "http://www.ppgco.facom.ufu.br/disciplinas/analise-de-algoritmos",
            status: .NAO_MATRICULADO,
            semester: 2
        ),
        Subject(
            code: "PGC-005",
            title: "Lógica para Ciência da computação",
            group: "Núcleo de Formação Teórica",
            credits: "5",
            workload: "90 horas",
            generalObjectives: "Introduzir as técnicas básicas de eficiência de algoritmos, com cálculo de tempo de pior caso e tempo médio. Isto é feito com a apresentação de um grande número de algoritmos que servem de ponto de partida para o desenvolvimento de novos algoritmos. Considera-se também uma introdução ao estudo comparativo dos principais métodos de computação, particularmente nos aspectos de complexidade de tempo e de espaço de problemas computacionais. ",
            url: "http://www.ppgco.facom.ufu.br/disciplinas/analise-de-algoritmos",
            status: .NAO_MATRICULADO,
            semester: 3
        )
    ]
}
