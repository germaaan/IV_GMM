#!/usr/bin/ruby
# -*- coding: utf-8 -*-

require 'net/http'

	def fecha()
		response = Net::HTTP.get_response(ARGV[0],'/')     
		return response['date'].to_s
	end

	def contenido()
		response = Net::HTTP.get_response(ARGV[0],'/')     
		return response['content-type'].to_s
	end

	def servidor()
		response = Net::HTTP.get_response(ARGV[0],'/')     
		return response['server'].to_s
	end

	url = ARGV[0]
	puts "URL introducida: " << url
	puts "Fecha de envío de petición: " << fecha()
	puts "Tipo MIME del contenido: " << contenido()
	puts "Servidor del sitio web: " << servidor()
