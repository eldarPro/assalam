namespace :import do
  task articles: :environment do
    require Rails.root.join("lib/legacy/legacy_base.rb")
    require Rails.root.join("lib/legacy/legacy_article.rb")
    require Rails.root.join("lib/legacy/legacy_release.rb")

    LegacyBase.establish_connection(:legacy)

    LegacyArticle.find_each do |old|
      # защита от дублей
      next if Article.exists?(id: old.id)

      release = Release.find_by(general_number: old.release_id)

      # у 712 номера была опечатка в графе годового номера газеты
      # видимо изначально занесли с ошибочным номером 27, потом отредактировали
      # так как в старой таблице хранится номер вместо айдишника,
      # связка была благополучно утеряна
      if old.release_id == 27
        release = Release.find_by(general_number: 712)
      end

      Article.create!(
        id: old.id,
        title: old.title,
        preview: old.main_text,
        body: old.all_text,
        photo: old.main_photo,
        audio: old.audio,
        category_id: old.category_id,
        release_id: release.id,
        published_at: old.dt
      )
    end
  end
end
