require 'net/http'
require_relative 'write_file'
class CsvDownload
    def csv_download
        Net::HTTP.start("s3.amazonaws.com") do |http|
            content = http.get("http://s3.amazonaws.com/alexa-static/top-1m.csv.zip")
            @write=WriteFile.new
            @write.write_file("csvZipFile.zip",content)
        puts"csv file downloaded"
        end
    end
end

