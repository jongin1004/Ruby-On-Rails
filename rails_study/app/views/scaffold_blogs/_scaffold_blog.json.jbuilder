json.extract! scaffold_blog, :id, :title, :description, :created_at, :updated_at
json.url scaffold_blog_url(scaffold_blog, format: :json)
