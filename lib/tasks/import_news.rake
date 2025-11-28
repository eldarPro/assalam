namespace :import do
  task news: :environment do
    require Rails.root.join("lib/legacy/legacy_base.rb")
    require Rails.root.join("lib/legacy/legacy_news.rb")

    LegacyBase.establish_connection(:legacy)

    LegacyNews.find_each do |old|
      # защита от дублей
      next if News.exists?(id: old.id)

      # скипаем невалидные статьи (тnot null fields)
      next if old.preview == "" || old.atitle == "" ||
                old.path == "" || old.content == ""

      begin
        News.create!(
          id: old.id,
          title: old.atitle,
          photo: old.preview,
          published_at: old.pub_date,
          created_at: old.event_date,
          path: old.path,
          description: old.adesc,
          keys: old.akey,
          body: old.content,
          original:  old.original
        )
      rescue StandardError => e
        puts "An error occurred: #{e.message}"
        puts e.backtrace.join("\n") # Optional: print the backtrace for more context
        # Or use Rails.logger for more structured logging
        Rails.logger.error "Error in my_action: #{e.message}"
        Rails.logger.error e.backtrace.join("\n")
      end
    end
  end
end
