
function Recipe(): Inventory() constructor{
	
	//find recipies
	
	_recipies = [];
	
	recipe_find = function(_name) {
		for (var i = 0; i < array_length(_recipies); i++) {
			if(_name == _recipies[i].name) {
				return i;
			}
		}
		
		return -1;
	}
	
	//add recipies
	
	recipe_add = function(_name, _requirement, _products, _sprite) {
		array_push(_recipies, {
			name: _name,
	        requirements: _requirement,
			products: _products,
			sprite: _sprite,
		});

	}
	
	recipe_has = function(_name) {
		var index = recipe_find(_name);
		var can_craft = true; 

		if(index >= 0) {
			for(var requirement_index = 0; requirement_index < array_length(_recipies[index].requirements); requirement_index++){
				if(!item_has(_recipies[index].requirements[requirement_index].name, _recipies[index].requirements[requirement_index].quantity)) {
					can_craft = false; 
					break; 
				}
			}
		} else {
			can_craft = false; 
		}
    return can_craft;
}
	
	
	recipe_craft = function(_name) {
		var index = recipe_find(_name);
		
		if(index >= 0){
			if(recipe_has(_name)){	
				for(var requirement_index = 0; requirement_index < array_length(_recipies[index].requirements); requirement_index ++){
					item_subtract(_recipies[index].requirements[requirement_index].name, _recipies[index].requirements[requirement_index].quantity);
				}
			
				for(var product_index = 0; product_index < array_length(_recipies[index].products);product_index++){
					item_add(_recipies[index].products[product_index].name, _recipies[index].products[product_index].quantity, _recipies[index].products[product_index].sprite, _recipies[index].products[product_index].usable, _recipies[index].products[product_index].role, _recipies[index].products[product_index].tooltip);
				}
			}
		}
	}
	
	recipe_get = function(){
		return _recipies;
	}
}