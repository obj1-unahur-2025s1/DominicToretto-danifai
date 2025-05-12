object dominique{
    const autos = #{}

    method autos() = autos

    method comprarAuto(unAuto){
        autos.add(unAuto)
    }

    method noEstanEnCondiciones() = autos.filter({auto => !auto.estaEnCondiciones()})

    method enviarATaller(){
        taller.recibirAutos(self.noEstanEnCondiciones())
    }

    method trabajarEnTaller(){taller.repararAutos()}

    method hacerPruebaDeVelocidad(){
        autos.forEach({auto => auto.pruebaDeVelocidad()})
    }

    method venderAutos(){
        autos.clear()
    }

    method promedioVelocidadesMaximas() = autos.sum({auto => auto.velocidadMaxima()}) / autos.size()

    method autosEnCondiciones() = autos.filter({auto => auto.estaEnCondiciones()})

    method autoMasRapidoEnCondiciones() = self.autosEnCondiciones().max({auto => auto.velocidadMaxima()})

    method velocidadMaximaTodosLosAutos() = autos.max({auto => auto.velocidadMaxima()}).velocidadMaxima()

    method velocidadMaximaMayorAlDobleDelPromedio() = self.velocidadMaximaTodosLosAutos() > (self.promedioVelocidadesMaximas() * 2)

}

object taller{
    const autosAReparar = #{}

    method autosAReparar() = autosAReparar

    method recibirAutos(autosParaReparar){
        autosAReparar.addAll(autosParaReparar)
    }

    method repararAutos(){
        autosAReparar.forEach({auto => 
            auto.reparar()
            autosAReparar.remove(auto)
        })
    }
}

object ferrari {
    var property funcionamientoMotor = 87

    method estaEnCondiciones() = funcionamientoMotor >= 65

    method reparar(){funcionamientoMotor = 100}

    method velocidadMaxima() = 110 + self.coeficienteMotor()

    method coeficienteMotor(){
        if (funcionamientoMotor > 75){
            return 15
        } else {
            return 0
        }
    }

    method pruebaDeVelocidad() {
        funcionamientoMotor = 0.max(funcionamientoMotor - 30)
    }

}

object flechaRubi{
    var property nivelCombustible = 100
    var property color = azul
    var property tipoCombustible = gasolina

    method estaEnCondiciones() = self.tipoCombustible().condicionParaCorrer(nivelCombustible) && self.color().sirveParaCorrer()

    method reparar(){
        nivelCombustible *= 2
        self.color(color.cambioReparacion())
    }

    method pruebaDeVelocidad(){
        nivelCombustible = 0.max(nivelCombustible - 5)
    }

    method velocidadMaxima() = self.tipoCombustible().velocidad(nivelCombustible * 2)
}

object gasolina{
    method condicionParaCorrer(litrosCombustible) = litrosCombustible > 85
    method velocidad(velocidadDelAuto) = velocidadDelAuto + 10
}

object nafta{
    method condicionParaCorrer(litrosCombustible) = litrosCombustible > 50
    method velocidad(velocidadDelAuto) = velocidadDelAuto - velocidadDelAuto * 0.1
}

object nitrogenoLiquido{
    method condicionParaCorrer(litrosCombustible) = litrosCombustible > 0
    method velocidad(velocidadDelAuto) = velocidadDelAuto * 10
}

object azul{
    method sirveParaCorrer() = false
    method cambioReparacion() = verde
}

object verde{
    method sirveParaCorrer() = false
    method cambioReparacion() = rojo
}

object rojo{
    method sirveParaCorrer() = true
    method cambioReparacion() = azul
}

object intocable{
    var estaEnCondiciones = true

    method estaEnCondiciones() = estaEnCondiciones

    method pruebaDeVelocidad(){estaEnCondiciones = false}

    method reparar(){estaEnCondiciones = true}

    method velocidadMaxima() = 45
}