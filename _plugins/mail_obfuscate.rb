require "base64"
require "uri"

module ObfuscateMailAddress
  def mailObfuscate(input)
    base64Mail = Base64.strict_encode64(Addressable::URI.encode(input))

    output = "<a href=\"#\" "
    output += "data-contact=\"#{base64Mail}\" target=\"_blank\" "
    output += "onfocus=\"this.href = 'mailto:' + atob(this.dataset.contact)\">"
    return output
  end
end

Liquid::Template.register_filter(ObfuscateMailAddress)