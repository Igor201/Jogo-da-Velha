local tabuleiro = require("Tabuleiro")
local jogador = require("jogador")

local jogo = {jogador1, jogador2, tabuleiro, jogadordaVez}

function jogo:novojogo()

	local novoj = {}
	setmetatable(novoj, {__index = jogo})
	novoj.tabuleiro = tabuleiro:novotab()
	novoj.jogador1 = jogador:novojogador()
	novoj.jogador1.simbolo = "O"
	novoj.jogador2 = jogador:novojogador()
	novoj.jogador2.simbolo = "X"
	novoj.jogadordaVez = jogador:novojogador()
	novoj.jogadordaVez.simbolo = "O"

	return novoj

end


function jogo:vez()
	if (self.jogador1.simbolo == self.jogadordaVez.simbolo) then
		self.jogadordaVez = self.jogador2
	else
		self.jogadordaVez = self.jogador1
	end
end

function jogo:iniciar()

		print("Bem Vindo ao Jogo da Velha do Igor, Vamos Jogar!")
		print()
        print(self.tabuleiro:montar())

	while true do

		print("Sua Vez Jogador: " .. self.jogadordaVez.simbolo)
		print("Linha")
		local lin = io.read("*number")
		print("Coluna")
		local col = io.read("*number")
		print()
		if self.tabuleiro:realizarjogada(lin, col, self.jogadordaVez.simbolo) then
			print(self.tabuleiro:montar())
			print()
			if self.tabuleiro:verificavencedor() == true then
				print("Parabéns Jogador " .. self.jogadordaVez.simbolo .. " Você Ganhou")
				print()
				print("Obrigado Por Jogar")
				print(self.tabuleiro:montar())
				break
	      	elseif self.tabuleiro:verificaEmpate() ~= false then
				print("||------------------ O Jogo deu Empate ||------------------")
				print()
				print(self.tabuleiro:montar())
				break
			else
				self:vez()
			end
		else
			print("A posição digitada não é válida")
		end

	end
end

return jogo
