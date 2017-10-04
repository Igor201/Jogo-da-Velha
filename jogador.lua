
local jogador = {simbolo}

function jogador:novojogador()

	local jog = {}

	setmetatable(jog, {__index = jogador})

	self.simbolo = " "

	return jog

end

return jogador


