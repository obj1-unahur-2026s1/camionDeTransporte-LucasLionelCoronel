object knightRider {
    method peso() = 500
    method peligro() = 100
    method bulto() = 1
    method efectoAlCargar() {}
}

object bumblebee {
    var esRobot = false
    method peso() = 800

    method peligro(){
      return if(esRobot) 30 else 15
    }

    method transformar() {
      esRobot = true
    }

    method destransformar() {
      esRobot = false
    }

    method bulto() = 2

    method efectoAlCargar() { self.transformar()}
}

object paqueteDeLadrillos {
    var cantidadDeLadrillos = 0

    method peso() = 2 * cantidadDeLadrillos

    method agregarLadrillos(cantidad) {
      cantidadDeLadrillos += cantidad
    }

    method peligro() = 2

    method bulto() {
      return if(cantidadDeLadrillos <= 100){1}
      else if(cantidadDeLadrillos.between(101, 300)){2}
      else{3}
    }

    method efectoAlCargar() {self.agregarLadrillos(12)}
}


object arenaAGranel {
    var peso = 0

    method peso() = peso

    method agregarPeso(valor) {
      peso += valor
    }

    method quitarPeso(valor){
      peso = peso - valor.max(0)
    } 

    method peligro() = 1
    method bulto() = 1

    method efectoAlCargar() {self.quitarPeso(10)}
}

object bateriaAntiarea {
    var tieneMisiles = false

    method peso(){
       return if(tieneMisiles) 300 else 200
    }

    method agregarMisiles() {
      tieneMisiles = true
    } 

    method quitarMisiles() {
      tieneMisiles = false
    }

    method bulto(){
      return if(tieneMisiles) 2 else 1
    }

    method efectoAlCargar() {self.agregarMisiles()}
}

object contenedorPortuario {
    const objetosDentro = []

    method peso() = 100 + objetosDentro.sum({m => m.peso()})

    method peligro(){//Si esta vaio la lista de objetos dentro del contenedor es 0
      return if(objetosDentro.isEmpty()) 0 else objetosDentro.max({m => m.peligro()})
        }

    method agregarObjeto(objeto) {
      objetosDentro.add(objeto)
    }

    method agregarTodosLosObjetos(objetos) {
      objetosDentro.addAll(objetos)
    }

    method bulto() {
      return 1 + objetosDentro.sum({m => m.bulto()})
    }

    method efectoAlCargar() {objetosDentro.forEach({r => r.efectoAlCargar()})}
}

object residuosRadioactivos {
    var peso = 0

    method peso() = peso

    method agregarPeso(valor) {
      peso += valor
    }

    method quitarPeso(valor){
      peso = peso - valor.max(0)
    } 

    method peligro() = 200
    method bulto() = 1

    method efectoAlCargar() {self.agregarPeso(15)}
}

object embalajeDeSeguridad {
    var objetoDentro = knightRider
    method peso() = objetoDentro.peso()
    method peligro() = objetoDentro.peligro() / 2


    method embalar(objeto) {
      objetoDentro = objeto
    }

    method bulto() = 2

    method efectoAlCargar() {}
}

