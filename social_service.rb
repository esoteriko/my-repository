require 'elasticsearch'

def client
	client = Elasticsearch::Client.new trace: true
end

@date = gets
@hours = gets
client.index index: 'horas_v1', type: 'datos', body:{date: @date, hours: @hours}

puts 'hola que tal'
