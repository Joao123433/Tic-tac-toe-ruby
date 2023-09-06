class Fim
    def self.escrita
        File.open(File.expand_path("../../ascii/fim_jogo.txt", __FILE__), "r") do |words|
            while line = words.gets do
                puts line
            end
        end
    end
end