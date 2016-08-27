json.extract! chatroompost, :id, :author, :created_at, :updated_at
json.url chatroompost_url(chatroompost, format: :json)