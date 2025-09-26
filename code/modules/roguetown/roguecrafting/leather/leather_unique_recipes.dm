// Unique class drip or something that might fit into another category
/datum/crafting_recipe/roguetown/leather/unique
	abstract_type = /datum/crafting_recipe/roguetown/leather/unique

/datum/crafting_recipe/roguetown/leather/unique/artipants
	name = "tinker trousers"
	result = list(/obj/item/clothing/under/roguetown/trou/artipants)
	reqs = list(/obj/item/natural/cloth = 1,
	            /obj/item/natural/hide/cured = 2)
	tools = list(/obj/item/needle)
	craftdiff = 3
	sellprice = 11

/datum/crafting_recipe/roguetown/leather/unique/baggyleatherpants
	name = "pontifex's chaqchur"
	result = list(/obj/item/clothing/under/roguetown/trou/leather/pontifex)
	reqs = list(/obj/item/natural/cloth = 1,
	            /obj/item/natural/fibers = 1,
	            /obj/item/natural/hide/cured = 2)
	tools = list(/obj/item/needle)
	craftdiff = 5
	sellprice = 20
		
/datum/crafting_recipe/roguetown/leatherunique/gladsandals
	name = "gladiator sandals"
	result = list(/obj/item/clothing/shoes/roguetown/gladiator)
	reqs = list(/obj/item/natural/hide/cured = 2,
	            /obj/item/natural/fibers = 1)
	tools = list(/obj/item/needle)
	craftdiff = 3
	sellprice = 12

/datum/crafting_recipe/roguetown/leather/unique/grenzelboots
	name = "grenzelhoftian boots"
	result = list(/obj/item/clothing/shoes/roguetown/grenzelhoft)
	reqs = list(/obj/item/natural/hide/cured = 1,
	            /obj/item/reagent_containers/food/snacks/tallow = 1,
				/obj/item/natural/fur = 1,
	            /obj/item/natural/fibers = 1)
	tools = list(/obj/item/needle)
	craftdiff = 6
	sellprice = 15
	
/datum/crafting_recipe/roguetown/leather/unique/valorianleatherpants
	name = "valorian leather trousers"
	result = list(/obj/item/clothing/under/roguetown/heavy_leather_pants/valorian)
	reqs = list(/obj/item/reagent_containers/food/snacks/tallow = 1,
	            /obj/item/natural/fibers = 1,
	            /obj/item/natural/hide/cured = 2,
				/obj/item/natural/fur = 1)
	tools = list(/obj/item/needle)
	craftdiff = 6
	sellprice = 30

/datum/crafting_recipe/roguetown/leather/unique/fencingbreeches
	name = "fencing breeches"
	result = list(/obj/item/clothing/under/roguetown/heavy_leather_pants/valorian/generic)
	reqs = list(/obj/item/natural/fibers = 1,
				/obj/item/natural/hide/cured = 2,
				/obj/item/natural/cloth = 4)
	tools = list(/obj/item/needle)
	craftdiff = 6
	sellprice = 20

/datum/crafting_recipe/roguetown/leather/unique/valorianboots
	name = "valorian leather boots"
	result = list(/obj/item/clothing/shoes/roguetown/boots/valorian)
	reqs = list(/obj/item/natural/hide/cured = 1,
	            /obj/item/reagent_containers/food/snacks/tallow = 1,
				/obj/item/natural/fur = 1,
	            /obj/item/natural/fibers = 1)
	tools = list(/obj/item/needle)
	craftdiff = 6
	sellprice = 25

/datum/crafting_recipe/roguetown/leather/unique/buckleshoes
	name = "buckled shoes"
	result = list(/obj/item/clothing/shoes/roguetown/simpleshoes/buckle)
	reqs = list(/obj/item/natural/hide/cured = 1,
	            /obj/item/natural/fibers = 2)
	tools = list(/obj/item/needle)
	craftdiff = 6
	sellprice = 25

/datum/crafting_recipe/roguetown/leather/unique/monkleather
	name = "pontifex's kaftan"
	result = list(/obj/item/clothing/suit/roguetown/armor/gambeson/heavy/pontifex)
	reqs = list(/obj/item/natural/hide/cured = 4,
	            /obj/item/natural/cloth = 1,
				/obj/item/reagent_containers/food/snacks/tallow = 1)
	tools = list(/obj/item/needle)
	craftdiff = 5
	sellprice = 23

/datum/crafting_recipe/roguetown/leather/unique/furlinedjacket
	name = "artificer jacket"
	result = list(/obj/item/clothing/suit/roguetown/armor/leather/jacket/artijacket)
	reqs = list(/obj/item/natural/hide/cured = 2,
				/obj/item/natural/fur = 1,
	            /obj/item/natural/cloth = 1)
	tools = list(/obj/item/needle)
	craftdiff = 5
	sellprice = 21

/datum/crafting_recipe/roguetown/leather/unique/winterjacket
	name = "winter jacket"
	result = list(/obj/item/clothing/suit/roguetown/armor/leather/vest/winterjacket)
	reqs = list(/obj/item/natural/hide/cured = 2,
				/obj/item/natural/fur = 2,
	            /obj/item/natural/cloth = 1)
	tools = list(/obj/item/needle)
	craftdiff = 5
	sellprice = 24

/datum/crafting_recipe/roguetown/leather/unique/openrobes
	name = "shamanic coat"
	result = list(/obj/item/clothing/suit/roguetown/armor/leather/heavy/atgervi)
	reqs = list(/obj/item/natural/hide/cured = 2,
	            /obj/item/natural/fibers = 1,
	            /obj/item/natural/cloth = 1)
	tools = list(/obj/item/needle)
	craftdiff = 5
	sellprice = 20

/datum/crafting_recipe/roguetown/leather/unique/monkrobes
	name = "monk vestments"
	result = list(/obj/item/clothing/suit/roguetown/shirt/robe/monk)
	reqs = list(/obj/item/natural/hide/cured = 2,
				/obj/item/reagent_containers/food/snacks/tallow = 1,
				/obj/item/natural/fibers = 2)
	tools = list(/obj/item/needle)
	craftdiff = 6	//Can be a bit strong, reduce to 5 if too high.
