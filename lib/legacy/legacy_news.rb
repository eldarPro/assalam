class LegacyNews < LegacyBase
  self.table_name = "web_press"

  belongs_to :author, class_name: "LegacyUser", foreign_key: "author_id", optional: true
end
