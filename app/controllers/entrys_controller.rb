class EntrysController < ApplicationController
  def index
    logger.info @controller
    logger.info @action
  end
end
