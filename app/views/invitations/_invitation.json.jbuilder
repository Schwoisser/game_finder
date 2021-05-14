json.extract! invitation, :id, :message, :match_id, :sender_id, :reference, :receiver_id, :reference, :created_at, :updated_at
json.url invitation_url(invitation, format: :json)
