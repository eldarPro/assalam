namespace :import do
  task subscriptions: :environment do
    require Rails.root.join("lib/legacy/legacy_base.rb")
    require Rails.root.join("lib/legacy/legacy_user.rb")
    require Rails.root.join("lib/legacy/legacy_subscription.rb")

    LegacyBase.establish_connection(:legacy)

    LegacySubscription.find_each do |old|
      # защита от дублей
      next if Subscription.exists?(id: old.id)

      # скипаем подписки без тарифа или клиента
      next if old.client_id == 0 || old.tariff_id == 0

      # пропускаем подписки тех, кто был зареган через соц сети
      next if User.find_by(id: old.client_id) == nil

      Subscription.create!(
        id: old.id,
        memo: old.memo,
        payment_type: old.type_payment,
        paymented_at: old.date_payment,
        tariff_id: old.tariff_id,
        user_id: old.client_id
      )
    end
  end
end
