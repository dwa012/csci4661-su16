class ToughWorkJob < ActiveJob::Base
  queue_as :default

  def perform(user)
    sleep 10.seconds
    puts user.id
  end
end
