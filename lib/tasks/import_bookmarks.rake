namespace :import do
  task bookmarks: :environment do
    require Rails.root.join("lib/legacy/legacy_base.rb")
    require Rails.root.join("lib/legacy/legacy_user.rb")
    require Rails.root.join("lib/legacy/legacy_bookmark.rb")

    LegacyBase.establish_connection(:legacy)

    LegacyBookmark.find_each do |old|
      # защита от дублей
      next if Bookmark.exists?(id: old.id)

      # скипаем подписки без тарифа или клиента
      next if old.client_id == 0 || old.articles_id == 0

      # пропускаем закладки тех, кто был зареган через соц сети
      next if User.find_by(id: old.client_id) == nil

      Bookmark.create!(
        id: old.id,
        article_id: old.articles_id,
        user_id: old.client_id
      )
    end
  end
end
