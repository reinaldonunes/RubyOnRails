class Reading < ApplicationRecord
    belongs_to :goal
    belongs_to :book

    enum month: {
        janeiro: "Janeiro",
        feveiro: "Fevereiro",
        marco: "Março"
    }

    enum progress: {
        "1" => "Aguardando",
        "2" => "Lendo",
        "3" => "Lido"
    }

    enum evaluation: {
        "01" => "Ruim",
        "02" => "Razoável",
        "03" => "Bom"
    }


end
