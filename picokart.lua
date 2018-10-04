--picokart

-- actual code made by me on PICO-8
-- picokart.p8 contains ALL the code
-- of the game

p={}

function drawkart()
	spr(018,p.x-8,p.y-8)
	spr(019,p.x,p.y-8)
	spr(020,p.x+8,p.y-8)
	spr(035,p.x,p.y) --center
	spr(050,p.x-8,p.y+8)
	spr(051,p.x,p.y+8)
	spr(052,p.x+8,p.y+8)
end

function _init()
	p.x=55
	p.y=500
end

function crash()
	return fget(mget(p.x/8, p.y/8), 0)
end

function _update()
	if p.y > 16 then
		sfx(1)
		p.y-=3
	else
		stop("game finished!")
	end
		
	if btn(0) then
		p.x-=2
	end
	
	if btn(1) then
		p.x+=2
	end

	if crash() then
		stop("you crashed! :(")	
	end
end

function _draw()
	cls()
	map(0,0,0,0,128,512,0)
	drawkart()
	camera(0, p.y-64)
end
