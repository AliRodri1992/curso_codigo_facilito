json.extract! comment, :id, :user_id, :article_id, :body, :created_at, :updated_at
json.user do
  json.email comment.user.email
  json.nickname comment.user.nickname
end
# json.url comment_url(comment, format: :json)
