
class WriteFile

    def write_file(filename,body)
        File.open(filename, 'w') { |file| file.puts(body) }
    end
end
