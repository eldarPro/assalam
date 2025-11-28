class LegacyUser < LegacyBase
  self.table_name = "web_clientele"

  has_many :comments, class_name: "LegacyComment", foreign_key: "user_id"
  has_many :bookmarks, class_name: "LegacyBookmark", foreign_key: "client_id"
  has_many :subscriptions, class_name: "LegacySubscription", foreign_key: "client_id"
end
