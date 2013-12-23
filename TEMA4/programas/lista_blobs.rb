#!/usr/bin/ruby

require "azure"

puts "\nGENERADOR DE LISTADO DE BLOBS EN LOS CONTENEDORES"
puts "================================================="

azure_blob_service = Azure::BlobService.new
containers = azure_blob_service.list_containers()

containers.each do |container|
	name = container.name + ".txt"

	File.open(name, "w") do |list|

		list.puts container.name + ":"
		list.puts "=" * container.name.length

		blobs = azure_blob_service.list_blobs(container.name)

		blobs.each do |blob|
			list.puts "\t" + blob.name
		end
	end

	content = File.open(name, "rb") { |file| file.read }
	blob = azure_blob_service.create_block_blob(container.name, name, content)
	puts "\tSubido archivo " + blob.name
end

puts "\n"
