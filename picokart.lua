--picokart

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
	p.x=60
	p.y=500
end

--check crash
function crash()
	return fget(mget(p.x, p.y), 0)
end

function _update()
	-- autoacelerate
	if p.y > 16 then
		p.y-=3
	end
		
	if btn(0) then
		p.x-=2
	end
	
	if btn(1) then
		p.x+=2
	end

	--crash ends game
	if crash() then
		stop()	
	end
end

function _draw()
	cls()
	map(0,0,0,0,128,512,0)
	drawkart()
	camera(0, p.y-64)
end
