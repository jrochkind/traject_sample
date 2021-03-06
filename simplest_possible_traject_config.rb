# A traject file is (a) totally self-contained, 
# and (b) just uses a debug writer to write things out.

# For a more complete example of indexing code, look at
# the index.rb file in this directory


# You can run this against a binary marc file 'myfile.mrc' as:
#
#     traject -c ./simplest_possible_traject_config myfile.mrc





# Set up a reader and a writer
# First we need to require the reader/writer we want

require 'traject'
require 'traject/marc_reader'
require 'traject/debug_writer'


# The add the appropriate settings
settings do
  provide "reader_class_name", "Traject::MarcReader"
  provide "writer_class_name", "Traject::DebugWriter"
  provide "output_file", "out.txt"
  provide 'processing_thread_pool', 2
  
  # Right now, logging is going to $stderr. Uncomment
  # this line to send it to a file
  
  # provide 'log.file', 'traject.log'
  
end



# Log what version of jruby/java we're using

logger.info RUBY_DESCRIPTION


# index the id and the title

to_field "id", extract_marc("001", :first => true)
to_field "title", extract_marc('245')

# That's it!
