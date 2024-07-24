extends Node2D

# Variables
var player: Node2D
var projectile_scene: PackedScene
var launch_interval: float = 2.0
var time_since_last_launch: float = 0.0

# Nodes
onready var launch_point: Position2D = $LaunchPoint

func _ready():
    # Replace 'res://path_to_your_projectile_scene.tscn' with the actual path to your projectile scene
    projectile_scene = preload("res://path_to_your_projectile_scene.tscn")
    # Get the player node, assuming it's named "Player" in the scene tree
    player = get_node("/root/Main/Player")

func _process(delta):
    time_since_last_launch += delta
    if time_since_last_launch >= launch_interval:
        launch_projectile()
        time_since_last_launch = 0.0

func launch_projectile():
    var projectile = projectile_scene.instance() as KinematicBody2D
    get_parent().add_child(projectile)
    projectile.position = launch_point.global_position

    # Calculate direction to the player
    var direction = (player.global_position - projectile.position).normalized()
    projectile.set_direction(direction)
