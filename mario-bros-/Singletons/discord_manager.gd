extends Node

# This creates an instance of the class you provided directly in the scene tree
var presence: DiscordRichPresence

func _ready() -> void:
	presence = DiscordRichPresence.new()
	
	# SET YOUR APP ID *BEFORE* ADD_CHILD (As requested by the code comments!)
	presence.app_id = "1557073141950447646" 
	
	# Connect to the signals defined in your script
	presence.presence_connected.connect(_on_discord_connected)
	presence.presence_disconnected.connect(_on_discord_disconnected)
	
	# Adding the child triggers _ready() inside the plugin script, which calls connect_now()
	add_child(presence)
	
	# Set your default status
	update_status("test", "test")

func update_status(details_text: String, state_text: String) -> void:
	if not presence:
		return
		
	# Pass the Dictionary directly to the plugin's set_activity() method
	print("cool")
	#var current_scene = get_tree().get_scene().name
	presence.set_activity({
		"details": details_text,
		"state": state_text,
		"timestamps": {
			"start": int(Time.get_unix_time_from_system())
		},
		"assets": {
			#"large_image": "game_logo_key",
			"large_text": "something rolling" ,
			#"small_image": "active_icon_key",
			"small_text": "In-Game"
		}
	})
	#print(get_tree().get_scene().name)

func clear_status() -> void:
	if presence:
		presence.clear_activity()

func _on_discord_connected(user: Dictionary) -> void:
	print("Successfully connected to Discord! User: ", user.get("username", "Unknown"))

func _on_discord_disconnected() -> void:
	print("Disconnected from Discord client.")
