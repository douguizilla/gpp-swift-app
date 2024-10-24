//
//  Faq.swift
//  gpp-swift-app
//
//  Created by Douglas Gomes de Paula on 24/10/24.
//
import Foundation

struct Faq : Hashable{
    let id: String = UUID().uuidString
    var course: [CourseFaq]
    var targetAudience: String
    var subject: String
    var question: String
    var answer: String
    var topics : [TopicFaq]
    
    
    static let sample = [
        Faq(
            course: [CourseFaq(
                course: "Mestrado Acadêmico em Ciência da Computação",
                link: "https://ppgco.facom.ufu.br/cursos/mestrado/mestrado-academico-em-ciencia-da-computacao"
            )],
            targetAudience: "Estudante / Comunidade externa",
            subject: "Auxílio financeiro / Projetos / Serviços",
            question: "O curso de Mestrado é gratuito?",
            answer: "Sim. Não há pagamento de mensalidade nem de qualquer outra taxa.",
            topics: [
                TopicFaq(topic: "Mestrado", link: "https://ppgco.facom.ufu.br/cursos/mestrado/mestrado-academico-em-ciencia-da-computacao")
            ]
        ),
        Faq(
            course: [
                CourseFaq(
                    course: "Doutorado Acadêmico em Ciência da Computação",
                    link: "https://ppgco.facom.ufu.br/cursos/doutorado/doutorado-academico-em-ciencia-da-computacao"
                ),
                CourseFaq(
                    course: "Mestrado Acadêmico em Ciência da Computação",
                    link: "https://ppgco.facom.ufu.br/cursos/mestrado/mestrado-academico-em-ciencia-da-computacao"
                )
            ],
            targetAudience: "Estudante / Professor / Técnico-Administrativo",
            subject: "Disciplinas / Mestrado / Serviços",
            question: "Aproveitamento de créditos",
            answer: "Para solicitar aproveitamento de créditos no Programa de Pós Graduação em Ciência da Computação - PPGCO, é necessário atender alguns requisitos e enviar somente VIA PORTAL DO ALUNO\n\n1 - Disciplinas cursadas em semestres anteriores no presente programa.\n\n2 - Disciplinas cursadas em outro instituto de ensino pós graduação (Stritu Senso) pública ou privada.\n\n3 - Disciplinas cursadas como aluno especial do Programa de Pós Graduação em Ciência da Computação.\n\n4 - Validação do orientador do discente.\n\n5 - Documentos oficiais emitidas pelas instituições de pós graduação contendo informações de Carga Horária, Conceito e Créditos.\n\nPasso 1 - entre no PORTAL DO ALUNO e faça a solicitação informando as disciplinas cursadas na UFU ou outro instituto de ensino pós graduação (Stritu Senso) pública ou privada.\n\nPasso 2 - A solicitação chegará para o Programa de Pós Graduação em Ciência da Computação e enviaremos para o orientador do discente para validação.\n\nPasso 3 - Faremos o processo tramitado via SG e SEI, e sem pedências, a aprovação do Coordenador do Programa de Pós Graduação em Ciência da Computação.",
            topics: [
                TopicFaq(
                    topic: "serviços",
                    link: "https://ppgco.facom.ufu.br/tags/servicos"
                ),
                TopicFaq(
                    topic: "serviçoss",
                    link: "https://ppgco.facom.ufu.br/tags/servicos"
                ),
                TopicFaq(
                    topic: "serviçosss",
                    link: "https://ppgco.facom.ufu.br/tags/servicos"
                ),
                
            ]
        ),
        Faq(
            course: [CourseFaq(
                course: "Mestrado Acadêmico em Ciência da Computação",
                link: "https://ppgco.facom.ufu.br/cursos/mestrado/mestrado-academico-em-ciencia-da-computacao"
            )],
            targetAudience: "Estudante / Comunidade externa",
            subject: "Processos seletivos",
            question: "Posso cursar disciplinas como Aluno Especial no PPGCO-UFU?",
            answer: "Sim. Há vagas para alunos especiais no curso de Mestrado do PPGCO-UFU. O interessado deve sempre estar atento à divulgação dos editais de seleção para Alunos Especiais.",
            topics: [TopicFaq(topic: "aluno especial", link: "https://ppgco.facom.ufu.br/tags/aluno-especial")]
        )
    ]
}

struct CourseFaq : Hashable{
    var course: String
    var link: String
}

struct TopicFaq : Hashable{
    var topic : String
    var link: String
}
