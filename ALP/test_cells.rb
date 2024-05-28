require 'csv'
require_relative 'Cells'

describe Cell do
  let(:cell_data) do
    {
      oem: "Apple",
      model: "iPhone 12",
      launch_announced: "2020",
      launch_status: "Available. Released 2020",
      body_dimensions: "146.7 x 71.5 x 7.4 mm (5.78 x 2.81 x 0.29 in)",
      body_weight: "164 g (5.78 oz)",
      body_sim: "No",
      display_type: "Super Retina XDR OLED, HDR10, Dolby Vision, 625 nits (typ), 1200 nits (peak)",
      display_size: "6.1 inches, 90.2 cm2 (~86.0% screen-to-body ratio)",
      display_resolution: "1170 x 2532 pixels, 19.5:9 ratio (~460 ppi density)",
      features_sensors: "Face ID, accelerometer, gyro, proximity, compass, barometer",
      platform_os: "iOS 14.1, upgradable to iOS 14.2"
    }
  end

  describe "#transform_launch_announced" do
    it "transforms launch_announced column to integer year" do
      cell = Cell.new(cell_data)
      cell.transform_launch_announced
      expect(cell.launch_announced).to eq(2020)
    end
  end

  describe "#transform_body_weight" do
    it "transforms body_weight column to float" do
      cell = Cell.new(cell_data)
      cell.transform_body_weight
      expect(cell.body_weight).to eq(164.0)
    end
  end

  describe "#transform_display_size" do
    it "transforms display_size column to float" do
      cell = Cell.new(cell_data)
      cell.transform_display_size
      expect(cell.display_size).to eq(6.1)
    end
  end

  describe "#transform_launch_status" do
    it "transforms launch_status column to proper format" do
      cell = Cell.new(cell_data)
      cell.transform_launch_status
      expect(cell.launch_status).to eq("Available. Released 2020")
    end
  end

  describe "#transform_platform_os" do
    it "transforms platform_os column to proper format" do
      cell = Cell.new(cell_data)
      cell.transform_platform_os
      expect(cell.platform_os).to eq("iOS 14.1")
    end
  end

  describe "#transform_body_dimensions" do
    it "transforms body_dimensions column and sets specific strings to nil" do
      cell = Cell.new(cell_data)
      cell.transform_body_dimensions
      expect(cell.body_dimensions).to eq(nil)
    end
  end

  describe "#transform_body_sim" do
    it "sets body_sim to nil if it's 'No' or 'Yes'" do
      cell = Cell.new(cell_data.merge(body_sim: "No"))
      cell.transform_body_sim
      expect(cell.body_sim).to eq(nil)

      cell = Cell.new(cell_data.merge(body_sim: "Yes"))
      cell.transform_body_sim
      expect(cell.body_sim).to eq(nil)
    end
  end
end
