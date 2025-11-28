class LegacyCategory < LegacyBase
  self.table_name = "web_guide_www_category"

  has_many :articles, class_name: "LegacyArticle", foreign_key: "category_id"
end
