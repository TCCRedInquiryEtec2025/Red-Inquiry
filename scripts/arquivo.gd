extends Carta


func _on_interacted(_body: Variant) -> void:
	GameState.setValue("arquivo", !GameState.getValue("arquivo"))
	queue_free()

func _ready() -> void:
	texto = "William Goldberg, notório mafioso com operações em Modest Valley. A extensão de suas operações é desconhecida, mas pode-se especular sua participação ativa no mercado ilegal de entorpecentes.\nÉ frequentemente avistado nas periferias de Modest Valley pelos moradores das áreas. Possíveis locais de negociação? Majoritariamente avistado nas periferias do bairro Kennedy Garden. Boatos de atuações criminosas no bairro de Greenville.A Polícia tentou prendê-lo a aproximadamente três anos, sem sucesso. O sujeito conseguiu eliminar quaisquer provas de seu envolvimento com o Caso “Velvet”. O julgamento se encerrou com o “Don Goldberg” saindo ileso das acusações.\nO Delegado Mário Florenza, amigo e conivente com minha investigação, foi demitido de seu cargo após seu envolvimento e responsabilização pelo Caso “Velvet”. Sinais da influência de Don Goldberg nessa demissão são claros.\nAntes da demissão ele investigava contatos indefinidos entre o mafioso e correspondentes chineses. O motivo permanece desconhecido visto o fim de todas as investigações relacionadas a Goldberg (Mais um sinal claro da influência do Mafioso)."
