class LegacySubscription < LegacyBase
  self.table_name = "web_clientele_log"

  belongs_to :user, class_name: "LegacyUser", foreign_key: "client_id"
  belongs_to :tariff, class_name: "LegacyTariff", foreign_key: "tariff_id"
end
