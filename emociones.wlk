/*
Las emociones
Las emociones, si bien son propias de cada persona, tienen rasgos distintivos y ciertas características comunes entre diferentes personas. De esta manera, se identfifican, al menos inicialmente, ciertos estereotipos de emociones.
El valor para considerar elevada la intensidad de una emoción es el mismo para todas las personas y emociones, pero puede cambiarse en cualquier momento. 


Furia
La emoción de la furia consta de una serie de palabrotas que se van aprendiendo u olvidando con el tiempo. 
La furia de una persona puede liberarse si tiene una intensidad elevada y si conoce al menos una palabrota con más de 7 letras. La intensidad inicial es 100, pero puede variar.
Liberarse consiste en disminuir la intensidad tantas unidades como el impacto del evento. Además, olvida la primer palabrota aprendida. 


Alegría
No hay un valor inicial conocido para su intensidad, sino que depende de cada caso. Liberarse consiste en disminuir la intensidad tantas unidades como el impacto del evento. Nunca su intensidad puede ser negativa, sino que si por cualquier circunstancia se le quisiera dar un valor negativo, se le da el mismo valor, pero positivo. 
La alegría puede ser liberada cuando tiene una intensidad elevada y la cantidad de eventos vividos es par. 


Tristeza
La emoción de la tristeza de cualquier persona sabe que inicialmente su causa es la melancolía. Su intensidad puede variar sin limitaciones.
La tristeza puede ser liberada si su causa no sea precisamente la melancolía y su intensidad es elevada. 
Liberarse implica registrar como causa la descripción del evento vivido y disminuir la intensidad tantas unidades como el impacto del evento.


Desagrado y temor:
En ambos casos, pueden ser liberadas cuando tienen una intensidad elevada y la cantidad de eventos vividos es mayor que su propia intensidad. 
Liberarse implica disminuir la intensidad tantas unidades como el impacto del evento.
*/
class Emocion {
  var property intensidad
  var property valorMinimoIntensidad = 100
  var property eventosVividos = []
  
  method tieneIntensidadElevada() = intensidad >= valorMinimoIntensidad
  
  method puedeLiberarse() {
    return self.tieneIntensidadElevada()
  }

  method liberarse(evento) {
    if (self.puedeLiberarse()) {
      intensidad -= evento.impacto()
    }
  }
}

class Furia inherits Emocion(intensidad=100) {
  var property palabrotas = []

  method agregarPalabrota(palabrota) {
    palabrotas.add(palabrota)
  }

  override method puedeLiberarse() {
    return super() && palabrotas.any({p => p.size() > 7})
  }

  override method liberarse(evento) {
    super(evento)
    palabrotas = palabrotas.drop(1)
  }
}

class Alegria inherits Emocion {
  override method puedeLiberarse() {
    return super() && eventosVividos.size() % 2 == 0
  }

  override method liberarse(evento) {
    super(evento)
    if (intensidad < 0) {
      intensidad = intensidad * -1
    }
  }
}

class Tristeza inherits Emocion {
  var property causa = "melancolía"

  override method puedeLiberarse() {
    return super() && causa != "melancolía"
  }

  override method liberarse(evento) {
    super(evento)
    causa = evento.descripcion()
  } 
}

class EmocionGenerica inherits Emocion {
  override method puedeLiberarse() {
    return super() && eventosVividos.size() > intensidad
  }
}

class Desagrado inherits EmocionGenerica {}

class Temor inherits EmocionGenerica {} 

// NUEVA EMOCION: Ansiedad!

class Ansiedad inherits Emocion {
  override method puedeLiberarse() {
    return super() && eventosVividos.size() > 0
  }

  override method liberarse(evento) {
    super(evento)
    intensidad = 0
  }
}

// Los conceptos de polimorfismo y herencia me sirvieron para poder reusar código y no tener que repetir la lógica de liberarse en cada una de las clases. Además, me dejaron que cada emoción tenga su propia lógica de liberarse, sin tener que modificar la clase Emocion.