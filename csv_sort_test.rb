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
    def test_is_array_merged
        @array1=['a','b']
        @array2=['c','d']
        @compareArray=['a','b','c','d']
        @resultArray=@array.merge(@array1,@array2)
        assert_equal @resultArray,@compareArray

    end
end
