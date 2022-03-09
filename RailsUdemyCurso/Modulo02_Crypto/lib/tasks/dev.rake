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

      %x(rails dev:add_mining_types)     
      %x(rails dev:add_coins)     

      show_spinner("Servidor iniciado...") do
        %x(rails s)
      end
    else
      puts "Você não está em ambiente de desenvolvimento!"
    end
  end

  desc "Cadastra as moedas"
  task add_coins: :environment do
    show_spinner("Cadastrando moedas...") do
      coins = [
          {
              description: 'Bitcoin',
              acronym: 'BTC',
              url_image: 'https://logodownload.org/wp-content/uploads/2017/06/bitcoin-logo-5-1.png',
              mining_type: MiningType.all.sample
          },
          {
              description: 'Ethereum',
              acronym: 'ETH',
              url_image: 'https://d33wubrfki0l68.cloudfront.net/fcd4ecd90386aeb50a235ddc4f0063cfbb8a7b66/4295e/static/bfc04ac72981166c740b189463e1f74c/40129/eth-diamond-black-white.jpg',
              mining_type: MiningType.all.sample
          },
          {
              description: 'Dash',
              acronym: 'DASH',
              url_image: 'data:image/png;base64,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',
              mining_type: MiningType.all.sample
          }
      ]

      coins.each do |coin|
          Coin.find_or_create_by!(coin)
      end
    end
  end

  desc "Cadastro dos tipos de mineração"
  task add_mining_types: :environment do
    show_spinner("Cadastrando Tipos...") do
      mining_types = [
        { description: "Proof of Work", acronym: "PoW"},
        { description: "Proof of Stake", acronym: "PoS"},
        { description: "Proof of Capacity", acronym: "PoC"},
      ]

      mining_types.each do |mining_type|
        MiningType.find_or_create_by!(mining_type)
      end
    end
  end

  private
  def show_spinner(msg_start,msg_end = "Concluído com sucesso!")
    spinner = TTY::Spinner.new("[:spinner] #{msg_start}")
    spinner.auto_spin
    yield
    spinner.success("(#{msg_end})")
  end
end
