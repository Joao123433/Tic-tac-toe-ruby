# chamada dos arquivos do sistemas
require_relative "lib/game"

# gem que muda a cor no terminal
require "terminal_colors"

game = Game.new
escolha = 0

until escolha == 2
    until game.ganhou do
        print "       Jogador #{game.jogador} Insira uma posicao: "
        posicao = gets.chomp.to_i
        loop do # verificando se o valor inserido esta no array posicoes da classe Game
            break if game.posicoes.include?(posicao)
            print "         Insira uma posicao valida: "
            posicao = gets.chomp.to_i
        end
        game.inserir_posicao(posicao)

        puts "            Jogador #{game.jogador} ganhou" if game.ganhou?
        game.define_jogador # chamando ao funcao que muda o jogador e o simbolo
        game.empatou? # chamando a funcao que verifica se o array posicoes esta vazio
    end

    print "\n          1 - Reiniciar \n          2 - Sair \n          Escolha uma opcao: "
    escolha = gets.chomp.to_i
    if escolha == 1
        Layout.inicio
        game.posicoes = [1,2,3,4,5,6,7,8,9]
        game.jogador = "X"
        game.escolha_jogador = 0
        game.ganhou = false
    end
end
system("clear")
Fim.escrita