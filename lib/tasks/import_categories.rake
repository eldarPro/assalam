namespace :import do
  task categories: :environment do
    require Rails.root.join("lib/legacy/legacy_base.rb")
    require Rails.root.join("lib/legacy/legacy_category.rb")

    LegacyBase.establish_connection(:legacy)

    # старые категории, которых нет в новой табличке категорий
    Category.find_or_create_by!(
      id: 59,
      name: "Читательская",
      pathname: "chitatelskaya"
    )
    Category.find_or_create_by!(
      id: 91,
      name: "Притчи",
      pathname: "pritchi"
    )

    LegacyCategory.find_each do |old|
      # защита от дублей
      next if Category.exists?(id: old.id)

      Category.create!(
        id: old.id,
        name: old.name,
        pathname: old.pathname
      )
    end
  end
end
