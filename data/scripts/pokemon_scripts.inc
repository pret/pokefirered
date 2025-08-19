Common_EventScript_Pokemon_Geodude::
	faceplayer
	waitse
	applymovement VAR_LAST_TALKED, Common_Movement_ExclamationMark
	waitmovement 0
	playmoncry SPECIES_GEODUDE, CRY_MODE_NORMAL
	namebox Name_Geodude
	msgbox Common_Text_Pokemon_Geodude
	closemessage
	waitmoncry
	applymovement VAR_LAST_TALKED, Common_Movement_FaceOriginalDirection
	waitmovement 0
	release
	end

Common_EventScript_Pokemon_Psyduck::
	faceplayer
	waitse
	applymovement VAR_LAST_TALKED, Common_Movement_ExclamationMark
	waitmovement 0
	playmoncry SPECIES_PSYDUCK, CRY_MODE_NORMAL
	namebox Name_Psyduck
	msgbox Common_Text_Pokemon_Psyduck
	closemessage
	waitmoncry
	applymovement VAR_LAST_TALKED, Common_Movement_FaceOriginalDirection
	waitmovement 0
	release
	end
	
Common_EventScript_Pokemon_Voltorb::
	faceplayer
	waitse
	applymovement VAR_LAST_TALKED, Common_Movement_ExclamationMark
	waitmovement 0
	playmoncry SPECIES_VOLTORB, CRY_MODE_NORMAL
	namebox Name_Voltorb
	msgbox Common_Text_Pokemon_Voltorb
	closemessage
	waitmoncry
	applymovement VAR_LAST_TALKED, Common_Movement_FaceOriginalDirection
	waitmovement 0
	release
	end

Common_EventScript_Pokemon_Sandshrew::
	faceplayer
	waitse
	applymovement VAR_LAST_TALKED, Common_Movement_ExclamationMark
	waitmovement 0
	playmoncry SPECIES_SANDSHREW, CRY_MODE_NORMAL
	namebox Name_Sandshrew
	msgbox Common_Text_Pokemon_Sandshrew
	closemessage
	waitmoncry
	applymovement VAR_LAST_TALKED, Common_Movement_FaceOriginalDirection
	waitmovement 0
	release
	end

Common_EventScript_Pokemon_Clefairy::
	faceplayer
	waitse
	applymovement VAR_LAST_TALKED, Common_Movement_ExclamationMark
	waitmovement 0
	playmoncry SPECIES_CLEFAIRY, CRY_MODE_NORMAL
	namebox Name_Clefairy
	msgbox Common_Text_Pokemon_Clefairy
	closemessage
	waitmoncry
	applymovement VAR_LAST_TALKED, Common_Movement_FaceOriginalDirection
	waitmovement 0
	release
	end

Common_Text_Pokemon_Geodude::
.string "¡Geo!$"

Common_Text_Pokemon_Psyduck::
.string "¡Psy!$"

Common_Text_Pokemon_Voltorb::
.string "¡Volt!$"

Common_Text_Pokemon_Sandshrew::
.string "¡Shrew!$"

Common_Text_Pokemon_Clefairy::
.string "¡Clefa!$"