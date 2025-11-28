class LegacyBookmark < LegacyBase
  self.table_name = "web_clientele_bookmark"

  belongs_to :user, class_name: "LegacyUser", foreign_key: "client_id"
  belongs_to :article, class_name: "LegacyArticle", foreign_key: "articles_id"
end
