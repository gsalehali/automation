require 'capybara/poltergeist'
options = {js_errors: false}
Capybara.register_driver :poltergeist do |app|
  Capybara::Poltergeist::Driver.new(app, options)
end

namespace :view do
  desc "View thevideos.tv videos"
  task the_videos: :environment do
    puts "viewing thevideos.tv files"
    video_link = "http://thevideos.tv/lgocpslxwie6.html"
    button_id = "btn_download"
    vplayer_id = "vplayer"
    page_counter_id = "countdown_str"
    view_page(video_link, button_id, vplayer_id, page_counter_id)
  end

  desc "View thevideos.tv videos"
  task streamin: :environment do
    puts "viewing streamin.to files"
    video_link = "http://streamin.to/72cbabnsvde2"
    button_id = "btn_download"
    vplayer_id = "vplayer"
    page_counter_id = "countdown_str"
    view_page(video_link, button_id, vplayer_id, page_counter_id)
  end


  task :all => [:the_videos, :streamin] do
    puts "Done!!!"
  end
end

private 
def view_page(video_link, button_id, vplayer_id, page_counter_id)

  # Starting A Session semulating a user
  session = Capybara::Session.new(:poltergeist)

  #visit video_link
  session.visit video_link

  #click button with id button_id if exist
  waiting_time = 1
  while waiting_time > 0
    # Check wiaiting time, it should not exceeds 15s  
    if waiting_time > 15
      puts "internal Waiting time: Waiting time is too long"
      return -1
    end

    # if waiting_time <= 15 check if the page counter with page_counter_id has finished
    # and adgust wititing time accodingly
    if session.has_css?("##{page_counter_id}", visible: true)
      waiting_time += 1
    else
      waiting_time = -1
      puts "Page waiting time: witing time has finished"
    end
  # Check if the page has a button with button_id and click it
  if session.has_button?("#{button_id}")
    puts "Button: has been found"
    session.click_button("#{button_id}")
    puts "Button: has been clicked"
  else 
    puts "Button: has not been found"
  end
end


  # if session.has_css?("##{button_id}")
  #   waiting_time = 1
  #   while waiting_time > 0
  #     sleep waiting_time
  #     session.click_button("#{button_id}")
  #     if session.has_css?('#countdown_str', visible: false)
  #       waiting_time += 1
  #     else
  #       waiting_time = -1
  #     end
  #   end
  #   puts "Check Button: Done"
  # else
  #   puts "Check Button: btn_download doesn't exist"
  # end

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