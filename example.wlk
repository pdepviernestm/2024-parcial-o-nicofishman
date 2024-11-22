import emociones.*

/*
- Averiguar si una persona es adolescente. Los expertos en las emociones informan que la etapa de adolescencia arranca con 12 años y termina cuando cumple 19.
- Hacer que una persona tenga una nueva emoción.
- Averiguar si está por explotar emocionalmente, lo que ocurre cuando todas las emociones de la persona pueden liberarse.
- Representar que una persona viva un evento, con las consecuencias que ello puede implicar.
- Permitir modificar el valor para considerar elevada la intensidad de las emociones
- Hacer que todos los integrantes de un grupo de personas vivan un mismo evento. 
*/

class Persona {
  var property edad
  var property emociones = []

  method esAdolescente() {
    return edad >= 12 && edad <= 19
  }

  method agregarEmocion(emocion) {
    emociones.add(emocion)
  }

  method estaPorExplotar() {
    return emociones.all({e => e.puedeLiberarse()})
  }

  method vivirEvento(evento) {
    emociones.forEach({e => e.liberarse(evento)})
  }

  method modificarValorMinimoIntensidad(valor) {
    emociones.forEach({e => e.valorMinimoIntensidad(valor)})
  }
}

class GrupoDePersonas {
  var property personas = []

  method vivirEvento(evento) {
    personas.forEach({p => p.vivirEvento(evento)})
  }
}