require_relative 'common'
require "byebug"

class Day20 < AdventDay
  def first_part
    image_enhancement_algorithm = input[0]
    image = input[2..]
    # puts image
    new_image = add_edge_dark(image)
    # puts new_image.map{|arr| arr.join}
    duplicate_image = img_enhance(new_image, image_enhancement_algorithm)
    # puts duplicate_image.map{|arr| arr.join}
    duplicate_image = reduce_edge(duplicate_image).map{|arr| arr.join}
    # puts duplicate_image
    # image.join.count("#")
    # check_index(4, 4, new_image)
    new_image2 = add_edge_light(duplicate_image)
    # puts new_image2.map{|arr| arr.join}
    duplicate_image2 = reduce_edge(img_enhance(new_image2, image_enhancement_algorithm)).map{|arr| arr.join}
    # puts duplicate_image2
    duplicate_image2.flatten.join.count("#")
  end

  def second_part
    image_enhancement_algorithm = input[0]
    image = input[2..]
    50.times do |n|
      if n % 2 == 0
        new_image = add_edge_dark(image)
        image = img_enhance(new_image, image_enhancement_algorithm)
        image = reduce_edge(image).map{|arr| arr.join}
      else
        new_image = add_edge_light(image)
        image = img_enhance(new_image, image_enhancement_algorithm)
        image = reduce_edge(image).map{|arr| arr.join}
      end
    end
    image.flatten.join.count("#")
  end

  private

  def img_enhance(new_image, image_enhancement_algorithm)
    duplicate_image = Marshal.load( Marshal.dump(new_image) )
    new_image[1..(new_image.size-2)].each_with_index do |arr, x|
      arr[1..(arr.size-2)].each_with_index do |pixel, y|
        index = check_index(x+1, y+1, new_image)
        new_pixel = image_enhancement_algorithm[index]
        duplicate_image[x+1][y+1] = new_pixel
      end
    end
    duplicate_image
  end

  def add_edge_dark(image)
    image_x = image.size
    image_y = image[0].size
    new_image = []
    new_image << "." * (image_y + 4)
    new_image << "." * (image_y + 4)
    image.each do |s|
      new_image << (".." + s + "..")
    end
    new_image << "." * (image_y + 4)
    new_image << "." * (image_y + 4)
    new_image.map{|s| s.split("")}
  end

  def add_edge_light(image)
    image_x = image.size
    image_y = image[0].size
    new_image = []
    new_image << "#" * (image_y + 4)
    new_image << "#" * (image_y + 4)
    image.each do |s|
      new_image << ("##" + s + "##")
    end
    new_image << "#" * (image_y + 4)
    new_image << "#" * (image_y + 4)
    new_image.map{|s| s.split("")}
  end

  def reduce_edge (image)
    image.delete_at(0)
    image.delete_at(-1)
    # byebug
    image = image.map do |arr|
      arr.shift
      arr.delete_at(-1)
      arr
    end
    image
  end

  def check_index(x,y,img)
    # (5,10) in the output image, nine pixels from the input image need to be considered: (4,9), (4,10), (4,11), (5,9), (5,10), (5,11), (6,9), (6,10), and (6,11)
    arr = [img[x-1][y-1], img[x-1][y], img[x-1][y+1], img[x][y-1], img[x][y], img[x][y+1], img[x+1][y-1], img[x+1][y], img[x+1][y+1]]
    # byebug
    arr = arr.map{ |e| e == "." ? "0" : "1" }
    # byebug
    to_decimal(arr.join)
  end

  def to_decimal(binary)
    raise ArgumentError if binary.match?(/[^01]/)

    binary.reverse.chars.map.with_index do |digit, index|
      digit.to_i * 2**index
    end.sum
  end

  def convert_data(data)
    super
  end

  def debug_input
    "..#.#..#####.#.#.#.###.##.....###.##.#..###.####..#####..#....#..#..##..###..######.###...####..#..#####..##..#.#####...##.#.#..#.##..#.#......#.###.######.###.####...#.##.##..#..#..#####.....#.#....###..#.##......#.....#..#..#..##..#...##.######.####.####.#.#...#.......#..#.#.#...####.##.#......#..#...##.#.##..#...##.#.##..###.#......#.#.......#.#.#.####.###.##...#.....####.#..#..#.##.#....##..#.####....##...##..#...#......#.#.......#.......##..####..#...#.#.#...##..#.#..###..#####........#..####......#..#\n\n#..#.\n#....\n##..#\n..#..\n..###"
  end

end

Day20.solve
