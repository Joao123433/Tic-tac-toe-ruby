class Inicio
    def self.escrita
        File.open(File.expand_path("../../ascii/inicializacao.txt", __FILE__), "r") do |words| 
            while line = words.gets 
                puts line
            end
        end
    end
end