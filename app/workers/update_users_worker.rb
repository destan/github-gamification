class UpdateUsersWorker
  @queue = :update_users

  def self.perform(*args)
    User.all.each do |user|
      Resque.enqueue(ParseUserActivityWorker, user.id)
    end
  end
end