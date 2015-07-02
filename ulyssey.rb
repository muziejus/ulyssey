require 'twitter'
require 'yaml'

class Ulyssey

  def initialize
    set_configs
    @since_id = @configs[:since_id].to_i
  end

  def random_sentence # creates a random sentence of under 140 characters
  end

  def replies
    start_client
    @replies ||= get_replies
  end

  def update_since_id(id = @since_id)
    @configs[:since_id] = id
    File.open('configs.yml', 'w') do |file|
      file.puts YAML::dump(@configs)
    end
  end

  def tweet(text, reply_id = nil)
    start_client
    @client.update(text, {in_reply_to_status_id: reply_id})
  end

  private 
  def start_client
    @client ||= Twitter::REST::Client.new do |config|
      config.consumer_key = @configs[:consumer_key]
      config.consumer_secret = @configs[:consumer_secret]
      config.access_token = @configs[:access_token]
      config.access_token_secret = @configs[:access_token_secret]
    end
  end

  def get_replies
    @since_id == 0 ? reply_opts = {} : reply_opts = { since_id: @since_id }
    @client.mentions(reply_opts)
  end

  def set_configs
    if File.exists? 'configs.yml'
      @configs = YAML::load_file 'configs.yml'
    else
      raise "No configs file"
    end
  end

end


