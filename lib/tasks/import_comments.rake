namespace :import do
  task comments: :environment do
    require Rails.root.join("lib/legacy/legacy_base.rb")
    require Rails.root.join("lib/legacy/legacy_user.rb")
    require Rails.root.join("lib/legacy/legacy_comment.rb")

    LegacyBase.establish_connection(:legacy)

    LegacyComment.find_each do |old|
      # защита от дублей
      next if Comment.exists?(id: old.id)

      # скипаем подписки без тарифа или клиента
      next if old.user_id == 0 || old.article_id == 0

      # пропускаем комментарии тех, кто был зареган через соц сети
      next if User.find_by(id: old.user_id) == nil

      Comment.create!(
        id: old.id,
        article_id: old.article_id,
        user_id: old.user_id,
        message: old.message,
      )
    end
  end
end
