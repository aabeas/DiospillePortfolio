module PagesHelper
  def twitter_parser tweet
    regex = %r{
      \b
      (
        (?: [a-z][\w-]+:
         (?: /{1,3} | [a-z0-9%] ) |
          www\d{0,3}[.] |
          [a-z0-9.\-]+[.][a-z]{2,4}/
        )
        (?:
         [^\s()<>]+ | \(([^\s()<>]+|(\([^\s()<>]+\)))*\)
        )+
        (?:
          \(([^\s()<>]+|(\([^\s()<>]+\)))*\) |
          [^\s`!()\[\]{};:'".,<>?«»“”‘’]
        )
      )
    }ix

    tweet.gsub(regex) do |url|
      "<a href='#{url}' target='_blank'>#{url}</a>"
    end.html_safe
  end

  # def video_background
  #   video_tag "HardDrivePhotojpeg.mp4",
  #   playsinline: true,
  #   id: 'background',
  #   autobuffer: false,
  #   autoplay: false,
  #   loop: false,
  #   muted: true,
  #   poster: 'home_bg_w.png'
  # end
end
