class LegacyTariff < LegacyBase
  self.table_name = "web_clientele_tariff"

  has_many :subscriptions, class_name: "LegacySubscription", foreign_key: "tariff_id"
end
