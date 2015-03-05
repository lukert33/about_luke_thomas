module Tokenized

  VALID_TOKENS = ["germinate","atlas","amigos","family"]

  def current_guest_token

    if !guest_token
      self.errors.add(:guest_token, "must provide guest token to post")
    end

    if guest_token
      unless VALID_TOKENS.include? guest_token.downcase.gsub(/\s+/,"")
        errors.add(:guest_token, "must provide a valid token")
      end
    end
  end
end