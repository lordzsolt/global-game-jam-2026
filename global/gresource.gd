extends Node

enum MaskType {
	Embarass,
	ConfidentLie, # Sales Expert
	Facts, # Interviewer
	Rage,
	Insult, # CEO
	BrownNosing,
	EmotionalManipulation, # HR Manager
	ShiftTheBlame,
	CallInSick # Idea Guy
}

var embarassmentTexture = preload("res://art/ArtAssets_Clean/Art_Masks/Mask_Embarrass.png")
var confidentLieTexture = preload("res://art/ArtAssets_Clean/Art_Masks/Mask_ConfidentLie.png")
var factsTexture = preload("res://art/ArtAssets_Clean/Art_Masks/Mask_Facts.png")
var rageTexture = preload("res://art/ArtAssets_Clean/Art_Masks/Mask_Rage.png")
var insultTexture = preload("res://art/ArtAssets_Clean/Art_Masks/Mask_Insult.png")
var brownNosingTexture = preload("res://art/ArtAssets_Clean/Art_Masks/Mask_Brownnose.png")
var emotionalManipulationTexture = preload("res://art/ArtAssets_Clean/Art_Masks/Mask_EmotionalManipulation.png")
var shiftTheBlameTexture = preload("res://art/ArtAssets_Clean/Art_Masks/Mask_ShiftTheBlame.png")
var callInSickTexture = preload("res://art/ArtAssets_Clean/Art_Masks/Mask_CallInSick.png")

var worn_embarassmentTexture = preload("res://art/ArtAssets_Clean/Art_Masks/WornMask_Embarrass.png")
var worn_confidentLieTexture = preload("res://art/ArtAssets_Clean/Art_Masks/WornMask_ConfidentLie.png")
var worn_factsTexture = preload("res://art/ArtAssets_Clean/Art_Masks/WornMask_Facts.png")
var worn_rageTexture = preload("res://art/ArtAssets_Clean/Art_Masks/WornMask_Rage.png")
var worn_insultTexture = preload("res://art/ArtAssets_Clean/Art_Masks/WornMask_Insult.png")
var worn_brownNosingTexture = preload("res://art/ArtAssets_Clean/Art_Masks/WornMask_Brownnose.png")
var worn_emotionalManipulationTexture = preload("res://art/ArtAssets_Clean/Art_Masks/WornMask_EmotionalManipulation.png")
var worn_shiftTheBlameTexture = preload("res://art/ArtAssets_Clean/Art_Masks/WornMask_ShiftTheBlame.png")
var worn_callInSickTexture = preload("res://art/ArtAssets_Clean/Art_Masks/WornMask_CallInSick.png")
