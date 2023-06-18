
middle = require 'librarys/middleclass'

botao = middle.class('Botao')

font1 = love.graphics.newFont(25,'mono')

font1:setFilter("nearest")

Botoes = {}

function botao:initialize(texto,x,y,largura,altura,font,cor1,fn)
    -- botao
  self.texto = texto
  self.x = x or 1
  self.y = y or 1
  self.largura = largura or 50
  self.altura = altura or 50
  self.Font = font or font1
  self.cor1 = cor1 or {0,0,0}
  self.ID = #Botoes + 1
  self.fn = fn
  table.insert(Botoes, self)
  return self
end

function botao:Draw()
  love.graphics.setColor(self.cor1)
  love.graphics.rectangle("fill",self.x,self.y,self.altura,self.largura)
end

function botao:update()
  local x, y = love.mouse.getX(),love.mouse.getY()
  if x < self.x + self.Font:getWidth(self.texto) + 20 and x > self.x and y < self.y + self.Font:getHeight(self.texto) + 20 and y > self.y then
    if love.mouse.isDown(1) == true then
      self.fn()
    end
  end
end

function DrawBotoes()
	for i,botao in pairs(Botoes) do
		botao:Draw()
	end 
end

function updateBotoes()
	for i, botao in pairs(Botoes) do
	    botao:update()
	end
end

return Botao