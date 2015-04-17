class ActAsCSV
	def self.act_as_csv
		define_method 'read' do
			file = File.new(self.class.to_s.downcase+'.txt')
			@headers = file.gets.chomp.split(', ')
			file.each {|line| @results << line.chomp.split(', ')}
		end

		define_method 'headers' do
			@headers
		end

		define_method 'csv_contents' do
			@results
		end

		define_method 'initialize' do
			@results = []
			@headers = []
			read
		end

		define_method 'each' do | &block|
			csv_contents.each{|row| block.call(CsvRow.new(@headers,row))}
		end
	end
end

class CsvRow
	def initialize headers, row
		@row = {}
		headers.each_index { |i| @row[headers[i]] = row[i] }
	end
	def method_missing name, *args
		@row[name.to_s]
	end
end

class RubyFile < ActAsCSV
	act_as_csv
end

file = RubyFile.new
puts file.headers.inspect
# puts file.csv_contents.inspect

file.each{|row| puts row.one + ', ' + row.two}
