#!/usr/bin/env ruby

require          'tempfile'
require          'fileutils'
require_relative 'update_base_image'

DOCKERFILE     = 'Dockerfile.in'.freeze
DOCKER_COMMAND = './docker_command'.freeze

Redo.ifchange 'docker_command'

tmpfile = Tempfile.new File.basename($PROGRAM_NAME)

File.open(DOCKERFILE).each do |l|
  tmpfile.puts FromUpdater.update l
end

FileUtils.mv tmpfile.path, DOCKERFILE
