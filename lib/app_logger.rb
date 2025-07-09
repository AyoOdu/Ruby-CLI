# frozen_string_literal: true

require 'logger'
require 'fileutils'
require 'dotenv/load'

class AppLogger
  def initialize(log_folder = File.join(__dir__, '../tmp'), log_filename = 'app.log')
    FileUtils.mkdir_p(log_folder)
    log_path = File.join(log_folder, log_filename)

    @logger = Logger.new(log_path)
  end

  def info(message)
    @logger.info(message) if run_logger?
  end

  def error(message)
    @logger.error(message) if run_logger?
  end

  def warn(message)
    @logger.warn(message) if run_logger?
  end

  private

  def run_logger?
    ENV['LOGGER_ON'] == 'true'
  end
end
