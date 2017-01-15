if current_user
  json.is_logged        true
  json.email            @current_user.email
  json.is_nl_subscribed true
else
  json.is_logged        false
  json.email            nil
  json.is_nl_subscribed false
end
