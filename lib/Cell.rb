require 'csv'

class Cell
  attr_accessor :oem, :model, :launch_announced, :launch_status, :body_dimensions, :body_weight, :body_sim, :display_type, :display_size, :display_resolution, :features_sensors, :platform_os

  def initialize(oem, model, launch_announced, launch_status, body_dimensions, body_weight, body_sim, display_type, display_size, display_resolution, features_sensors, platform_os)
    @oem = oem
    @model = model
    @launch_announced = launch_announced
    @launch_status = launch_status
    @body_dimensions = body_dimensions
    @body_weight = body_weight
    @body_sim = body_sim
    @display_type = display_type
    @display_size = display_size
    @display_resolution = display_resolution
    @features_sensors = features_sensors
    @platform_os = platform_os
  end

# Method to transform launch_announced column to integer year
def transform_launch_announced
  return if @launch_announced.nil? || @launch_announced.strip.empty? || @launch_announced.strip == '-'

  # Check if the string contains a 4-digit year anywhere in it
  year_match = @launch_announced.match(/\b\d{4}\b/)

  # If a 4-digit year is found, assign it to launch_announced, otherwise set it to nil
  @launch_announced = year_match ? year_match[0].to_i : nil
end


  # Method to transform body_weight column to float and set short strings to nil
  def transform_body_weight
    if @body_weight.nil? || @body_weight.strip.empty?
      @body_weight = nil
    elsif @body_weight.strip == '-'
      @body_weight = nil
    elsif @body_weight.strip.length < 2
      @body_weight = nil
    else
      @body_weight = @body_weight.to_f if @body_weight.match(/^\d+(\.\d+)?/)
      @body_weight = nil if @body_weight.to_s.empty?
    end
  end

  # Method to transform display_size column to float
  def transform_display_size
    return if @display_size.nil? || @display_size.strip.empty? || @display_size.strip == '-'
    @display_size = @display_size.to_f if @display_size.match(/^\d+(\.\d+)? inches?/)
    @display_size = nil if @display_size.to_s.empty?
  end

  # Method to transform launch_status column to proper format
  def transform_launch_status
    return if @launch_status.nil? || @launch_status.strip.empty? || @launch_status.strip == '-'
    @launch_status = @launch_status.gsub(/Available\. Released (\d{4}).*/, 'Available. Released \1') if @launch_status.match(/Available\. Released \d{4}/)
    @launch_status = nil if !@launch_status.match(/(Discontinued|Cancelled|Available. Released \d{4})/)
  end

  # Method to transform platform_os column to proper format
  def transform_platform_os
    return if @platform_os.nil? || @platform_os.strip.empty? || @platform_os.strip == '-'
    @platform_os = @platform_os.match(/\A[^,]+/).to_s if @platform_os.match(/\A[^,]+/)
    @platform_os = nil if @platform_os.to_s.empty?
  end

  # Method to transform body_dimensions column and set specific strings to 12345
  def transform_body_dimensions
    if @body_dimensions.nil? || @body_dimensions.strip.empty? || @body_dimensions.strip == '-' || @body_dimensions.downcase.include?('mm')
      @body_dimensions = nil
    end
  end

  # Method to transform body_sim column to nil if it's "no" or "yes" (case-insensitive)
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

  def transform_body_sim
    return if @body_sim.nil? || @body_sim.strip.empty?

    # Convert the value to lowercase for case-insensitive comparison
    body_sim_lower = @body_sim.downcase

    # Check if the value is "no" or "yes"
    if body_sim_lower == "no" || body_sim_lower == "yes"
      @body_sim = nil
    end
  end

  # Method to save transformed data to a new CSV file
  def self.save_to_csv(cells, filename)
    CSV.open(filename, "wb") do |csv|
      csv << ["oem", "model", "launch_announced", "launch_status", "body_dimensions", "body_weight", "body_sim", "display_type", "display_size", "display_resolution", "features_sensors", "platform_os"]
      cells.each do |cell|
        csv << [cell.oem, cell.model, cell.launch_announced, cell.launch_status, cell.body_dimensions, cell.body_weight, cell.body_sim, cell.display_type, cell.display_size, cell.display_resolution, cell.features_sensors, cell.platform_os]
      end
    end
  end
end

# Read and clean CSV data
def read_csv(input_filename, output_filename)
  unique_cells = {}

  CSV.foreach(input_filename, headers: true) do |row|
    data = row.to_h.values
    cell = Cell.new(*data)
    cell.transform_launch_announced
    cell.transform_body_weight
    cell.transform_display_size
    cell.transform_launch_status
    cell.transform_platform_os
    cell.transform_body_dimensions  # Call the new method to transform body_dimensions
    key = [cell.oem, cell.model, cell.launch_announced]
    unique_cells[key] = cell unless unique_cells.key?(key)
  end

  Cell.save_to_csv(unique_cells.values, output_filename)
end
