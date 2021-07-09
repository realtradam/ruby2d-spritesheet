require 'ruby2d'

# Number of sprites in the sheet, automatically gets calculated
@iter = 0 

# Displays the sprite index
@text = Text.new(
  @iter,
  x:0, y: 0,
  size: 20,
)

# Amount of sprites in rows/columns
@rows = 13
@columns = 23

# Size of an individual sprite
@width = 64
@height = 64

# Holds manual coordinates
@animations = {}

# Generates the manual coordinates
(0...@rows).each do |row|
  (0...@columns).each do |column|
    @animations[@iter] = [{
      x: column * @width, y: row * @height,
      width: @width, height: @height
    }]
    @iter += 1
  end
end

# The sprite
@sprite = Sprite.new(
  'sheet.png',
  x: 50, y:50,
  clip_width: 64,
  clip_height: 64,
  time: 300,
  animations: @animations
)

# The frame number of Ruby2D
@frame = 0

update do
  @frame += 1
  
  # Displays a new sprite every half a second
  @sprite.play(
    animation: ((@frame/30) % @iter),
    loop: true
  )
  @text.text = ((@frame/30) % @iter)

end

show
