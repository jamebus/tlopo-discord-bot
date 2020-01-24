require_relative 'redo-ruby/redo'

# Cache digests to bypass wasteful image pulls
class DigestCache
  @cache = {}

  def self.put(image, digest)
    @cache[image] = digest
  end

  def self.get(image)
    @cache[image]
  end
end

# Update an image
class ImageUpdater
  def initialize(image)
    @image = image
  end

  attr_reader :image, :digest

  def update
    cached = DigestCache.get @image
    return cached if cached

    DigestCache.put @image, /^Digest:\s+(.+)/.match(pull).captures.first
  end

  def pull
    STDERR.puts "Pulling #{@image}"
    Run.command('Image pull', DOCKER_COMMAND, 'pull', @image).first
  end
end

# Update a Dockerfile's FROM line to use the latest digest
class FromUpdater
  def initialize(line)
    @line  = line
    @image = parse
  end

  attr_reader :line

  def self.update(line)
    new(line).update.line
  end

  def parse
    return unless @line =~ /^FROM\s+/i

    /^FROM\s+([^@\s]+)/i.match(@line).captures.first
  end

  def update
    return self unless @image

    image_digest = ImageUpdater.new(@image).update

    STDERR.puts "Updating #{@image}"
    @line = @line.sub(/^(FROM\s+)\S+/i, "\\1#{@image}@#{image_digest}")

    self
  end
end
