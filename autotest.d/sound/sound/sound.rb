# Sound effects for autotest
# http://fozworks.com/2007/7/28/autotest-sound-effects

# This plugin will trigger sounds. You will need a command-line
# sound player to do this. See the README file for more details. 
#
# 1.2 - doc patch for bad path 2007-08-01
# 1.1 - updated for Windows 2007-07-31
# 1.0 - initial release 2007-07-28

module Autotest::Sound
  @@sound_path = ''
  @@sound_app = 'mpg321'
  @@process_devnull = '> /dev/null 2>&1'
  @@process_bg = '&'
  
  def self.sound_path= o
    @@sound_path = o
  end

  def self.sound_app= o
    @@sound_app = o
  end
                                  
  def self.process_devnull= o
    @@process_devnull = o
  end

  def self.process_bg= o
    @@process_bg = o
  end
  
  def self.playsound file
    cmd = "#{@@sound_app} #{@@sound_path + file} #{@@process_devnull} #{@@process_bg}"
    system cmd
  end

  [:run, :red, :green, :quit, :run_command, :ran_command].each do |hook|
    Autotest.add_hook hook do |at|
      playsound "#{hook.to_s}.mp3" unless $TESTING
    end
  end
end
