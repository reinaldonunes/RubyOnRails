namespace :dev do
  desc "Configurando o ambiente de desenvolvimento."
  task setup: :environment do
    if Rails.env.development?
      show_spinner("Apagando BD...") do
        %x(rails db:drop)     
      end

      show_spinner("Criando BD...") do
        %x(rails db:create)     
      end

      show_spinner("Migrando BD...") do
        %x(rails db:migrate)     
      end

      show_spinner("Populando BD...") do
        %x(rails db:seed)     
      end

      show_spinner("Iniciando servidor...") do
        %x(rails s)
      end
    else
      puts "Você não está em ambiente de desenvolvimento!"
    end
  end

  def show_spinner(msg_start,msg_end = "Concluído com sucesso!")
    spinner = TTY::Spinner.new("[:spinner] #{msg_start}")
    spinner.auto_spin
    yield
    spinner.success("(#{msg_end})")
  end
end
