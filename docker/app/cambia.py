#  This function tokenlizes the CSV content line by line
#  into an array of  list of words after stripping off the
#  whitespace, including new line characters.  It then 
#  sorts the line word list in an ascending order.  Finally,
#  it writes out the word lists into csv lines in the output
#  file.

import sys

def sortCSVContents(input_file, output_file):
   # Read in the file content line by line
   try:
      with open(input_file) as file_input:
         lines = file_input.readlines()
   except FileNotFoundError:
      print(f'FileNotFoundError: {input_file} not present') 
      return

   # Assuming the file content is in csv format,
   # Removes the preceding and trailing whitespaces.
   # Then, we split, sort the words ascendingly
   DELIMITER = ','
   lines_out = []
   for line in lines:
      line = line.strip()
      line = line.split(DELIMITER)
      line.sort(reverse=True)
      lines_out.append(line)

   # Then, we rejoin the words with the comma delimiter
   # and write out to the output file.
   with open(output_file, 'w') as file_out:
      for list in lines_out:
         file_out.write(DELIMITER.join(list))
         file_out.write('\n')

if __name__ == '__main__':
   if len(sys.argv) < 3:
      raise ArgumentError

   _, input_file, output_file = sys.argv
   sortCSVContents(input_file, output_file)
