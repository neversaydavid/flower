require 'instagram'

class InstagramCommand < Flower::Command
  Instagram.configure do |config|
    config.client_id = Flower::Config.instagram_id
    config.client_secret = Flower::Config.instagram_secret
  end

  respond_to "insta", "instagram"

  def self.respond(command, message, sender, flower)
    if message.present?
      search = URI.escape(message.split(" ").first)
      if image = image_path(search)
        flower.say(image)
      else
        flower.say("No hits :(")
      end
    else
      flower.say("(Enter search term)")
    end
  end

  def self.image_path(query)
    result = Instagram.tag_recent_media(query) rescue nil
    if result && data = result.data.to_a.try(:sample)
      data.images.standard_resolution.url
    end
  end
end