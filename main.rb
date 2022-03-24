class AnalisadorLinha

  attr_accessor :number, :bigger_frequency, :words
  
  def initialize (number, line)
    @number = number
    @line = line
  end

  def analysis
    temp_words = {}
    @bigger_frequency = 0
    
    @line.split.each do |word|
      temp_words[word] = temp_words.has_key?(word) ? 1+temp_words[word] : 1
      @bigger_frequency = temp_words[word] if @bigger_frequency < temp_words[word]
    end

    @words = []
    temp_words.each {|word, idx| @words << word if idx == @bigger_frequency }
  end
end

analisadorLinhas = []
File.open("file.txt").each do |lineValue|
  analisadorLinhas.push AnalisadorLinha.new($., lineValue.rstrip)
end

analisadorLinhas.each do |a|
  a.analysis
  puts "##{a.number} Line"
  puts "Repetitions: #{a.bigger_frequency}"
  puts "Most repeated: '#{a.words}'"
end