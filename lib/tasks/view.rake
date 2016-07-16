require 'capybara/poltergeist'

namespace :view do
  desc "View thevideos.tv videos"
  task the_videos: :environment do
    puts "viewing thevideos.tv files"
    video_link = "http://thevideos.tv/lgocpslxwie6.html"
    button_id = "btn_download"
    vplayer_id = "vplayer"
    view_page(video_link, button_id, vplayer_id)
  end

  desc "View thevideos.tv videos"
  task streamin: :environment do
    puts "viewing streamin.to files"
    video_link = "http://streamin.to/72cbabnsvde2"
    button_id = "btn_download"
    vplayer_id = "vplayer"
    view_page(video_link, button_id, vplayer_id)
  end


  task :all => [:the_videos, :streamin] do
    puts "Done!!!"
  end
end

private 
def view_page(video_link, button_id, vplayer_id)

  # Starting A Session semulating a user
  session = Capybara::Session.new(:poltergeist)

  #visit video_link
  session.visit video_link

  #click button with id button_id if exist
  if session.has_css?("##{button_id}")
    waiting_time = 1
    while waiting_time > 0
      sleep waiting_time
      session.click_button("#{button_id}")
      if session.has_css?('#countdown_str', visible: false)
        waiting_time += 1
      else
        waiting_time = -1
      end
    end
    puts "Check Button: Done"
  else
    puts "Check Button: btn_download doesn't exist"
  end

  # Play video with vplayer_id if exist
  if session.has_css?("##{vplayer_id}")
    session.find("##{vplayer_id}").click
    puts "Check video player: Done"
  else
    puts "Check video player: player doesn't exist"
    exit(-1)
  end

  return 1
end