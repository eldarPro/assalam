namespace :import do
    task tariffs: :environment do
      require Rails.root.join("lib/legacy/legacy_base.rb")
      require Rails.root.join("lib/legacy/legacy_tariff.rb")

      LegacyBase.establish_connection(:legacy)

    LegacyTariff.find_each do |old|
      # защита от дублей
      next if Tariff.exists?(id: old.id)

      Tariff.create!(
        id: old.id,
        title: old.title,
        price: old.price,
        days: old.valid_day,
      )
    end
  end
end
