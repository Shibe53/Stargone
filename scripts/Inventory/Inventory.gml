// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Inventory() constructor {
	
	_inventory_items = [];
	
	item_set = function(_name, _quantity, _sprite, _usable, _role) {
		array_push(_inventory_items, {
			name: _name,
			quantity: _quantity,
			sprite: _sprite,
			usable: _usable,
			role: _role
		});
	}
	
	item_find = function(_name) {
		for (var i = 0; i < array_length(_inventory_items); i++) {
			if(_name == _inventory_items[i].name) {
				return i;
			}
		}
		
		return -1;
	}
	
	item_add = function(_name, _quantity, _sprite, _usable, _role) {
		var index = item_find(_name);
		
		if(index >= 0) {
			_inventory_items[index].quantity += _quantity;
		} else {
			item_set(_name, _quantity, _sprite, _usable, _role);
		}
	}
	
	item_subtract = function(_name, _quantity) {
		var index = item_find(_name);
		if(index >= 0) {
			if(item_has(_name, _quantity)) {
				_inventory_items[index].quantity -= _quantity;
				if(_inventory_items[index].quantity <= 0) {
					item_remove(index);
				}
			}
		}
	}
	
	item_has = function(_name, _quantity) {
		var index = item_find(_name);
		
		if(index >= 0) {
			return _inventory_items[index].quantity >= _quantity;
		}
		
		return false;
	}
	
	item_use = function(_index) {
		show_debug_message($"Using {_inventory_items[_index].name}");
		obj_player.held_item.can_use = false;
		
		var _mousex = device_mouse_x_to_gui(0);
		var _mousey = device_mouse_y_to_gui(0);
		var used_object = instance_create_layer(_mousex, _mousey, "instances", obj_use);
		with(used_object) {
			state = other._inventory_items[_index].role;
			sprite = other._inventory_items[_index].sprite;
		}
		
		item_subtract(_inventory_items[_index].name, 1);
	}
	
	item_remove = function(index) {
		array_delete(_inventory_items, index, 1);
	}
	
	item_get = function() {
		return _inventory_items;
	}
	
	toString = function() {
		return json_stringify(_inventory_items);
	}

}
