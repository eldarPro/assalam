namespace :import do
  desc "Run full import pipeline"
  task all: :environment do
    tasks = [
      "import:users",
      "import:news",
      "import:tariffs",
      "import:categories",
      "import:releases",
      "import:articles",
      "import:subscriptions",
      "import:comments",
      "import:bookmarks"
    ]

    tasks.each do |task|
      Rake::Task[task].invoke
    end
  end
end
