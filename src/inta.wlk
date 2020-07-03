import parcelas.*
import plantas.*

object inta {
	var property parcelas = #{}
	
	method agregarParcela(parcela) {
		parcelas.add(parcela)
	} 
	method promedioDePlantas() {
		return parcelas.sum({ p => p.cantidadDePlantas()}) /
			parcelas.size()
	}
	
	method parcelaAutosustentable() {
		return parcelas.max({ p => p.parcelaConMasDe4()})
	}
	
	method parcelaConMasDe4() {
		return parcelas.filter({p => p.cantidadDePlantas() > 4 })
	}
}
