require "minitest/autorun" 
require_relative "write_file"
class WriteFileTest < Minitest::Test

    def setup
        @fileWrite=WriteFile.new
        @fileWrite.write_file("test_write_file",['a','b','c','d'])

        File.open("test_file_compare", 'w') { |file| file.puts(['a','b','c','d']) }

        file1= File.open("test_write_file") or die "Unable to open file..."
        @testWriteArray = []
        file1.each_line { |line| @testWriteArray.push(line)}
        
        file2 = File.open("test_file_compare") or die "Unable to open file..."
        @compareArray = []
        file2.each_line { |line| @compareArray.push(line)}
    end                        
    def test_is_file_written
        assert_equal @testWriteArray, @compareArray 
    end
end