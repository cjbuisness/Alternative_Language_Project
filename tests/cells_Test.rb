# cells_Test.rb

require 'minitest/autorun'
require_relative '../lib/Cell'

class TestCell < Minitest::Test
  def setup
    @cell = Cell.new('oem', 'model', '2024-01-01', 'Available. Released 2024', '200x100x10 mm', '200 g', 'Yes', 'LCD', '6.5 inches', '1080x1920 pixels', 'Fingerprint', 'Android 11')
  end

  def test_file_not_empty
    csv_file_path = File.expand_path('../../data/sell.csv', __FILE__)
    refute_empty CSV.read(csv_file_path)
  end

  def test_transform_launch_announced
    @cell.transform_launch_announced
    assert_instance_of Integer, @cell.launch_announced
  end

  def transform_body_weight
    if @body_weight.nil? || @body_weight.strip.empty?
      @body_weight = nil
    elsif @body_weight.strip == '-'
      @body_weight = nil
    elsif @body_weight.strip.length < 2 || @body_weight.strip.match(/^\d+(\.\d+)?$/)
      @body_weight = nil
    else
      @body_weight = @body_weight.to_f
    end
  end

  def test_transform_display_size
    @cell.transform_display_size
    assert_instance_of Float, @cell.display_size
  end

  def test_transform_launch_status
    @cell.transform_launch_status
    assert_match(/Available\. Released \d{4}/, @cell.launch_status)
  end

  def test_transform_platform_os
    @cell.transform_platform_os
    assert_instance_of String, @cell.platform_os
  end

  def test_transform_body_dimensions
    @cell.transform_body_dimensions
    assert_nil @cell.body_dimensions  
  end

  def test_transform_body_sim
    @cell.transform_body_sim
    assert_nil @cell.body_sim  
  end
end
