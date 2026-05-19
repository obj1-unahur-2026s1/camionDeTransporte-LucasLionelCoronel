import cosas.*
object camion {
    const carga = []

    method cargar(objeto) {
      carga.add(objeto)
      objeto.efectoAlCargar()
    }

    method descargar(objeto) {
      carga.remove(objeto)
    }

    method pesoTotal() {
      return 1000 + carga.sum({m => m.peso()})//1000 de la tara y la suma de los objetos.
    }

    method losObjetosSonPesosPares() {
      return carga.all({m => m.peso().even()})
    }

    method algunObjetoPesa(peso){
      return carga.any({m => m.peso()== peso})
    }

    method primeraCargaPeligrosa(nivel) {
      return carga.filter({m => m.peligro() >= nivel}).first()
    }

    method listaDeCargaPeligro(nivel) {
      return carga.filter({m => m.peligro() >= nivel})
    }

    method seExcede() {
      return self.pesoTotal() >= 2500
    }

    method nivelMayorA(nivel) {
      return carga.any({m => m.peligro() >= nivel})
    }

    method puedeCircularEnRuta(nivel) {
        return not self.seExcede() and not self.nivelMayorA(nivel)
    }
    //Agregados al camion

    method cosaMasPesada() = carga.max({m => m.peso()})

    method cosaQuePesaEntre(minimo, maximo) = carga.any({m => m.peso().between(minimo, maximo)})

}