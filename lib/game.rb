require_relative "inicio"
require_relative "layout"
require_relative "fim"

class Game 
    attr_accessor :posicoes, :jogador, :escolha_jogador, :ganhou
    def initialize
        Inicio.escrita
        sleep(2)
        @@pontos_jogador_um = 0
        @@pontos_jogador_dois = 0
        Layout.inicio
        @posicoes = [1,2,3,4,5,6,7,8,9]
        @jogador = "X"
        @escolha_jogador = 0
        @ganhou = false
    end

    def inserir_posicao(posicao_jogador)
        @posicoes.each { |posicao| Layout.escolha(posicao, @jogador) if posicao_jogador == posicao }
        @posicoes.delete(posicao_jogador)
    end

    def define_jogador
        @escolha_jogador += 1
        @jogador = @escolha_jogador.even? ? "X" : "O"
    end

    def ganhou?
        @ganhou = Layout.venceu? # valor do retorno false, so fica true se um jogador ganhar
        jogador == "X" ? @@pontos_jogador_um += 1 : @@pontos_jogador_dois += 1 if @ganhou
    end

    def empatou?
        if @posicoes.empty?
            Layout.mudando_cor_empatou 
            @ganhou = true 
        end
    end

    def self.pontos_jogador_um
        @@pontos_jogador_um
    end
    
    def self.pontos_jogador_dois
        @@pontos_jogador_dois
    end
end