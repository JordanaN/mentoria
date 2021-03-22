require 'logger'

class Logger
  def initialize(format, delivery)
    @format = format
    @delivery = delivery
  end

  def log(string)
    deliver(format(string))
  end

  private

  def format(string)
    case @format
    when :without_formatting
      string
    when :with_date
      "#{Time.now} #{string}"
    when :with_date_and_details
      "Log was creates at #{Time.now}, please check details #{string}"
    else
      raise NotImplementedError
    end
  end

  def deliver(text)
    case @delivery
    when :by_email
      puts "Enviado email"
    when :by_sms
      puts "Enviado por SMS"
    when :to_stdout
      STDOUT.write(text)
    else
      raise NotImplementedError
    end
  end
end

logger = Logger.new(:without_formatting, :to_stdout)
logger.log('Emergency error! Please fix me!')
