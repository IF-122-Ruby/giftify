class SetPublishedWorker
  include Sidekiq::Worker

  def perform
    Post.where('published_at <= ?', Time.now).where(is_published: false).update_all(is_published: true)
  end
end