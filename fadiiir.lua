
local MAX_X=grid_size_x()
local MAX_Y=grid_size_y()
local GRID_VARIANT=(MAX_Y==16 and MAX_X==16) and "Zero" or (MAX_Y==8 and MAX_X==8) and "One" or nil
local GRID_PRIMARY_VERTICAL_OFFSET=(GRID_VARIANT=="Zero") and 8 or 0
local MAX_MENU_ACCESS_BUTTONS = 4
local menu_access_buttons_held=0
local last_menu_button_press_time=nil
local view="faders"

local selected_channel=1

function toggle_view()
	print("toggle view: "..view)
	if view == "faders" then
		view="settings"
		render_view(10)
	else
		view="faders"
		render_view(4)
	end
end
function handle_menu_access_button_press(z)
	if z==1 then
		if last_menu_button_press_time ==nil then
			last_menu_button_press_time=get_time()
		end

		if last_menu_button_press_time - get_time() < 20 then
			menu_access_buttons_held = clamp(menu_access_buttons_held+1,0,MAX_MENU_ACCESS_BUTTONS)
			last_menu_button_press_time = get_time()
		end
	else
		menu_access_buttons_held = clamp(menu_access_buttons_held-1,0,MAX_MENU_ACCESS_BUTTONS)
	end
end

function grid(x,y,z)
	if x>=13 and x<=MAX_X and y==8 then
		handle_menu_access_button_press(z)
	end

	if menu_access_buttons_held==MAX_MENU_ACCESS_BUTTONS then
		toggle_view()
	end
end

function render_view(brightness)
	for x=1, MAX_X do
		for y=1, MAX_Y do
			grid_led(x,y,brightness)
		end
	end
	grid_refresh()
end