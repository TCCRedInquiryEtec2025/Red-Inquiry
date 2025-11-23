extends PanelContainer

@onready var foto = $CenterContainer/StylePanel/MarginContainer/Layout/ContainerBottom/ContainerTab/ContainerLeft/MarginContainer/TextureRect
@onready var nome = $CenterContainer/StylePanel/MarginContainer/Layout/ContainerBottom/ContainerTab/ContainerLeft/ContainerInfo/ContainerNome/RichTextLabel2
@onready var funcao = $CenterContainer/StylePanel/MarginContainer/Layout/ContainerBottom/ContainerTab/ContainerLeft/ContainerInfo/ContainerFuncao/RichTextLabel2
@onready var texto = $CenterContainer/StylePanel/MarginContainer/Layout/ContainerBottom/ContainerTab/CenterContainer/RichTextLabel
@onready var github = $CenterContainer/StylePanel/MarginContainer/Layout/ContainerBottom/ContainerTab/ContainerLeft/ContainerInfo/ContainerRedes/ContainerBotoesRedes/ButtonGithub
@onready var instagram = $CenterContainer/StylePanel/MarginContainer/Layout/ContainerBottom/ContainerTab/ContainerLeft/ContainerInfo/ContainerRedes/ContainerBotoesRedes/ButtonInstagram
@onready var youtube = $CenterContainer/StylePanel/MarginContainer/Layout/ContainerBottom/ContainerTab/ContainerLeft/ContainerInfo/ContainerRedes/ContainerBotoesRedes/ButtonYoutube

var current_github_url := ""
var current_instagram_url := ""
var current_youtube_url := ""

var icon_open = preload("res://assets/icons/open-folder_12075773.png")
var icon_closed = preload("res://assets/icons/user-folder_12075473.png")

var members = {
	"ButtonPedro":{
		"nome": "Pedro P. Rodrigues",
		"funcao": "Programação",
		"texto": "Como dizia Aristóteles, a soma dos catetos é igual a soma dos quadrados.",
		"foto": preload("res://assets/fotos/pedro.jpg"),
		"github": "https://github.com/Pauloonada",
		"instagram": "https://www.instagram.com/pedroprdgs/",
		"youtube": "https://www.youtube.com/@Pauloonada"
	},
	"ButtonLevi":{
		"nome": "Levi Aparecido da S. Alcântara",
		"funcao": "Design",
		"texto": "“Um homem sábio pode considerar a vida uma comédia, uma tragédia ou uma farsa, e ainda assim gozá-la.”",
		"foto": preload("res://assets/fotos/levi.jpg"),
		"github": "https://github.com/LeviAlcantara",
		"instagram": "https://www.instagram.com/levi_aparecido_/",
		"youtube": ""
	},
	"ButtonRiam":{
		"nome": "Riam Diego P. Marques",
		"funcao": "Desenvolvimento",
		"texto": "Com certeza, um dos caras do projeto",
		"foto": preload("res://assets/fotos/riam.jpg"),
		"github": "https://github.com/RiamDiego",
		"instagram": "",
		"youtube": ""
	},
	"ButtonYuri":{
		"nome": "Yuri Acosta Navarro",
		"funcao": "História/Roteiro",
		"texto": "Um Homem não é nada sem seu chapéu.",
		"foto": preload("res://assets/fotos/yuri.jpg"),
		"github": "",
		"instagram": "",
		"youtube": ""
	},
	"ButtonBernardo":{
		"nome": "Bernardo",
		"funcao": "Sonorização",
		"texto": "“Você é autista”\n- De acordo com qualquer pessoa que me conhece",
		"foto": preload("res://assets/fotos/bernardo.jpg"),
		"github": "",
		"instagram": "https://www.instagram.com/dmoneggs/",
		"youtube": ""
	},
	"ButtonIago":{
		"nome": "Iago Anjos da Silva",
		"funcao": "Dublagem",
		"texto": "“BEHOLD THE POWER OF AN ANGEL!”",
		"foto": preload("res://assets/fotos/iago.jpg"),
		"github": "https://github.com/ImFenyx",
		"instagram": "",
		"youtube": ""
	},
	"ButtonGabriel":{
		"nome": "Gabriel Soares",
		"funcao": "Artista",
		"texto": "Tudo e todos dizem que vai dar errado, e vai mesmo. O importante é levantar e tentar de novo, até que dê certo",
		"foto": preload("res://icon.svg"),
		"github": "",
		"instagram": "https://www.instagram.com/dogzu_cdt/",
		"youtube": ""
	}
}

func _ready() -> void:
	var group = $CenterContainer/StylePanel/MarginContainer/Layout/ContainerTop/ContainerFichas/ButtonPedro.button_group
	group.pressed.connect(_on_button_membro_pressed)
	
	github.pressed.connect(_open_github)
	instagram.pressed.connect(_open_instagram)
	youtube.pressed.connect(_open_youtube)
	
	$CenterContainer/StylePanel/MarginContainer/Layout/ContainerTop/ContainerFichas/ButtonPedro.button_pressed = true
	
	
func _on_button_membro_pressed(button) -> void:	
	var key = button.name
	
	if(!members.has(key)):
		return
		
	update_icons(button)
	var data = members[key]
	
	nome.text = data["nome"]
	funcao.text = data["funcao"]
	texto.text = data["texto"]
	foto.texture = data["foto"]
	
	github.visible = data["github"] != ""
	instagram.visible = data["instagram"] != ""
	youtube.visible = data["youtube"] != ""
	
	current_github_url = data["github"]
	current_instagram_url = data["instagram"]
	current_youtube_url = data["youtube"]
	
	$CenterContainer/StylePanel/MarginContainer/Layout/ContainerBottom/ContainerTab/ContainerLeft/ContainerInfo/ContainerRedes.visible = (github.visible or instagram.visible or youtube.visible)
	

func update_icons(clicked_button: Button) -> void:
	var group = clicked_button.button_group
	
	for button in group.get_buttons():
		if(button == clicked_button):
			button.icon = icon_open
		else:
			button.icon = icon_closed


func _open_github():
	if(current_github_url != ""):
		OS.shell_open(current_github_url)


func _open_instagram():
	if(current_instagram_url != ""):
		OS.shell_open(current_instagram_url)
		
		
func _open_youtube():
	if(current_youtube_url != ""):
		OS.shell_open(current_youtube_url)
