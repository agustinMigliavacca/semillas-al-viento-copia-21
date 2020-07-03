import parcelas.*
class Planta {
	var property anioDeObtencion
	var property altura
	var property horasDeSol = 7 
	method esFuerte() {
		return horasDeSol  > 9 
	}
	
	method daSemillas() {
		return self.esFuerte()
	}
	
	method espacio() 
	
	method parcelaIdeal(parcela)

}


class Menta inherits Planta {
	override method daSemillas() {
		return super() or  altura > 0.4
	}
	
	override method espacio() {
		return altura + 1 
	}
	override method parcelaIdeal(parcela) {
		return parcela.superficie() > 6 
	}
 	
}

class Soja inherits Planta {
	override method horasDeSol() {
		if(altura < 0.5) {
			return 6
		}
		else if (altura.between(0.5, 1)) {
			return 8
		}
		else { return 12 }
	}
	
	override method daSemillas() {
		return super() and self.anioDeObtencion() > 2007
		and altura.between(0.75, 0.90)
	}
	
	override method espacio() {
		return altura / 2
	}
	
	
	override method parcelaIdeal(parcela) {
		return self.horasDeSol() == parcela.horasDeSolQueRecibe()
	}
	
	
}

class Quinoa inherits Planta {
	var property espacioQueOcupa
		
	override method espacio() {
		return espacioQueOcupa
		
	}
	override method  horasDeSol() {
		if(self.espacio() < 0.3) {
			return  10
		}
		
		else { return horasDeSol}
	}
	
	override method daSemillas() {
		return super() or self.anioDeObtencion().between(2001, 2008)
	}
	
	override method parcelaIdeal(parcela) {
		return parcela.ningunaSupera()
		
	}	
}


class SojaTransgenica inherits Soja {
	override method daSemillas() {
		return false
	}
	
	override method parcelaIdeal(parcela) { 
		return parcela.cantidadDeMaxima() == 1
	}
}

class Peperina inherits Menta {
	
	override method espacio() {
		return super() * 2
	}
}




	