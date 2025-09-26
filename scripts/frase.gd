extends VBoxContainer

var frase = ["VERMELHO", "EM", "GREENVILLE"]

func check_phrase() -> bool:
	var resposta = []
	for linha in get_children():
		var palavra = ""
		for letra in linha.get_children():
			var label = letra.get_node("Label")
			palavra += label.text
		resposta.append(palavra)
		
	if(resposta == frase):
		print("✔ Código correto!")
		return true
	else:
		print("❌ Ainda não...")
		return false
