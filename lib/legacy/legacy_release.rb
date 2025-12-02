class LegacyRelease < LegacyBase
  self.table_name = "web_paper_release"

  has_many :articles, class_name: "LegacyArticle", foreign_key: "release_id"
end
