require 'test_helper'

class GifTest < ActiveSupport::TestCase
  test "Can be assigned a list of tags" do
    gif = Gif.new(tag_list: "one,two,three")
    assert_equal ["one","two","three"], gif.tag_list
  end

  test "Can be assigned on image" do
    gif = Gif.create(image: File.open("test/files/image.gif", "rb"))
    assert_equal "image/gif", gif.image.mime_type
  end

  test "requires at least one tag" do
    gif = Gif.new user: users(:one), image_data: TestData.image_data
    assert_not gif.valid?
    assert_equal ["Must have a least one tag"], gif.errors[:tag_list]
  end

  test "requires an image" do
    gif = Gif.new user: users(:one), tag_list: "test"
    assert_not gif.valid?
    assert_equal ["can't be blank"], gif.errors[:image_data]
  end
end
