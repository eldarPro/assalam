class LegacyComment < LegacyBase
  self.table_name = "web_articles_comments"

  belongs_to :article, class_name: "LegacyArticle", foreign_key: "article_id"
  belongs_to :user, class_name: "LegacyUser", foreign_key: "user_id"
end
