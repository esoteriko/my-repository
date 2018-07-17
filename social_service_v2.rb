require 'elasticsearch'

def client
    Elasticsearch::Client.new trace: true
end

@a = 1
puts '¿Cuantos dias asististe a tu servicio social?'
@dias = gets.chomp

 while @a <= @dias.to_i 
      puts '¿Que fecha asistio?'
      date = gets.chomp
      puts '¿Cuantas horas asistio ese dia?'
      hours = gets.chomp
      client.index index:'horarios_v1', type:'datos', id: @a, body:{date: date, hours: hours}   
    @a = @a+1
 end
 @b = 1
while @b <= @dias.to_i
    results = client.search( index: 'horarios_v1', type: 'datos', body: { query: {match: {_id: 1 }}})
     suma_uno = results ['hits']['hits'][0]['_source']['hours'] 
     @horas_totales = suma_uno.to_i + @horas_totales.to_i
     puts @suma_uno
     @b = @b + 1
end

puts "Has hecho #{@horas_totales} horas."
@horas_totales = 480 - @horas_totales
dias_faltantes = @horas_totales / 7
puts "Te faltan estos dias para terminar #{dias_faltantes}"



