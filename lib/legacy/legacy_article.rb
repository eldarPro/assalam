class LegacyArticle < LegacyBase
  self.table_name = "web_articles"
  belongs_to :release, class_name: "LegacyRelease", foreign_key: "release_id"
  belongs_to :category, class_name: "LegacyCategory", foreign_key: "category_id"

  has_many :comments, class_name: "LegacyComment", foreign_key: "article_id"
end
