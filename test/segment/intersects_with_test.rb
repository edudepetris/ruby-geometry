require 'test/unit'
require 'geometry'

class IntersectsTest < Test::Unit::TestCase
  include Geometry

  #      |
  #      |
  # -----+-----
  #      |
  #      |
  def test_segments_intersect
    segment1 = Segment.new_by_arrays([0, 0], [2, 0])
    segment2 = Segment.new_by_arrays([1, 1], [1, -1])

    assert segment1.intersects_with?(segment2)
  end

  #   |
  #   |  ------
  #   |
  def test_segments_does_not_intersect_but_lay_on_intersecting_lines
    segment1 = Segment.new_by_arrays([0, 0], [0, 2])
    segment2 = Segment.new_by_arrays([1, 1], [3, 1])

    assert ! segment1.intersects_with?(segment2)
  end
  
  # ---
  #  |
  #  |
  #  |
  # ---  |---------|
  def test_segments_does_not_intersect_but_line_contains_end_point
    segment1 = Segment.new_by_arrays([0, 0], [0, 2])
    segment2 = Segment.new_by_arrays([1, 0], [3, 0])

    assert ! segment1.intersects_with?(segment2)
  end

  # --------
  # --------
  def test_segments_parralel
    segment1 = Segment.new_by_arrays([0, 1], [2, 1])
    segment2 = Segment.new_by_arrays([0, 0], [2, 0])
    
    assert ! segment1.intersects_with?(segment2)
  end

  #    /
  #   /
  #  /
  # *--------
  def test_segment_contains_endpoint
    segment1 = Segment.new_by_arrays([0, 0], [2, 2])
    segment2 = Segment.new_by_arrays([0, 0], [2, 0])
    
    assert segment1.intersects_with?(segment2)
  end

end