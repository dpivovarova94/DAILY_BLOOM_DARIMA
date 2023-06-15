module ApplicationHelper
  def extract_spotify_track_id(song_url)
    if song_url.include?('/track/')
      song_url.split('/track/').last.split('?').first
    else
      nil
    end
  end
end
