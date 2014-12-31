begin
  # Get the tag from git
  version_tag = `git describe`.chomp

  # Match the version, the format might either be just a tag, or if the tag is not
  # a 100% match on the commit hash, it will be in a format like this:
  # v1.2.3-74-abcd1234 meaning [tag]-[commits after tag]-[tag's commit hash]
  version = /v?((?:[0-9]+\.){2}[0-9]+)/i.match(version_tag)

  # If a version was found, use it as application version
  if version[1]
    APPLICATION_VERSION = version[1]
  else
    Rails.logger.warn "Could not get version from git tag '#{version_tag}' got '#{version[1]}' instead"
    APPLICATION_VERSION = 'unknown'
  end
rescue
  Rails.logger.warn 'Could not get tag from git'
end
