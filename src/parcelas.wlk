import plantas.*

class Parcela {
	var property  ancho
	var property  largo
	var property plantas = []
	var property horasDeSolQueRecibe
	
	
	method superficie() {
		return ancho * largo
	}
	
	method cantidadDePlantas() {
		return self.plantas().size()
	}
	
	method cantidadMaxima() {
		if(ancho > largo) {
			return self.superficie() / 5
		}
		else { return self.superficie() /3 + largo }
	}
	
	method tieneComplicaciones()   {
		return plantas.any({ planta => planta.horasDeSol() < self.horasDeSolQueRecibe()} )
}
	
	method capacidadDePlantas() {
		return  plantas.sum({ planta => planta.espacio() } )
	}
	method puedePlantar(planta) {
		return self.capacidadDePlantas() + planta.espacio() < self.cantidadMaxima()
	or(self.horasDeSolQueRecibe() - planta.horasDeSol() ) < 2 
	}
	
	method plantar(planta) {
			if(self.puedePlantar(planta)) {
				
 		 		plantas.add(planta)
			}
		else { self.error("nose puede agregar") }
		
		
		
	}
	method ningunaSupera() {
		return plantas.all({planta =>   planta.altura() < 1.5 })
	}
	
	
	
	}
	
	class ParcelaEcologica inherits Parcela {
		method seAsociaBien(planta) {
			return not self.tieneComplicaciones() and
				planta.parcelaIdeal(self)
			}
	}
	
	class ParcelaIndustrial inherits Parcela {
			method seAsociaBien(planta) {
				return planta.esFuerte() and
				plantas.size() <= 2
			}
	}
	
	
	
	
	
	
 