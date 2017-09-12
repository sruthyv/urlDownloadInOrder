require 'csv'
require 'rubygems'
require 'zip'
require_relative 'csv_download'
require_relative 'csv_unzip'
require_relative 'write_file'

class CsvSort
    puts "SORTED LIST:::::::::::::::::::"
    def mergesort(list)
        # puts list
        return list if list.size <= 1
        mid   = list.size / 2
        left  = list[0, mid]
        right = list[mid, list.size]
        merge(mergesort(left), mergesort(right))
    end
  
    def merge(left, right)
        sorted = []
        until left.empty? || right.empty?
            if left.first <= right.first
                sorted << left.shift
            else
                sorted << right.shift
            end
        end
        @sortedlist=sorted.concat(left).concat(right)
    end
    def returnSortedList
        return @sortedlist
    end
end
@downloadFile=CsvDownload.new
@downloadFile.csv_download

@unzipList=CsvUnzip.new
@unzipList.csv_unzip("top.zip", "/home/user/urlDownloadInOrder")
@arraySortList=@unzipList.returnUnzipList

@sortList=CsvSort.new
@sortList.mergesort(@arraySortList)
@resultSort=@sortList.returnSortedList

@write=WriteFile.new
@write.write_file("sortingList",@resultSort)




