require_relative 'Cell'

# Specify input and output filenames with correct paths
input_filename = File.expand_path('../data/sell.csv', __dir__)
output_filename = File.expand_path('../output/output_file.csv', __dir__)

# Read and clean CSV data, and save to a new CSV file
read_csv(input_filename, output_filename)
