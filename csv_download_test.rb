require "minitest/autorun" 
require_relative "csv_download"
class CsvDownloadTest < Minitest::Test
    def setup
        @download=CsvDownload.new
        @download.csv_download
    end                        
    def test_is_file_downloaded  
        assert File.exist?("/home/user/urlDownloadInOrder/csvZipFile.zip"),true
    end
end



