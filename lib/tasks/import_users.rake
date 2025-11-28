namespace :import do
  def sanitize_phone(phone)
    return nil if phone.blank?

    # убрать пробелы, тире, скобки и всё нецифровое
    cleaned = phone.gsub(/[^\d]/, "")

    # простая валидация: телефон должен содержать 7–15 цифр
    return cleaned if cleaned.match?(/\A\+?\d{7,15}\z/)

    nil
  end

  task users: :environment do
    require Rails.root.join("lib/legacy/legacy_base.rb")
    require Rails.root.join("lib/legacy/legacy_user.rb")

    LegacyBase.establish_connection(:legacy)

    LegacyUser.find_each do |old|
      random_password = SecureRandom.hex(10)

      # защита от дублей
      next if User.exists?(id: old.id) ||
                (old.phone != "" && User.exists?(phone: old.phone)) ||
                  (old.mail != "" && User.exists?(email: old.mail))

      # скипаем тех кто был зареган через VK/FaceBook/Google
      next if old.phone.blank? && old.mail.blank?

      User.create!(
        id: old.id,
        email: old.mail,
        fio: old.name,
        phone: sanitize_phone(old.phone),
        password: random_password,
        password_confirmation: random_password
      )
    end
  end
end
