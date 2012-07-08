object @message
attributes :id, :content, :timestamp

child :user do
  attributes :id, :email
end