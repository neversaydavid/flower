# encoding: UTF-8
class Wat < Flower::Command
  respond_to "wat"

  WATS = %w[
    http://cdn.shopify.com/s/files/1/0070/7032/files/wat_grande.jpg
    http://anongallery.org/img/1/9/wat-gigantic-duck.jpg
    http://www.friendshipismagic.org/forum/attachment.php?attachmentid=9452&d=1341514337.jpg
    http://static.fjcdn.com/pictures/Wat_5e732b_4019847.jpg
    http://i3.kym-cdn.com/photos/images/newsfeed/000/173/576/Wat8.jpg
    http://i3.kym-cdn.com/photos/images/newsfeed/000/173/589/RsLid.jpg
  ]

  def self.description
    "WAT!? – http://www.youtube.com/watch?v=kXEgk1Hdze0"
  end

  def self.respond(command, message, sender, flower)
    if (1..WATS.size).include?(message.to_i)
      flower.say WATS[message.to_i - 1]
    else
      flower.say WATS.sample
    end
  end
end