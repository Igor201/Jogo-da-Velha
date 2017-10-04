
tabuleiro = {{" "," "," "},
			 {" "," "," "},
			 {" "," "," "}

			}


--[[function tabuleiro:montar()
	local result = ""
	for i = 1,#tabuleiro do

		for j= 1,3 do

			result = result .. tabuleiro[i][j]

			if j == 3 then

			result = result .. "\n"

			end

			if j < 3 then

			result = result .. "|"

			end

		end

	end
  return result
end ]]

function tabuleiro:novotab()

	local tab = {}

	setmetatable(tab, {__index = tabuleiro})

	return tab
end


--[[function tabuleiro:fimdeJogo()
	for k,v in pairs(self) do
		for i=1,3 do
			if (self[k][i] == " ") then
				return false
			end
		end
	end
	return true
end]]

function tabuleiro:verificavencedor()
	for i=1,3 do


		lin = ((self[i][1] == self[i][2]) and (self[i][3] == self[i][1])) and (self[i][2] ~= " ")
		col = ((self[1][i] == self[2][i]) and (self[3][i] == self[2][i])) and (self[2][i] ~= " ")

		--verificar linhas e fazer alteraçãos

		if (lin) then

			self[i][1] = "-"
			self[i][2] = "-"
			self[i][3] = "-"

			return true
		end

		--verificar colunas e fazer alteraçãos

		if (col) then

			self[1][i] = "|"
			self[2][i] = "|"
			self[3][i] = "|"

			return true
		end


	end

	--verificar diagonais e fazer alteraçãos

	local diag01 = ((self[1][1] == self[2][2]) and (self[3][3] == self[2][2])) and (self[2][2] ~= " " )
	local diag02 = ((self[1][3] == self[2][2]) and (self[3][1] == self[2][2])) and (self[2][2] ~= " " )

		if (diag01) then
			self[1][1] = "\\"
			self[2][2] = "\\"
			self[3][3] = "\\"
			return true
		end

		if (diag02) then
			self[1][3] = "/"
			self[2][2] = "/"
			self[3][1] = "/"
			return true
		end

		return false
end

function tabuleiro:verificaEmpate()
	 for i = 1, 3 , 1 do
		for j = 1, 3 , 1 do
			if(tabuleiro[i][j] == " ") then
				return false
			end
		end
	end
	return true
end

function tabuleiro:realizarjogada(lin, col, simbolo)
	local jogadaValida = ((lin >= 1 and lin <= 3) and (col >= 1 and col <=3)) and (self[lin][col] == " ")

	if (jogadaValida) then
		self[lin][col] = simbolo
		return true
	else
		return false
	end

end

function tabuleiro:montar()
print(self[1][1] .. "|" .. self[1][2] .. "|" .. self[1][3])
print("_ _ _")
print(self[2][1] .. "|" .. self[2][2] .. "|" .. self[2][3])
print("_ _ _")
print(self[3][1] .. "|" .. self[3][2] .. "|" .. self[3][3])
end

return tabuleiro
