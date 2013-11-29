# Playlist - search computer for music files and randomly creates playlist
# Chapter 11 Learn to Program by Chris Pine
# 20131116

# Setting directory where the music files are stored
Dir.chdir '/Users/jobdelcastillo/Music/ICE/Classical'

#  First we find the music for the playlist
music_names = Dir['/Users/jobdelcastillo/Music/ICE/Classical/**.mp3']
# Creating the m3u playlist
filename = 'music_playlist.m3u'
# Array for playlist
playlist = []
print "Searching music... found #{music_names.length} music files."

# counter = 0
# This gets the music files and append to array playlist
music_names.each do |name|
  # puts name # This is our "progress bar".
  playlist << File.basename(name)
  # puts playlist[counter]
  # counter = counter + 1
end
# Saving the contents of array to the actual m3u file
File.open(filename, 'a') { |f|
  playlist.each { |x| f.write x + "\n"}
}

