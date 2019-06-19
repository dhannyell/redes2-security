namespace :dev do
  desc "Configura o ambiente de desenvolvimento"
  task setup: :environment do
    '''
    puts ("Excluindo Banco de Dados")
    %x(rails db:drop)
    puts ("Criando Banco de Dados")
    %x(rails db:create)
    puts ("Fazendo Migraçoes")
    %x(rails db:migrate)
    '''
    
    puts("Criando Usuarios...")

    kinds = %w(Amigo Comercial Conhecido)

    kinds.each do |kind|
      Kind.create!(
        description: kind
      )
    end

    100.times do |i|
      Contact.create!(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        birthdate: Faker::Date.between(65.years.ago, 18.years.ago),
        kind: Kind.all.sample
      )
    end
    puts("Criando Usuarios...[OK]")
    
    ##########################
    
    puts ("Criando Telefones...")
    Contact.all.each do |contact|
      Random.rand(5).times do |i|
        phone = Phone.create!(number: Faker::PhoneNumber.cell_phone)
        contact.phones << phone
        contact.save!
      end
    end
    puts("Criando Telefones...[OK]")

    puts("Criando Endereços...")
    Contact.all.each do |contact|
      address = Address.create!(
        street: Faker::Address.street_address,
        city:Faker::Address.city,
        contact: contact
        )
    end
    puts("Criando Telefones...[OK]")
  
  end

end
