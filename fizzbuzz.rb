(1..100).each do |num|
  if (num % 3).zero? && (num % 5).zero?
    puts 'fizzbuzz'
  elsif (num % 3).zero?
    puts 'fizz'
  elsif (num % 5).zero?
    puts 'buzz'
  else
    puts num
  end
end
