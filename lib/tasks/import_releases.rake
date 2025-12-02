namespace :import do
  task releases: :environment do
    require Rails.root.join("lib/legacy/legacy_base.rb")
    require Rails.root.join("lib/legacy/legacy_release.rb")

    LegacyBase.establish_connection(:legacy)

    LegacyRelease.find_each do |old|
      # защита от дублей
      next if Release.exists?(id: old.id)

      Release.create!(
        id: old.id,
        year_number: old.release_number,
        general_number: old.sequentially_art,
        hidjra_date: old.hidjra_date,
        photo: old.main_photo,
        pdf: old.main_pdf,
        circulation: old.circulation,
        r_date: old.release_date,
        published_at: old.r_date
      )
    end
  end
end
