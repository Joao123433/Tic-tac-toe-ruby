require_relative = "game"

class Layout 
    attr_writer :valor_posicoes, :cor
    def self.inicio
        system("clear")
        puts
        print TerminalColors::Apply.("Pontos Jogador X: #{Game.pontos_jogador_um}", fg: "blue") 
        print TerminalColors::Apply.("      Pontos Jogador O: #{Game.pontos_jogador_dois}\n", fg: "magenta")      
        puts "               #          #          "
        puts "          1    #     2    #     3    "
        puts "               #          #          "
        puts "     ################################"
        puts "               #          #          "
        puts "          4    #     5    #     6    "
        puts "               #          #          "
        puts "     ################################"
        puts "               #          #          "
        puts "          7    #     8    #     9    "
        puts "               #          #          "
        @valor_posicoes = Hash.new
        @cor = Hash.new
    end

    def self.escolha(posicao, simbolo)
        system("clear")
        @valor_posicoes[posicao] = simbolo
        @cor[posicao] = simbolo == "X" ? "blue" : "magenta"
        puts
        print TerminalColors::Apply.("Pontos Jogador X: #{Game.pontos_jogador_um}", fg: "blue") 
        print TerminalColors::Apply.("      Pontos Jogador O: #{Game.pontos_jogador_dois}\n", fg: "magenta")   
        puts "               #          #          "
        puts "          #{@valor_posicoes.has_key?(1) ? TerminalColors::Apply.(@valor_posicoes[1], fg: @cor[1]) : 1}    #     #{@valor_posicoes.has_key?(2) ? TerminalColors::Apply.(@valor_posicoes[2], fg: @cor[2]) : 2}    #     #{@valor_posicoes.has_key?(3) ? TerminalColors::Apply.(@valor_posicoes[3], fg: @cor[3]) : 3}    "
        puts "               #          #          "
        puts "     ################################"
        puts "               #          #          "
        puts "          #{@valor_posicoes.has_key?(4) ? TerminalColors::Apply.(@valor_posicoes[4], fg: @cor[4]) : 4}    #     #{@valor_posicoes.has_key?(5) ? TerminalColors::Apply.(@valor_posicoes[5], fg: @cor[5]) : 5}    #     #{@valor_posicoes.has_key?(6) ? TerminalColors::Apply.(@valor_posicoes[6], fg: @cor[6]) : 6}    "
        puts "               #          #          "
        puts "     ################################"
        puts "               #          #          "
        puts "          #{@valor_posicoes.has_key?(7) ? TerminalColors::Apply.(@valor_posicoes[7], fg: @cor[7]) : 7}    #     #{@valor_posicoes.has_key?(8) ? TerminalColors::Apply.(@valor_posicoes[8], fg: @cor[8]) : 8}    #     #{@valor_posicoes.has_key?(9) ? TerminalColors::Apply.(@valor_posicoes[9], fg: @cor[9]) : 9}    "
        puts "               #          #          "
    end

    def self.venceu?
        if @valor_posicoes[1] == @valor_posicoes[2] && @valor_posicoes[2] == @valor_posicoes[3] && @valor_posicoes[3] != nil
            mudando_cor_win(1,2,3)
            return true

        elsif @valor_posicoes[4] == @valor_posicoes[5] && @valor_posicoes[5] == @valor_posicoes[6] && @valor_posicoes[6] != nil
            mudando_cor_win(4,5,6)
            return true

        elsif @valor_posicoes[7] == @valor_posicoes[8] && @valor_posicoes[8] == @valor_posicoes[9] && @valor_posicoes[9] != nil
            mudando_cor_win(7,8,9)
            return true

        elsif @valor_posicoes[1] == @valor_posicoes[4] && @valor_posicoes[4] == @valor_posicoes[7] && @valor_posicoes[7] != nil
            mudando_cor_win(1,4,7)
            return true

        elsif @valor_posicoes[2] == @valor_posicoes[5] && @valor_posicoes[5] == @valor_posicoes[8] && @valor_posicoes[8] != nil
            mudando_cor_win(2,5,8)
            return true

        elsif @valor_posicoes[3] == @valor_posicoes[6] && @valor_posicoes[6] == @valor_posicoes[9] && @valor_posicoes[9] != nil
            mudando_cor_win(3,6,9)
            return true

        elsif @valor_posicoes[1] == @valor_posicoes[5] && @valor_posicoes[5] == @valor_posicoes[9] && @valor_posicoes[9] != nil
            mudando_cor_win(1,5,9)
            return true

        elsif @valor_posicoes[3] == @valor_posicoes[5] && @valor_posicoes[5] == @valor_posicoes[7] && @valor_posicoes[7] != nil
            mudando_cor_win(3,5,7)
            return true
        end
        false
    end

    def self.mudando_cor_win(*win_posicoes)
        system("clear")
        win_posicoes.each { |num| @cor[num] = "green"}
        puts
        print TerminalColors::Apply.("Pontos Jogador X: #{Game.pontos_jogador_um}", fg: "blue") 
        print TerminalColors::Apply.("      Pontos Jogador O: #{Game.pontos_jogador_dois}\n", fg: "magenta")   
        puts "               #          #          "
        puts "          #{@valor_posicoes.has_key?(1) ? TerminalColors::Apply.(@valor_posicoes[1], fg: @cor[1]) : 1}    #     #{@valor_posicoes.has_key?(2) ? TerminalColors::Apply.(@valor_posicoes[2], fg: @cor[2]) : 2}    #     #{@valor_posicoes.has_key?(3) ? TerminalColors::Apply.(@valor_posicoes[3], fg: @cor[3]) : 3}    "
        puts "               #          #          "
        puts "     ################################"
        puts "               #          #          "
        puts "          #{@valor_posicoes.has_key?(4) ? TerminalColors::Apply.(@valor_posicoes[4], fg: @cor[4]) : 4}    #     #{@valor_posicoes.has_key?(5) ? TerminalColors::Apply.(@valor_posicoes[5], fg: @cor[5]) : 5}    #     #{@valor_posicoes.has_key?(6) ? TerminalColors::Apply.(@valor_posicoes[6], fg: @cor[6]) : 6}    "
        puts "               #          #          "
        puts "     ################################"
        puts "               #          #          "
        puts "          #{@valor_posicoes.has_key?(7) ? TerminalColors::Apply.(@valor_posicoes[7], fg: @cor[7]) : 7}    #     #{@valor_posicoes.has_key?(8) ? TerminalColors::Apply.(@valor_posicoes[8], fg: @cor[8]) : 8}    #     #{@valor_posicoes.has_key?(9) ? TerminalColors::Apply.(@valor_posicoes[9], fg: @cor[9]) : 9}    "
        puts "               #          #          "
    end

    
    def self.mudando_cor_empatou
        system("clear")
        @cor.each_key { |key| @cor[key] = "red"}
        puts
        print TerminalColors::Apply.("Pontos Jogador X: #{Game.pontos_jogador_um}", fg: "blue") 
        print TerminalColors::Apply.("      Pontos Jogador O: #{Game.pontos_jogador_dois}\n", fg: "magenta")   
        puts "               #          #          "
        puts "          #{@valor_posicoes.has_key?(1) ? TerminalColors::Apply.(@valor_posicoes[1], fg: @cor[1]) : 1}    #     #{@valor_posicoes.has_key?(2) ? TerminalColors::Apply.(@valor_posicoes[2], fg: @cor[2]) : 2}    #     #{@valor_posicoes.has_key?(3) ? TerminalColors::Apply.(@valor_posicoes[3], fg: @cor[3]) : 3}    "
        puts "               #          #          "
        puts "     ################################"
        puts "               #          #          "
        puts "          #{@valor_posicoes.has_key?(4) ? TerminalColors::Apply.(@valor_posicoes[4], fg: @cor[4]) : 4}    #     #{@valor_posicoes.has_key?(5) ? TerminalColors::Apply.(@valor_posicoes[5], fg: @cor[5]) : 5}    #     #{@valor_posicoes.has_key?(6) ? TerminalColors::Apply.(@valor_posicoes[6], fg: @cor[6]) : 6}    "
        puts "               #          #          "
        puts "     ################################"
        puts "               #          #          "
        puts "          #{@valor_posicoes.has_key?(7) ? TerminalColors::Apply.(@valor_posicoes[7], fg: @cor[7]) : 7}    #     #{@valor_posicoes.has_key?(8) ? TerminalColors::Apply.(@valor_posicoes[8], fg: @cor[8]) : 8}    #     #{@valor_posicoes.has_key?(9) ? TerminalColors::Apply.(@valor_posicoes[9], fg: @cor[9]) : 9}    "
        puts "                  EMPATOU"
    end
end