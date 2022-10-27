json.extract! comment, :id, :author_id, :post_id, :Text, :created_at, :updated_at
json.url comment_url(comment, format: :json)
