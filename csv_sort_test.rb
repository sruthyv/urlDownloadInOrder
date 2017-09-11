require "minitest/autorun" 
require "./csv_sort"
class CsvSortTest < Minitest::Test
    def setup
        @array=CsvSort.new
        @result=@array.mergesort(['d','a'])
        @correct=['a','d']
    end
    def test_is_file_sorted
        assert_equal @correct,@result
    end
end
