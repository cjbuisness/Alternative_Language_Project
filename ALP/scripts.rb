require_relative 'Cells'

# Specify input and output filenames
input_filename = "cell_phones.csv"
output_filename = "output_file.csv"

# Read and clean CSV data, and save to a new CSV file
read_csv(input_filename, output_filename)
