require 'selenium-webdriver'

wd = Selenium::WebDriver.for :chrome
wd.navigate.to 'https://static.vecteezy.com/system/user_svg_versions/svgs/000/000/130/original/609eccd0-1bc9-4a05-b3e2-b5c1b85d281e.svg?1483650206'

# Get the actual page dimensions using javascript
#
width  = wd.execute_script("return document.getElementsByTagName('svg')[0].getBoundingClientRect().width;")
height = wd.execute_script("return document.getElementsByTagName('svg')[0].getBoundingClientRect().height;")

# Add some pixels on top of the calculated dimensions for good
# measure to make the scroll bars disappear
#
wd.manage.window.resize_to(width, height)

img = wd.screenshot_as(:png)

File.open('full-page.png', 'wb') do |fh|
  fh.write img
end

wd.quit
