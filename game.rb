require 'ruby2d'

set background: 'grey'
set title: 'Jogo Da Reação'

mensagem = Text.new('Clique Para Começar', x: 20, y: 20)
jogo_começou = false
quadrado = nil
tempo_inicio = nil
duraçao = nil

on :mouse_down do |event|
  if jogo_começou
    if quadrado.contains?(event.x, event.y)
      duraçao = ((Time.now - tempo_inicio) * 1000).round
      mensagem = Text.new("Muito Bem! Você Levou: #{duraçao} Milissegundos. Clique para começar", x: 20, y: 20)
      quadrado.remove
      jogo_começou = false
    end
  else
    mensagem.remove

    quadrado = Square.new(
      x: rand(get(:width) - 25), y: rand(get(:height) - 25),
      size: 25,
      color: 'purple'
    )

    tempo_inicio = Time.now
    jogo_começou = true
  end
end

show